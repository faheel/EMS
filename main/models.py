from django.db import models
class admin
    admin_id = models.PrimaryKey('auth.User')
    admin_name=models.CharField(max_length=100)
class hod
    hod_id = models.PrimaryKey('auth.User')
    hod_name=models.CharField(max_length=100)
    hod_id=models.CharField(max_length=100)
class teachers
	teacher_id = models.PrimaryKey('auth.User')
    dep_id = models.CharField(max_length=100)
    teacher_name=models.CharField(max_length=100)
class students
	student_roll_no=models.PrimaryKey('auth.User')
	student_name=models.CharField(max_length=100)
	student_enrol_no=CharField(max_length=100)
	student_dob=CharField(max_length=100)
	student_sem=CharField(max_length=100)
	student_dept=CharField(max_length=100)
	student_attendance=CharField(max_length=100)
class subjects
	subject_id=CharField(max_length=100)
	subject_name=CharField(max_length=100)
	subject_semester=CharField(max_length=100)
	subject_section=CharField(max_length=100)
class shedules
	sh_date=CharField(max_length=100)
	subject_id=CharField(max_length=100)
class coding
    paper_code=CharField(max_length=100)
    paper_id=CharField(max_length=100)
    student_enrol_no=CharField(max_length=100)
class marks_table
	mark_paper_code=CharField(max_length=100)
	mark_obtained=CharField(max_length=100)
	grade=CharField(max_length=100)







