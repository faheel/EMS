from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

class Department(models.Model):
	dept_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	head_id = models.CharField(max_length=16, default='NULL')

	def __str__(self):
		return '' + self.name
	# causes problem when defining foreign key on Teacher
	# as it wouldn't exist when this statement is executed

class Teacher(models.Model):
	teacher_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	dept_id = models.ForeignKey(Department)
	salary = models.FloatField()
	teaching_since = models.DateField()

	def __str__(self):
		return '' + self.name

class Student(models.Model):
	student_id = models.CharField(max_length=16, primary_key=True)
	roll_no = models.CharField(max_length=16)
	name = models.CharField(max_length=64)
	dob = models.DateField()
	semester = models.IntegerField(validators=[MinValueValidator(1),MaxValueValidator(8)])
	dept_id = models.ForeignKey(Department)

	def __str__(self):
		return '' + self.name

class StudentSection(models.Model):
	student_id = models.OneToOneField(Student, on_delete=models.CASCADE)
	section = models.CharField(max_length=1)

	def __str__(self):
		return '{} '.format(self.student_id) + 'is in section {}'.format(self.section)

class Subject(models.Model):
	subject_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	semester = models.IntegerField()
	dept_id = models.ForeignKey(Department)

	def __str__(self):
		return '' + self.name

class SubjectSection(models.Model):		# weak relation
	subject_id = models.ForeignKey(Subject)
	section = models.CharField(max_length=1)

	def __str__(self):
		return '{}'.format(self.subject_id) + ' is taught in section {}'.format(self.section)

class Teaches(models.Model):
	teacher_id = models.ForeignKey(Teacher)
	subject_id = models.ForeignKey(Subject)
	class Meta:
		unique_together = ('teacher_id', 'subject_id')

	def __str__(self):
		return '{} '.format(self.teacher_id) + ' teaches {}'.format(self.subject_id)

class ClassAttendance(models.Model):
	student_id = models.ForeignKey(Student)
	subject_id = models.ForeignKey(Subject)
	attendance = models.FloatField()
	class Meta:
		unique_together = ('student_id', 'subject_id')

	def __str__(self):
		return '{} {}'.format(self.student_id, self.attendance)

class Marks(models.Model):
	student_id = models.ForeignKey(Student)
	subject_id = models.ForeignKey(Subject)
	marks = models.FloatField()
	class Meta:
		unique_together = ('student_id', 'subject_id')

	def __str__(self):
		return '{} - {}'.format(self.student_id, self.subject_id)

class Schedule(models.Model):
	subject_id = models.ForeignKey(Subject)
	date = models.DateField()
	class Meta:
		unique_together = ('subject_id', 'date')

	def __str__(self):
		return '{} - {}'.format(self.subject_id, self.date)
