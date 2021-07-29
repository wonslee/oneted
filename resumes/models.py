from django.db          import models

from oneted.common      import TimeStampModel
from users.models       import User
from jobpostings.models import JobPosting

class Resume(TimeStampModel):
    user      = models.ForeignKey(User, on_delete=models.CASCADE)
    title     = models.CharField(max_length=100)
    is_done   = models.BooleanField(default=False)
    file_url  = models.URLField(null=True)
    content   = models.JSONField(default=dict)
    is_file   = models.BooleanField(default=False)
    file_uuid = models.CharField(max_length=200, null=True)
    applies   = models.ManyToManyField("Apply", through="ResumeApply", related_name="resume")

    class Meta:
        db_table = "resumes"

class Apply(TimeStampModel):
    job_posting = models.ForeignKey(JobPosting, on_delete=models.CASCADE)
    user        = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        db_table = "applies"

class ResumeApply(models.Model):
    resume = models.ForeignKey(Resume, on_delete=models.CASCADE)
    apply  = models.ForeignKey(Apply, on_delete=models.CASCADE)

    class Meta:
        db_table = "resumes_applies"
        unique_together = ["resume", "apply"]
