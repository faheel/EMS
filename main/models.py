from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Department(models.Model):
	dept_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	head_id = models.CharField(max_length=16)
	# causes problem when defining foreign key on Teacher
	# as it wouldn't exist when this statement is executed

	def __str__(self):
		return '' + self.name


class Teacher(models.Model):
	teacher_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	dept_id = models.ForeignKey(Department, db_column='dept_id')
	post = models.CharField(max_length=64)
	salary = models.FloatField()
	teaching_since = models.DateField()

	def __str__(self):
		return '' + self.name


class Student(models.Model):
	student_id = models.CharField(max_length=16, primary_key=True)
	roll_no = models.CharField(max_length=16)
	name = models.CharField(max_length=64)
	dob = models.DateField()
	semester = models.IntegerField(validators=[MinValueValidator(1), MaxValueValidator(8)])
	dept_id = models.ForeignKey(Department, db_column='dept_id')

	def __str__(self):
		return '' + self.name


class StudentSection(models.Model):
	student_id = models.OneToOneField(Student, on_delete=models.CASCADE, db_column='student_id')
	section = models.CharField(max_length=1)

	def __str__(self):
		return '{} '.format(self.student_id) + 'is in section {}'.format(self.section)


class Subject(models.Model):
	subject_id = models.CharField(max_length=16, primary_key=True)
	name = models.CharField(max_length=64)
	semester = models.IntegerField()
	dept_id = models.ForeignKey(Department, db_column='dept_id')

	def __str__(self):
		return '' + self.name


class SubjectSection(models.Model):
	subject_id = models.ForeignKey(Subject, db_column='subject_id')
	section = models.CharField(max_length=1)

	class Meta:
		unique_together = ('subject_id', 'section')

	def __str__(self):
		return '{}'.format(self.subject_id) + ' is taught in section {}'.format(self.section)


class Teaches(models.Model):
	teacher_id = models.ForeignKey(Teacher, db_column='teacher_id')
	subject_id = models.ForeignKey(Subject, db_column='subject_id')

	class Meta:
		unique_together = ('teacher_id', 'subject_id')

	def __str__(self):
		return '{} '.format(self.teacher_id) + ' teaches {}'.format(self.subject_id)


class ClassAttendance(models.Model):
	student_id = models.ForeignKey(Student, db_column='student_id')
	subject_id = models.ForeignKey(Subject, db_column='subject_id')
	attendance = models.FloatField()

	class Meta:
		unique_together = ('student_id', 'subject_id')

	def __str__(self):
		return '{} - {}'.format(self.student_id, self.subject_id)


class Marks(models.Model):
	student_id = models.ForeignKey(Student, db_column='student_id')
	subject_id = models.ForeignKey(Subject, db_column='subject_id')
	marks = models.FloatField()

	class Meta:
		unique_together = ('student_id', 'subject_id')

	def __str__(self):
		return '{} - {}'.format(self.student_id, self.subject_id)


class Schedule(models.Model):
	subject_id = models.ForeignKey(Subject, db_column='subject_id')
	date = models.DateField()

	class Meta:
		unique_together = ('subject_id', 'date')

	def __str__(self):
		return '{} - {}'.format(self.subject_id, self.date)
