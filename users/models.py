from django.db import models
from oneted.common import TimeStampModel

# Create your views here.
class User(TimeStampModel):
    name          = models.CharField(max_length = 20)
    email         = models.EmailField(max_length = 100, unique = True)
    phone_number  = models.CharField(max_length = 100)
    profile_image = models.URLField()
    kakao_api_id  = models.IntegerField()
    google_api_id = models.IntegerField()

    class Meta :
        db_table = "users"

class Platform(models.Model):
    name = models.CharField(max_length = 45)

    class Meta:
        db_table = "platforms"

class UserPlatform(models.Model):
    platform_user_id = models.CharField(max_length = 100)
    users            = models.ForeignKey(User, on_delete=models.CASCADE)
    platform         = models.ForeignKey(Platform, on_delete=models.CASCADE)

    class Meta :
        db_table = "users_platforms"

class Bookmark(models.Model):

    class Meta :
        db_table = "bookmarks"
