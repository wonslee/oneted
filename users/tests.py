import jwt

from django.test        import TestCase, Client
from django.test        import Client
from unittest.mock      import patch, MagicMock

from users.models       import User, Bookmark
from resumes.models     import Apply, Resume
from jobpostings.models import JobPosting, Country, Region, Company, JobGroup, Job, Experience, Tag, TagCategory
from my_settings        import SECRET_KEY, ALGORITHM

class BookmarkTest(TestCase):
	def setUp(self):
		Country.objects.create(
			id   = 1,
			name = "한국"
		)
		Region.objects.create(
			id         = 1,
			country_id = 1,
			name       = "서울"
		)
		Company.objects.create(
			id             = 1,
			region_id      = 1,
			name           = "요기요",
			description    = "요기요",
			employee_count = 150,
			coordinate     = { "latitude" : "37.490276608139034", "longitude" : "127.00519275854258"}
		)
		Company.objects.create(
			id             = 2,
			region_id      = 1,
			name           = "요기요2",
			description    = "요기요2",
			employee_count = 150,
			coordinate     = {"latitude": "37.490276608139034", "longitude": "127.00519275854258"}
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
					"profile_needs_agreement": False,
						"profile": {
							"nickname": "홍길동",
							"thumbnail_image_url": "http://yyy.kakao.com/.../img_110x110.jpg",
							"profile_image_url": "http://yyy.kakao.com/dn/.../img_640x640.jpg",
							"is_default_image": False
						},
						"email_needs_agreement": False,
						"is_email_valid": True,
						"is_email_verified": True,
						"email": "sample@sample.com",
						"age_range_needs_agreement": False,
						"age_range": "20~29",
						"birthday_needs_agreement": False,
						"birthday": "1130"
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
						"profile_needs_agreement": False,
						"profile": {
							"nickname": "홍길동",
							"thumbnail_image_url": "http://yyy.kakao.com/.../img_110x110.jpg",
							"profile_image_url": "http://yyy.kakao.com/dn/.../img_640x640.jpg",
							"is_default_image": False
						},
						"email_needs_agreement": False,
						"is_email_valid": True,
						"is_email_verified": True,
						"email": "sample@sample.com",
						"age_range_needs_agreement": False,
						"age_range": "20~29",
						"birthday_needs_agreement": False,
						"birthday": "1130"
					}
				}

		mocked_requests.get = MagicMock(return_value=MockedResponse())
		response            = client.post("/users/kakaologin", content_type="applications/json", headers=headers)
		headers             = {"HTTP_AUTHORIZATION": ""}
		response            = client.post("/users/kakaologin", content_type="applications/json", headers=headers)

		self.assertEqual(response.status_code, 401)
		self.assertEqual(response.json(), {
			"message":"INVAID_ACCESS_TOKEN"
		})

