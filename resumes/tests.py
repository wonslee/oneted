import jwt
from django.test    import TestCase, Client

from users.models   import User
from resumes.models import Resume
from my_settings    import SECRET_KEY, ALGORITHM

class ResumesTest(TestCase):
    def setUp(self):
        User.objects.create(
            id = 1,
            name="Homer Simpson", 
            email="homer@google.com", 
            profile_image="https://metro.co.uk/wp-content/uploads/2020/02/PRI_142406335-e1589297035275.jpg?quality=90&strip=all&zoom=1&resize=480%2C276", 
            kakao_api_id=1
        )

        Resume.objects.create(
            user_id=1, 
            title="호머 심슨 이력서", 
            is_done=True,
            is_file=False,
            file_uuid=123123,
            content={
                "description" : "DDDDDDDDDDDDhough!",
                "career" : "원자력 발전소 3년차",
                "education"  : "도넛대학교 2학년 중퇴",
                "skill" : "마지 심슨 골려먹기",
                })
        Resume.objects.create(
            user_id=1, 
            title="호머 심슨 이력서", 
            is_done=True,
            is_file=False,
            file_uuid=1231234,
            content={
                "description" : "hi!",
                "career" : "애아빠 5년차",
                "education"  : "도넛대학교 2학년 중퇴",
                "skill" : "마지 심슨 골려먹기",
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
                    'id': 1, 
                    'title': '호머 심슨 이력서', 
                    'isDone': True, 
                    'isFile': False, 
                    'fileUrl': None,
                }, 
                {
                    'id': 2, 
                    'title': '호머 심슨 이력서', 
                    'isDone': True, 
                    'isFile': False, 
                    'fileUrl': None,
                }
            ]
        })

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
