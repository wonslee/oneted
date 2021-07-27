from django.test        import TestCase, Client

from jobpostings.models import Company, Country, Experience, JobPosting, Region, Tag, TagCategory, Job, JobGroup

class TagCategoryTest(TestCase):
    def setUp(self):
        TagCategory.objects.create(
            id                 = 1,
            name               = '업계연봉수준',
            is_multiple_choice = True
        )
        Tag.objects.create(
            id              = 1,
            tag_category_id = 1,
            name            = '연봉업계평균이상',
        )

    def tearDown(self):
        TagCategory.objects.all().delete()
        Tag.objects.all().delete()

    def test_tagsview_get_success(self):
        client   = Client()
        response = client.get('/jobpostings/tags')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message":"SUCCESS",
                "result" : [{
                    "id"                 : 1,
                    "name"               : '업계연봉수준',
                    "is_multiple_choice" : True,
                    "tags"               : [{
                        "id"   : 1,
                        "name" : "연봉업계평균이상",
                    }]
                }]
            })

class JobGroupTest(TestCase):
    def setUp(self):
        JobGroup.objects.create(
            id   = 1,
            name = '개발',
        )
        Job.objects.create(
            id           = 1,
            job_group_id = 1,
            name         = 'nodeJS 개발자',
        )

    def tearDown(self):
        JobGroup.objects.all().delete()
        Job.objects.all().delete()

    def test_jobsview_get_success(self):
        client   = Client()
        response = client.get('/jobpostings/jobs')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message": "SUCCESS",
                "result": [{
                    "id": 1,
                    "name": "개발",
                    "jobs": [{
                        "id": 1,
                        "name": "nodeJS 개발자"
                    }]
                }]
            })

