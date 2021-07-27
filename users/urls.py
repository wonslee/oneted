from django.urls import path
from users.views import BookMarkView, KakaoLoginView, UserView

urlpatterns = [
    path('/bookmark/<int:jobposting_id>', BookMarkView.as_view()),
    path('/kakaologin', KakaoLoginView.as_view()),
    path("", UserView.as_view()),
]
