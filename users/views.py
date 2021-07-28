import requests
import jwt
import json

from django.views  import View
from django.http   import JsonResponse

from users.models       import User, Bookmark
from jobpostings.models import JobPosting
from my_settings        import DATABASES, SECRET_KEY, ALGORITHM
from utils              import authorization

class KakaoLoginView(View):
    def post(self, request):
        access_token = request.headers.get("Authorization")

        if not access_token :
            return JsonResponse({"message":"INVAID_ACCESS_TOKEN"}, status=401)

        headers      = ({"Authorization": f"Bearer {access_token}"})
        url          = "https://kapi.kakao.com/v2/user/me"
        response     = requests.get(url, headers=headers)
        user         = response.json()

        users, is_created = User.objects.get_or_create(kakao_api_id  = user["id"])
        if is_created:
            users.name          = user["kakao_account"]["profile"]["nickname"],
            users.email         = user["kakao_account"]["email"],
            users.profile_image = user["kakao_account"]["profile"]["profile_image_url"]
            users.save()

        user_info = {
            "name"         : users.name,
            "email"        : users.email,
            "profile_image": users.profile_image
        }

        encoded_jwt = jwt.encode({"user_id": users.id}, SECRET_KEY, algorithm=ALGORITHM)

        return JsonResponse({"user_info":user_info, "token":encoded_jwt}, status=200)

class BookMarkView(View):
    @authorization
    def post(self, request, jobposting_id):
        user        = request.user
        job_posting = JobPosting.objects.get(id=jobposting_id)

        if not Bookmark.objects.filter(user=user, job_posting=job_posting).exists():
            Bookmark.objects.create(
                user        = user,
                job_posting = job_posting
            )
            return JsonResponse({"message":"SUCCESS"}, status=201)

        Bookmark.objects.get(user=user, job_posting=job_posting).delete()

        return JsonResponse({"message":"SUCCESS"}, status=200)
