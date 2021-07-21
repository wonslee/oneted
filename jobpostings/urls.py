from django.urls import path

from jobpostings.views import TagCategoryView

urlpatterns = [
    path("/tags", TagCategoryView.as_view()),
]