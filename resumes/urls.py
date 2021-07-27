from django.urls import path

from resumes.views import ResumesView

urlpatterns = [
    path("", ResumesView.as_view()),
]