class UserTest(TestCase):
    def setUp(self):
        JobGroup.objects.create(id=1, name="개발")
        Job.objects.create(id=1, job_group_id=1, name="nodeJS 개발자")
        Job.objects.create(id=2, job_group_id=1, name="프론트엔드 개발자")

        Country.objects.create(id=1, name="한국")
        Region.objects.create(id=1, country_id=1, name="서울")
        Region.objects.create(id=2, country_id=1, name="부산")

        Company.objects.create(
            id             = 1,
            region_id      = 1, 
            name           = "모두싸인", 
            description    = "모두싸인에 접속해 준비된 계약서를 업로드 한 후 계약 상대방의 이메일 주소 또는전화번호를 입력해 서명을 요청하면, 상대방은 이메일이나 카카오톡으로 링크를전달받습니다. 이 링크를 클릭해 전자서명을 하거나 전자 도장을 입력하면 계약이종료됩니다.", 
            employee_count = 178, 
            coordinate     = {"latitude":"37.490894843703074", "longitude":" 127.00574996913497"}
        )
        Company.objects.create(
            id              = 2,
            region_id       = 2, 
            name            = "카카오 뱅크", 
            description     = "모바퇴근제. http://www.visual.camp", 
            employee_count  = 510, 
            coordinate      = {"latitude":"37.490894843703074", "longitude":"127.00574996913497"}
        )
        
        Experience.objects.create(id=1, name="신입")
        Experience.objects.create(id=2, name="1년차")

        TagCategory.objects.create(
            id                 = 1,
            name               = '편의시설',
            is_multiple_choice = True
        )
        t1 = Tag.objects.create(
            id              = 1,
            tag_category_id = 1,
            name            = '사내카페',
        )
        t2 = Tag.objects.create(
            id              = 2,
            tag_category_id = 1,
            name            = '수면실',
        )

        JobPosting.objects.create(
            id            = 1,
            job_id        = 1,
            experience_id = 1,
            company_id    = 1,
            title         = "카카오에서 백엔드 신입 (주니어) 구해요 !!!",
            salary        = 60000000,
            main_task     = "- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발",
            requirement   = "\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자"
        ).tags.add(t1)

        JobPosting.objects.create(
            id            = 2,
            job_id        = 2, 
            experience_id = 2, 
            company_id    = 2, 
            title         = "프론트엔드 신입 (1년차) 구할까 말까", 
            salary        = 50000000,
            main_task     = "- 모두싸인 백엔드 애플리케이션 설계 및 구현 \n- 더 나은 고객 경험을 제공하기 위한 서비스 개선 및 최적화 활동\n- 인하우스/백오피스  서비스 개발",
            requirement   = "\n- 한 가지 이상의 언어를 능숙하게 다루실 수 있는 분\n- RESTful API 개발 경험\n- SQL or NO-SQL 데이터베이스 경험\n- 다른 직무의 팀원과 적극적으로 대화할 수 있는 의사소통 태도와 능력\n- 장애 발생시 빠른 확인이 가능 한 트러블 슈팅 스킬\n- 새로운 것을 빠르게 배우고 호기심이 많으신 분\n- 해외여행 결격사유가 없는 분\n- 병역필 또는 면제자"
        ).tags.add(t2)

        User.objects.create(
            id              = 1,
            name            = "Homer Simpson",
            email           = "homer@google.com",
            kakao_api_id    = 1,
            profile_image   = "https://metro.co.uk/wp-content/uploads/2020/02/PRI_142406335-e1589297035275.jpg?quality=90&strip=all&zoom=1&resize=480%2C276"
        )
        r1 = Resume.objects.create(
            id          = 1,
            user_id     = 1,
            title       = "호머 심슨 이력서",
            is_done     = True,
            is_file     = False,
            file_uuid   = "1230897192837",
            content     = {
                "description" : "DDDDDDDDDDDDhough!",
                "career"      : "원자력 발전소 3년차",
                "education"   : "도넛대학교 2학년 중퇴",
                "skill"       : "마지 심슨 골려먹기",
            }
        )
        Apply.objects.create(user_id=1,job_posting_id=1).resume.add(r1)

    def tearDown(self):
        TagCategory.objects.all().delete()
        Tag.objects.all().delete()
        JobPosting.objects.all().delete()
        Job.objects.all().delete()
        JobGroup.objects.all().delete()
        Country.objects.all().delete()
        Region.objects.all().delete()
        Company.objects.all().delete()
        Experience.objects.all().delete()
        User.objects.all().delete()
        Apply.objects.all().delete()

    def test_user_get_success(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}

        response = client.get("/users/info", **headers)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message" :"SUCCESS",
            "result" : {
                'id': 1, 
                'name': 'Homer Simpson', 
                'email': 'homer@google.com', 
                'profileImage': 'https://metro.co.uk/wp-content/uploads/2020/02/PRI_142406335-e1589297035275.jpg?quality=90&strip=all&zoom=1&resize=480%2C276', 
                'applies': [{
                    'targetedPosting': {
                        'id': 1, 
                        'title':'카카오에서 백엔드 신입 (주니어) 구해요 !!!', 
                        'salary': 60000000, 
                        'experience': '신입', 
                        'imageUrl': None, 
                        'company': {
                            'id': 1, 
                            'name': '모두싸인', 
                            'region': '서울', 
                            'country': '한국'
                        }, 
                        'job': {
                            'id': 1, 
                            'name': 'nodeJS 개발자'
                        }
                    }
                }]
            }
        })
