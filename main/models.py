from django.db import models


class admin(models.Model):
	admin_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)

class department(models.Model):
	dept_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)

class hod(models.Model):
	hod_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	dept_id = models.CharField(max_length=16)   # FK

class teacher(models.Model):
	teacher_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	dept_id = models.CharField(max_length=16)   # FK

class teaches(models.Model):
	teacher_id = models.CharField(max_length=16)	# FK		# Combination of both
	subject_id = models.CharField(max_length=16)	# FK		# would be PK

class student(models.Model):
	enroll_no = models.CharField(max_length=16)	 # Could merge into a single field
	roll_no = models.CharField(max_length=16)	   # student_id and make that PK
	name = models.CharField(max_length=64)
	dob = models.DateField()
	semester = models.IntegerField()
	dept_id = models.CharField(max_length=16)	 # FK

class class_attendance(models.Model):
	roll_no = models.CharField(max_length=16)	   # FK		# Combination of both
	subject_id = models.CharField(max_length=16)	# FK		# would be PK
	attendance = models.FloatField()

class exam_attendance(models.Model):
	subject_id = models.CharField(max_length=16)	# FK		# Combination of both
	enroll_no = models.CharField(max_length=16)	 # FK		# would be PK
	present = models.BooleanField()

class subject(models.Model):
	subject_id = models.CharField(max_length=16, primary_key=True)
	title = models.CharField(max_length=64)
	semester = models.IntegerField()

class subject_section(models.Model):
	subject_id = models.CharField(max_length=16)	# FK		# Combination of both
	section = models.CharField(max_length=1)                   # would be PK

class schedule(models.Model):
	subject_id = models.CharField(max_length=16, primary_key=True)	  # also FK
	date = models.DateField()

class coding(models.Model):
	code_no = models.CharField(max_length=16, primary_key=True)
	subject_id = models.CharField(max_length=16)	# FK
	enroll_no = models.CharField(max_length=16)	 # FK

class marks(models.Model):
	code_no = models.CharField(max_length=16, primary_key=True)	  # also FK
	marks = models.FloatField()
