from django.test import TestCase, Client
from jobpostings.models import Tag, TagCategory, Job, JobGroup

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
            "result" : {
                "tagCategories" : [{
                    "id"                 : 1,
                    "name"               : '업계연봉수준',
                    "is_multiple_choice" : True,
                    "tags"               : [{
                        "id"   : 1,
                        "name" : "연봉업계평균이상",
                }]
            }]} 
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
            "result": {
                "jobGroups": [{
                    "id": 1,
                    "name": "개발",
                    "jobs": [{
                        "id": 1,
                        "name": "nodeJS 개발자"
                    }]
                }]
            }
        })