class PostingsTest(TestCase):
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

    def tearDown(self):
        JobPosting.objects.all().delete()
        Job.objects.all().delete()
        JobGroup.objects.all().delete()
        Country.objects.all().delete()
        Region.objects.all().delete()
        Company.objects.all().delete()
        Experience.objects.all().delete()

    def test_jobsview_get_by_job_success(self):
        client   = Client()
        response = client.get('/jobpostings?job=프론트엔드 개발자')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message" : "SUCCESS",
            "result"  : [
                    {
                        "id"      : 2,
                        "title"         : "프론트엔드 신입 (1년차) 구할까 말까",
                        "salary"        : 50000000,
                        "experience"    : "1년차",
                        "imageUrl"      : None,
                        "bookmarkCount" : 0,
                        "apply_Count"   : 0,
                        "company" : {
                            "id"        : 2,
                            "name"      : "카카오 뱅크",
                            "region"    : "부산",
                            "country"   : "한국"
                        },
                        "job"     : {
                            "id"        : 2,
                            "name"      : "프론트엔드 개발자"
                        }
                    },
                ]
            }
        )

    def test_jobsview_get_by_region_success(self):
        client   = Client()
        response = client.get('/jobpostings?region=부산')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message" : "SUCCESS",
            "result"  : [
                    {
                        "id"            : 2,
                        "title"         : "프론트엔드 신입 (1년차) 구할까 말까",
                        "salary"        : 50000000,
                        "experience"    : "1년차",
                        "imageUrl"      : None,
                        "bookmarkCount" : 0,
                        "apply_Count"   : 0,
                        "company"       : {
                            "id"      : 2,
                            "name"    : "카카오 뱅크",
                            "region"  : "부산",
                            "country" : "한국"
                        },
                        "job"           : {
                            "id"      : 2,
                            "name"    : "프론트엔드 개발자"
                        }
                    },
                ]
            }
        )

    def test_jobsview_get_by_query_success(self):
        client   = Client()
        response = client.get('/jobpostings?query=말까')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message": "SUCCESS",
            "result": [
                    {
                        "id": 2,
                        "title": "프론트엔드 신입 (1년차) 구할까 말까",
                        "salary": 50000000,
                        "experience": "1년차",
                        "imageUrl": None,
                        "bookmarkCount": 0,
                        "apply_Count": 0,
                        "company": {
                            "id": 2,
                            "name": "카카오 뱅크",
                            "region": "부산",
                            "country": "한국"
                        },
                        "job": {
                            "id": 2,
                            "name": "프론트엔드 개발자"
                        }
                    },
                ]
            }
        )

    def test_jobsview_get_by_query_success(self):
        client   = Client()
        response = client.get('/jobpostings?query=말까')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message": "SUCCESS",
            "result": [
                    {
                        "id": 2,
                        "title": "프론트엔드 신입 (1년차) 구할까 말까",
                        "salary": 50000000,
                        "experience": "1년차",
                        "imageUrl": None,
                        "bookmarkCount": 0,
                        "apply_Count": 0,
                        "company": {
                            "id": 2,
                            "name": "카카오 뱅크",
                            "region": "부산",
                            "country": "한국"
                        },
                        "job": {
                            "id": 2,
                            "name": "프론트엔드 개발자"
                        }
                    },
                ]
            }
        )

    def test_jobsview_get_by_experience_success(self):
        client   = Client()
        response = client.get('/jobpostings?experience=1년차')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message": "SUCCESS",
            "result": [
                    {
                        "id": 2,
                        "title": "프론트엔드 신입 (1년차) 구할까 말까",
                        "salary": 50000000,
                        "experience": "1년차",
                        "imageUrl": None,
                        "bookmarkCount": 0,
                        "apply_Count": 0,
                        "company": {
                            "id": 2,
                            "name": "카카오 뱅크",
                            "region": "부산",
                            "country": "한국"
                        },
                        "job": {
                            "id": 2,
                            "name": "프론트엔드 개발자"
                        }
                    },
                ]
            }
        )

    def test_jobsview_get_by_tags_success(self):
        client   = Client()
        response = client.get('/jobpostings?tag=사내카페')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message": "SUCCESS",
            "result": [
                    {
                        "id": 1,
                        "title": "카카오에서 백엔드 신입 (주니어) 구해요 !!!",
                        "salary": 60000000,
                        "experience": "신입",
                        "imageUrl": None,
                        "bookmarkCount": 0,
                        "apply_Count": 0,
                        "company": {
                            "id": 1,
                            "name": "모두싸인",
                            "region": "서울",
                            "country": "한국"
                        },
                        "job": {
                            "id": 1,
                            "name": "nodeJS 개발자"
                        }
                    },
                ]
            }
        )

    def test_jobsview_get_by_orderby_success(self):
        client   = Client()
        response = client.get('/jobpostings?orderBy=latest')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message": "SUCCESS",
            "result": [
                    {
                        "id": 2,
                        "title": "프론트엔드 신입 (1년차) 구할까 말까",
                        "salary": 50000000,
                        "experience": "1년차",
                        "imageUrl": None,
                        "bookmarkCount": 0,
                        "apply_Count": 0,
                        "company": {
                            "id": 2,
                            "name": "카카오 뱅크",
                            "region": "부산",
                            "country": "한국"
                        },
                        "job": {
                            "id": 2,
                            "name": "프론트엔드 개발자"
                        }
                    },
                    {
                        "id": 1,
                        "title": "카카오에서 백엔드 신입 (주니어) 구해요 !!!",
                        "salary": 60000000,
                        "experience": "신입",
                        "imageUrl": None,
                        "bookmarkCount": 0,
                        "apply_Count": 0,
                        "company": {
                            "id": 1,
                            "name": "모두싸인",
                            "region": "서울",
                            "country": "한국"
                        },
                        "job": {
                            "id": 1,
                            "name": "nodeJS 개발자"
                        }
                    },
                ]
            }
        )

    def test_jobsview_get_by_offset_limit_success(self):
        client   = Client()
        response = client.get('/jobpostings?offset=1&limit=1')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message": "SUCCESS",
            "result": [
                    {
                        "id": 1,
                        "title": "카카오에서 백엔드 신입 (주니어) 구해요 !!!",
                        "salary": 60000000,
                        "experience": "신입",
                        "imageUrl": None,
                        "bookmarkCount": 0,
                        "apply_Count": 0,
                        "company": {
                            "id": 1,
                            "name": "모두싸인",
                            "region": "서울",
                            "country": "한국"
                        },
                        "job": {
                            "id": 1,
                            "name": "nodeJS 개발자"
                        }
                    },
                ]
            }
        )

class SuggestTest(TestCase):
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

    def tearDown(self):
        JobPosting.objects.all().delete()
        Job.objects.all().delete()
        JobGroup.objects.all().delete()
        Country.objects.all().delete()
        Region.objects.all().delete()
        Company.objects.all().delete()
        Experience.objects.all().delete()

    def test_suggest_get_success(self):
        client   = Client()
        response = client.get('/jobpostings/suggested?query=카')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {
            "message": "SUCCESS",
            "result": {
                "jobPostings": [
                    {
                        "id": 1,
                        "title": "카카오에서 백엔드 신입 (주니어) 구해요 !!!"
                    },
                ],
                "tags": [
                    {
                        "id": 1,
                        "name": "사내카페"
                    },
                ],
                "companies": [
                    {
                        "id": 2,
                        "name": "카카오 뱅크"
                    },
                ]
            }
        })


    def test_suggest_get_key_error(self):
        client   = Client()
        response = client.get('/jobpostings/suggested')
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {"message" : "KEY_ERROR"})