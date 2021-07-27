import json
from json.decoder       import JSONDecodeError
from django.views       import View
from django.http        import JsonResponse

from resumes.models     import Resume
from utils              import authorization

class ResumesView(View):
    @authorization
    def get(self, request):
        resumes = Resume.objects.filter(user=request.user)
        result = [{
                "id"      : resume.id,
                "title"   : resume.title,
                "isDone"  : resume.is_done,
                "isFile"  : resume.is_file,
                "fileUrl" : resume.file_url
            }for resume in resumes]

        return JsonResponse({"message" : "SUCCESS", "result" : result}, status=200)
        
    @authorization        
    def post(self, request):
        try:
            data = json.loads(request.body)
            Resume.objects.create(
                user    = request.user,
                is_done = data["isDone"],
                title   = data["title"],
                content = {
                "description" : data["description"],
                "career"      : data["career"],
                "education"   : data["education"],
                "skill"       : data["skill"],
                })
            return JsonResponse({"message" : "SUCCESS"}, status=200)

        except KeyError:
            return JsonResponse({"message" : "KEY_ERROR"}, status=400)

        except JSONDecodeError:
            return JsonResponse({"message" : "JSON_DECODE_ERROR"}, status=400)

class ResumeView(View):
    @authorization
    def get(self, request, resume_id):
        if not Resume.objects.filter(id=resume_id, user=request.user).exists():
            return JsonResponse({"message" : "RESUME_NOT_FOUND"}, status=401)

        resume = Resume.objects.get(id=resume_id, user=request.user)
        result = {
            "title"   : resume.title,
            "isDone"  : resume.is_done,
            "isFile"  : resume.is_file,
            "fileUrl" : resume.file_url,
            "fileUuid" : resume.file_uuid,
            "content" : resume.content,
            "user"    : {
                "name" : request.user.name,
                "email": request.user.email,
            }
        }
        
        return JsonResponse({"message" : "SUCCESS", "result" : result}, status=200)