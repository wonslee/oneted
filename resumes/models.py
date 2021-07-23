from django.db import models

from oneted.common import TimeStampModel
from users.models  import User
from jobposting    import JobPosting

class Resume(TimeStampModel):
    user     = models.ForeginKey(User, on_delete=CASCADE)
    is_done  = models.BooleanField(default=False)
    file_url = models.URLField(null=True)
    content  = models.JSONField(default=dict)
    is_file  = models.BooleanField(default=False)
    applies  = models.ManyToMany("Apply", through="ResumeApply", related_name="resume")

    class Meta:
        db_table = "resumes"

class Apply(TimeStampModel):
    job_posting = models.ForeginKey(JobPosting, on_delete=CASCADE)
    user        = models.ForeginKey(User, on_delete=CASCADE)

    class Meta:
        db_table = "applies"

class ResumeApply(models.Model):
    resume = models.ForeginKey(Resume, on_delete=CASCADE)
    apply  = models.ForeginKey(Apply, on_delete=CASCADE)

    class Meta:
        db_table = "resumes_applies"
        unique_together = ["resume", "apply"]