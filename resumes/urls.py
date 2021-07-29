from django.urls import path

from resumes.views import ResumesView, ResumeView, ResumeFile, ResumeApply


urlpatterns = [
    path("", ResumesView.as_view()),
    path("/<int:resume_id>", ResumeView.as_view()),
    path('/apply', ResumeApply.as_view()),
    path('/file', ResumeFile.as_view()),
    path('/file/<int:resume_id>', ResumeFile.as_view())
]

