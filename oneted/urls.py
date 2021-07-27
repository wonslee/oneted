from django.urls import path, include

urlpatterns = [
    path("jobpostings", include("jobpostings.urls")),
    path("resumes", include("resumes.urls")),
]
