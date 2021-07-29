import json
import jwt

from django.test                    import TestCase, Client
from unittest.mock                  import MagicMock, patch
from django.core.files.uploadedfile import SimpleUploadedFile

from users.models   import User
from resumes.models import Resume
from my_settings    import SECRET_KEY, ALGORITHM

class ResumesTest(TestCase):
    def setUp(self):
        User.objects.create(
            id              = 1,
            name            = "Homer Simpson",
            email           = "homer@google.com",
            profile_image   = "https://metro.co.uk/wp-content/uploads/2020/02/PRI_142406335-e1589297035275.jpg?quality=90&strip=all&zoom=1&resize=480%2C276",
            kakao_api_id    = 1
        )

        Resume.objects.create(
            id          = 1,
            user_id     = 1,
            title       = "호머 심슨 이력서",
            is_done     = True,
            is_file     = False,
            file_uuid   = 123123,
            content     = {
                "description" : "DDDDDDDDDDDDhough!",
                "career" : "원자력 발전소 3년차",
                "education"  : "도넛대학교 2학년 중퇴",
                "skill" : "마지 심슨 골려먹기",
                })
        Resume.objects.create(
            id          = 2,
            user_id     = 1,
            title       = "호머 심슨 이력서",
            is_done     = True,
            is_file     = False,
            file_uuid   = 1231234,
            content     = {
                "description"   : "hi!",
                "career"        : "애아빠 5년차",
                "education"     : "도넛대학교 2학년 중퇴",
                "skill"         : "마지 심슨 골려먹기",
                })

    def test_resumes_get_success(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        response     = client.get("/resumes", content_type="application/json", **headers)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            'message': 'SUCCESS',
            'result': [
                {
                    'id'        : 1,
                    'title'     : '호머 심슨 이력서',
                    'isDone'    : True,
                    'isFile'    : False,
                    'fileUrl'   : None,
                },
                {
                    'id'        : 2,
                    'title'     : '호머 심슨 이력서',
                    'isDone'    : True,
                    'isFile'    : False,
                    'fileUrl'   : None,
                }
            ]
        })

    def test_resume_post_success(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        body_data    = {
            "title"         : "수요일의 이력서",
            "isDone"        : False,
            "description"   : "안녕하세요~",
            "career"        : "샘성전자 5년 근무",
            "education"     : "샘성대",
            "skill"         : "장고, 파이썬, 자바스크립트",
        }
        response = client.post("/resumes", content_type="text/html", data=json.dumps(body_data), **headers)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"message": "SUCCESS"})

    def test_resume_post_key_error(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        body_data    = {
            "title"         : "수요일의 이력서",
            "isDone"        : False,
            "description"   : "안녕하세요~",
        }
        response = client.post("/resumes", content_type="text/html", data=json.dumps(body_data), **headers)
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(),{"message" : "KEY_ERROR"})

    def test_resume_post_json_decode_error(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        response     = client.post("/resumes", **headers)
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(),{"message" : "JSON_DECODE_ERROR"})


class ResumeTest(TestCase):
    def setUp(self):
        User.objects.create(
            id              = 1,
            name            = "Homer Simpson",
            email           = "homer@google.com",
            kakao_api_id    = 1,
            profile_image   = "https://metro.co.uk/wp-content/uploads/2020/02/PRI_142406335-e1589297035275.jpg?quality=90&strip=all&zoom=1&resize=480%2C276"
        )
        Resume.objects.create(
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

    def tearDown(self):
        User.objects.all().delete()
        Resume.objects.all().delete()

    def test_resume_get_success(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        response     = client.get("/resumes/1", content_type="application/json", **headers)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            'message'   : 'SUCCESS',
            'result'    : {
                'title'     : '호머 심슨 이력서',
                'isDone'    : True,
                'isFile'    : False,
                'fileUrl'   : None,
                'fileUuid': '1230897192837',
                'content'   : {
                    'skill'      : '마지 심슨 골려먹기',
                    'career'     : '원자력 발전소 3년차',
                    'education'  : '도넛대학교 2학년 중퇴',
                    'description': 'DDDDDDDDDDDDhough!'
                    },
                'user'  : {
                    'name'  : 'Homer Simpson',
                    'email' : 'homer@google.com'
                    }
            }
        })

    def test_resume_get_not_found_error(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        response     = client.get("/resumes/1000", content_type="application/json", **headers)

        self.assertEqual(response.status_code, 401)
        self.assertEqual(response.json(), {'message' : 'RESUME_NOT_FOUND'})

    def test_resume_patch_success(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        response = client.delete("/resumes/1", **headers)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"message": "SUCCESS"})

    def test_resume_patch_key_error(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        response = client.delete("/resumes/1000", **headers)

        self.assertEqual(response.status_code, 401)
        self.assertEqual(response.json(), {"message" : "RESUME_NOT_FOUND"})

    def test_resume_delete_success(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        response = client.delete("/resumes/1", **headers)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"message": "SUCCESS"})

    def test_resume_delete_not_found(self):
        client       = Client()
        access_token = jwt.encode(payload={"user_id" : 1}, key=SECRET_KEY, algorithm=ALGORITHM)
        headers      = {'HTTP_AUTHORIZATION': access_token}
        response = client.delete("/resumes/1000", **headers)

        self.assertEqual(response.status_code, 401)
        self.assertEqual(response.json(), {"message": "RESUME_NOT_FOUND"})

