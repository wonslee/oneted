from django.urls import path

from jobpostings.views import PostingsView, TagCategoryView, JobGroupView

urlpatterns = [
    path("", PostingsView.as_view()),
    path("/tags", TagCategoryView.as_view()),
    path("/jobs", JobGroupView.as_view()),
]