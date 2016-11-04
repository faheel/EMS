from django.db import models


class admins(models.Model):
	admin_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)


class department(models.Model):
	dept_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)


class hod(models.Model):
	hod_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	dept_id = models.ForeignKey(department)


class teacher(models.Model):
	teacher_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	dept_id = models.ForeignKey(department)


class subject(models.Model):
	subject_id = models.CharField(max_length=16, primary_key=True)
	title = models.CharField(max_length=64)
	semester = models.IntegerField()


class subject_section(models.Model):
	subject_id = models.ForeignKey(subject)
	section = models.CharField(max_length=1)


class teacher_subject(models.Model):
	teacher_id = models.ForeignKey(teacher)
	subject_id = models.ForeignKey(subject)

	class Meta:
		unique_together = ('teacher_id', 'subject_id')


class student(models.Model):
	student_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	dob = models.DateField()
	semester = models.IntegerField()
	branch = models.CharField(max_length=64)
	dept_id = models.ForeignKey(department)


class student_section(models.Model):
	student_id = models.ForeignKey(student)
	section = models.CharField(max_length=1)

	class Meta:
		unique_together = ('student_id', 'section')


class class_attendance(models.Model):
	student_id = models.ForeignKey(student)
	subject_id = models.ForeignKey(subject)
	attendance = models.FloatField()

	class Meta:
		unique_together = ('student_id', 'subject_id')


class exam_attendance(models.Model):
	student_id = models.ForeignKey(student)
	subject_id = models.ForeignKey(subject)
	present = models.BooleanField()

	class Meta:
		unique_together = ('student_id', 'subject_id')


class exam_schedule(models.Model):
	subject_id = models.ForeignKey(subject)
	date = models.DateField()

	class Meta:
		unique_together = ('subject_id', 'date')


class paper_coding(models.Model):
	code_no = models.CharField(max_length=16, primary_key=True)
	subject_id = models.ForeignKey(subject)
	student_id = models.ForeignKey(student)


class marks(models.Model):
	code_no = models.ForeignKey(paper_coding)
	marks = models.FloatField()
