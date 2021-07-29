import unittest
import json
import jwt

from django.test    	import TestCase
from django.test    	import Client
from unittest.mock  	import patch, MagicMock

from .models			import User, Bookmark
from jobpostings.models import JobPosting, Country, Region, Company, JobGroup, Job, Experience
from utils				import authorization
from my_settings		import SECRET_KEY, ALGORITHM

class BookmarkTest(TestCase):
	def setUp(self):
		Country.objects.create(
			id   = 1,
			name = "한국"
		)
		Region.objects.create(
			id 		   = 1,
			country_id = 1,
			name 	   = "서울"
		)
		Company.objects.create(
			id 			   = 1,
			region_id 	   = 1,
			name 		   = "요기요",
			description    = "요기요",
			employee_count = 150,
			coordinate 	   = { "latitude" : "37.490276608139034", "longitude" : "127.00519275854258"}
		)
		Company.objects.create(
			id 			   = 2,
			region_id 	   = 1,
			name           = "요기요2",
			description    = "요기요2",
			employee_count = 150,
			coordinate     ={"latitude": "37.490276608139034", "longitude": "127.00519275854258"}
		)
		Experience.objects.create(
			id   = 1,
			name = "1년"
		)
		JobGroup.objects.create(
			id   = 1,
			name = "개발"
		)
		Job.objects.create(
			id           = 1,
			job_group_id = 1,
			name         = "파이썬개발자"
		)
		JobPosting.objects.create(
			id            = 1,
			job_id        = 1,
			company_id    = 1,
			title         = "요기요",
			experience_id = 1,
			salary        = 36000000
		)
		JobPosting.objects.create(
			id            = 2,
			job_id        = 1,
			company_id    = 2,
			title         = "요기요2",
			experience_id = 1,
			salary        = 36000000
		)
		User.objects.create(
			id            = 1,
			name          = "홍길동",
			email         = "aaa@naver.com",
			profile_image = "aaaa.jpg"
		)
		Bookmark.objects.create(
			user_id        = 1,
			job_posting_id = 1
		)

	def tearDown(self):
		Bookmark.objects.all().delete()
		User.objects.all().delete()
		JobPosting.objects.all().delete()
		Job.objects.all().delete()
		Experience.objects.all().delete()
		Company.objects.all().delete()
		Region.objects.all().delete()
		Country.objects.all().delete()

	def test_bookmarkview_invalid_value_success(self):
		client      = Client()
		user        = User.objects.get(name="홍길동")
		encoded_jwt = jwt.encode({"user_id": user.id}, SECRET_KEY, algorithm=ALGORITHM)
		headers     = {"HTTP_AUTHORIZATION":f'{encoded_jwt}'}
		response    = client.post('/users/bookmark/1', **headers)

		self.assertEqual(response.status_code, 200)
		self.assertEqual(response.json(),{
			"message":"SUCCESS"
		})

	def test_bookmarkview_valid_value_success(self):
		client      = Client()
		user        = User.objects.get(name="홍길동")
		encoded_jwt = jwt.encode({"user_id": user.id}, SECRET_KEY, algorithm=ALGORITHM)
		headers     = {"HTTP_AUTHORIZATION":f'{encoded_jwt}'}
		response    = client.post('/users/bookmark/2', **headers)

		self.assertEqual(response.status_code, 201)
		self.assertEqual(response.json(),{
			"message":"SUCCESS"
		})

	def test_bookmarkview_invalid_user(self):
		client      = Client()
		encoded_jwt = jwt.encode({"user_id": 2}, SECRET_KEY, algorithm=ALGORITHM)
		headers     = {"HTTP_AUTHORIZATION":f'{encoded_jwt}'}
		response    = client.post('/users/bookmark/1', **headers)

		self.assertEqual(response.status_code, 400)
		self.assertEqual(response.json(),{
			"message":"INVALID_USER"
		})

	def test_bookmarkview_invalid_token(self):
		client   = Client()
		headers  = {"HTTP_AUTHORIZATION":f''}
		response = client.post('/users/bookmark/1', **headers)

		self.assertEqual(response.status_code, 401)
		self.assertEqual(response.json(),{
			"error":"INVALID_TOKEN"
		})

class kakaologin(TestCase):
	@patch("users.views.requests")
	def test_kakao_login_new_user_success(self, mocked_requests):
		client = Client()

		class MockedResponse():
			def json(self):
				return {
					"id": 1234567899,
					"kakao_account": {
						"profile_needs_agreement"   : False,
						"profile"                   : {
							"nickname"            : "홍길동",
							"thumbnail_image_url" : "http://yyy.kakao.com/.../img_110x110.jpg",
							"profile_image_url"   : "http://yyy.kakao.com/dn/.../img_640x640.jpg",
							"is_default_image"    : False
						},
						"email_needs_agreement"     : False,
						"is_email_valid"            : True,
						"is_email_verified"         : True,
						"email"                     : "sample@sample.com",
						"age_range_needs_agreement" : False,
						"age_range"                 : "20~29",
						"birthday_needs_agreement"  : False,
						"birthday"                  : "1130"
					}
				}

		mocked_requests.get = MagicMock(return_value=MockedResponse())
		headers             = {"HTTP_AUTHORIZATION": "fake access_token"}
		response            = client.post("/users/kakaologin",  content_type="applications/json", **headers)
		access_token        = response.json()["token"]
		user_info           = response.json()["user_info"]

		self.assertEqual(response.status_code, 200)
		self.assertEqual(response.json(), {
			'user_info' : user_info,
			'token': access_token
		})

	@patch("users.views.requests")
	def test_kakao_login_new_user_no_token(self, mocked_requests):
		client = Client()

		class MockedResponse():
			def json(self):
				return {
					"id": 1234567899,
					"kakao_account": {
						"profile_needs_agreement"   : False,
						"profile"                   : {
							"nickname"            : "홍길동",
							"thumbnail_image_url" : "http://yyy.kakao.com/.../img_110x110.jpg",
							"profile_image_url"   : "http://yyy.kakao.com/dn/.../img_640x640.jpg",
							"is_default_image"    : False
						},
						"email_needs_agreement"     : False,
						"is_email_valid"            : True,
						"is_email_verified"         : True,
						"email"                     : "sample@sample.com",
						"age_range_needs_agreement" : False,
						"age_range"                 : "20~29",
						"birthday_needs_agreement"  : False,
						"birthday"                  : "1130"
					}
				}

		mocked_requests.get = MagicMock(return_value=MockedResponse())
		headers             = {"HTTP_AUTHORIZATION": ""}
		response            = client.post("/users/kakaologin", content_type="applications/json", headers=headers)

		self.assertEqual(response.status_code, 401)
		self.assertEqual(response.json(), {
			"message":"INVAID_ACCESS_TOKEN"
		})