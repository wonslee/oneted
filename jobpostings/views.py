from django.views       import View
from django.http        import JsonResponse
from django.db.models   import Q, Count

from jobpostings.models import TagCategory, JobGroup, JobPosting

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

        return JsonResponse({"message" : "SUCCESS", "result" : tag_category_list}, status=200)

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

        return JsonResponse({"message" : "SUCCESS", "result" : job_group_list}, status=200)

class PostingsView(View):
    def get(self, request):
        region      = request.GET.get("region")
        query       = request.GET.get("query")
        job         = request.GET.get("job")
        experience  = request.GET.get("experience")
        order_by    = request.GET.get("orderBy", "latest")
        tags        = request.GET.getlist("tag")
        offset      = int(request.GET.get("offset", 0))
        limit       = int(request.GET.get("limit", 20))
        sorted_dict = {
            "latest" : "-created_at",
            "popular" : "bookmark_count",
            "apply" : "apply_count"
        }

        q = Q()

        if region:
            q &= Q(company__region__name=region)
        if query:
            q &= Q(company__name__contains=query) | Q(title__contains=query)
        if job:
            q &= Q(job__name=job)
        if experience:
            q &= Q(experience__name=experience)
        if tags:
            q &= Q(tags__name__in=tags)

        job_postings     = JobPosting.objects.select_related("job", "experience", "company", "company__region", "company__region__country").annotate(bookmark_count=Count("bookmark"), apply_count=Count("apply")).filter(q).distinct().order_by(sorted_dict[order_by])[offset * limit : (offset * limit) + limit]
        job_posting_list = [{
            "id"            : job_posting.id,
            "title"         : job_posting.title,
            "salary"        : job_posting.salary,
            "experience"    : job_posting.experience.name,
            "imageUrl"      : job_posting.image_url,
            "bookmarkCount" : job_posting.bookmark_count,
            "apply_Count"   : job_posting.apply_count,
            "company"       : {
                "id"      : job_posting.company.id,
                "name"    : job_posting.company.name,
                "region"  : job_posting.company.region.name,
                "country" : job_posting.company.region.country.name,
            },
            "job"           : {
                "id"   : job_posting.job.id,
                "name" : job_posting.job.name,
            }
        } for job_posting in job_postings]

        return JsonResponse({"message":"SUCCESS", "result":job_posting_list}, status=200)