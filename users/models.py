from django.db import models

from oneted.common import TimeStampModel
from jobpostings.models   import JobPosting

# Create your views here.
class User(TimeStampModel):
    name          = models.CharField(max_length=20)
    email         = models.EmailField(max_length=100, unique=True)
    profile_image = models.URLField()
    kakao_api_id  = models.IntegerField(null=True)
    google_api_id = models.IntegerField(null=True)

    class Meta :
        db_table = "users"

class Bookmark(TimeStampModel):
    user        = models.ForeignKey(User, on_delete=models.CASCADE)
    job_posting = models.ForeignKey(JobPosting, on_delete=models.CASCADE)

    class Meta :
        db_table = "bookmarks"