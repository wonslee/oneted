from django.views       import View
from django.http        import JsonResponse

from jobpostings.models import TagCategory, JobGroup

class TagCategoryView(View):
    def get(self, request):
        tag_categories    = TagCategory.objects.prefetch_related("tag").all()
        tag_category_list = [{
                "id"                 : tag_category.id,
                "name"               : tag_category.name,
                "is_multiple_choice" : tag_category.is_multiple_choice,
                "tags"               : [{
                    "id"   : tag.id,
                    "name" : tag.name,
                } for tag in tag_category.tag.all()],
            } for tag_category in tag_categories]

        return JsonResponse({"message":"SUCCESS", "result" : {"tagCategories" : tag_category_list}}, status=200)

class JobGroupView(View):
    def get(self, request):
        job_groups     = JobGroup.objects.prefetch_related("job").all()
        job_group_list = [{
                "id"   : job_group.id,
                "name" : job_group.name,
                "jobs" : [{
                    "id"   : job.id,
                    "name" : job.name,
                } for job in job_group.job.all()],
            } for job_group in job_groups]

        return JsonResponse({"message":"SUCCESS", "result" : {"jobGroups" : job_group_list}}, status=200)
