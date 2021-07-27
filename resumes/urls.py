from django.urls import path

from resumes.views import ResumesView, ResumeView

urlpatterns = [
    path("", ResumesView.as_view()),
    path("/<int:resume_id>", ResumeView.as_view()),
]