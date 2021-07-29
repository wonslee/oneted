from django.urls import path

from resumes.views import ResumesView, ResumeView, ResumeApply

urlpatterns = [
    path("", ResumesView.as_view()),
    path("/<int:resume_id>", ResumeView.as_view()),
    path('/apply', ResumeApply.as_view())
]