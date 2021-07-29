from django.urls import path
from jobpostings.views import PostingsView, SuggestView, TagCategoryView, JobGroupView, PostingView

urlpatterns = [
    path("", PostingsView.as_view()),
    path("/suggested", SuggestView.as_view()),
    path("/tags", TagCategoryView.as_view()),
    path("/jobs", JobGroupView.as_view()),
    path("/<int:posting_id>", PostingView.as_view())
]