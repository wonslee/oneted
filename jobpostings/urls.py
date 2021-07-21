from django.urls import path

from jobpostings.views import TagCategoryView, JobGroupView

urlpatterns = [
    path("/tags", TagCategoryView.as_view()),
    path("/jobs", JobGroupView.as_view()),
]