class UploadTest(TestCase):
    def setUp(self):
        User.objects.create(
                    id              = 1,
                    name            = "Homer Simpson",
                    email           = "homer@google.com",
                    profile_image   = "https://metro.co.uk/wp-content/uploads/2020/02/PRI_142406335-e1589297035275.jpg?quality=90&strip=all&zoom=1&resize=480%2C276",
                    kakao_api_id    = 1
                )
        Resume.objects.create(
            id=1,
            user_id=1,
            title="호머 심슨 이력서",
            is_done=True,
            is_file=True,
            file_uuid="1230897192837",
            content={
                "description": "DDDDDDDDDDDDhough!",
                "career": "원자력 발전소 3년차",
                "education": "도넛대학교 2학년 중퇴",
                "skill": "마지 심슨 골려먹기",
            }
        )
    def tearDown(self):
        User.objects.all().delete()
        Resume.objects.all().delete()

    @patch('resumes.views.boto3.client')
    def test_resume_s3_upload_success(self, mocked_s3_client):
        client = Client()
        user = User.objects.get(name="Homer Simpson")
        access_token = jwt.encode({'user_id': user.id}, SECRET_KEY, algorithm=ALGORITHM)

        class MockedResponse:
            def upload(self):
                return None

        my_file = SimpleUploadedFile(
            'file.jpg',
            b'file_content',
            content_type='image/jpg'
        )

        headers = {'HTTP_AUTHORIZATION': access_token, 'format': ' multipart'}
        body = {'resume': my_file}
        mocked_s3_client.upload = MagicMock(return_value=MockedResponse())
        response = client.post("/resumes/file", body, **headers)

        self.assertEqual(response.status_code, 201)
        self.assertEqual(response.json(), {"message":"SUCCESS"})

    @patch('resumes.views.boto3.client')
    def test_resume_s3_upload_file_none(self, mocked_s3_client):
        client = Client()
        user = User.objects.get(name="Homer Simpson")
        access_token = jwt.encode({'user_id': user.id}, SECRET_KEY, algorithm=ALGORITHM)

        class MockedResponse:
            def upload(self):
                return None

        headers = {'HTTP_AUTHORIZATION': access_token, 'format': ' multipart'}
        body = {'resume': ""}
        mocked_s3_client.upload = MagicMock(return_value=MockedResponse())
        response = client.post("/resumes/file", body, **headers)

        self.assertEqual(response.status_code, 404)
        self.assertEqual(response.json(), {"message":"FILE_NONE"})

    @patch('resumes.views.boto3.client')
    def test_resume_s3_delete_success(self,mocked_s3_client ):
        client = Client()
        user = User.objects.get(name="Homer Simpson")
        access_token = jwt.encode({'user_id': user.id}, SECRET_KEY, algorithm=ALGORITHM)

        class MockedResponse:
            def upload(self):
                return None

        my_file = SimpleUploadedFile(
            'file.jpg',
            b'file_content',
            content_type='image/jpg'
        )

        headers = {'HTTP_AUTHORIZATION': access_token}
        body = {'resume': my_file}
        mocked_s3_client.upload = MagicMock(return_value=MockedResponse())
        response = client.delete("/resumes/file/1", **headers)

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"message": "SUCCESS"})

    @patch('resumes.views.boto3.client')
    def test_resume_s3_delete_invild_resume(self, mocked_s3_client):
        client = Client()
        user = User.objects.get(name="Homer Simpson")
        access_token = jwt.encode({'user_id': user.id}, SECRET_KEY, algorithm=ALGORITHM)

        class MockedResponse:
            def upload(self):
                return None

        my_file = SimpleUploadedFile(
            'file.jpg',
            b'file_content',
            content_type='image/jpg'
        )

        headers = {'HTTP_AUTHORIZATION': access_token}
        body = {'resume': my_file}
        mocked_s3_client.upload = MagicMock(return_value=MockedResponse())
        response = client.delete("/resumes/file/2", **headers)

        self.assertEqual(response.status_code, 404)
        self.assertEqual(response.json(), {"message": "INVILD_RESUME"})
