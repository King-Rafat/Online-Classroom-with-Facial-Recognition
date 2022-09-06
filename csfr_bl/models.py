from django.db import models
from django import forms
from datetime import datetime
from django.forms import ModelForm, Textarea

class Userdata(models.Model):
    Serial = models.AutoField(primary_key = True)
    Username = models.CharField(max_length=50)
    Email = models.EmailField(max_length=50)
    password = models.CharField(max_length=50)
    Image = models.ImageField(upload_to='Avatar')
    Role = models.ForeignKey('Roles', on_delete = models.CASCADE)
    class Meta:
        db_table = "User"
    def __str__(self):
        return self.Username    


class Ownerdoc(models.Model):
    Serialo = models.AutoField(primary_key= True)
    Doc_name =  models.CharField(max_length=50)
    Post_Date = models.DateTimeField()
    Sub_Date = models.DateTimeField()
    Owner = models.ForeignKey('Userdata', on_delete = models.CASCADE)
    File = models.FileField(upload_to='Doc')
    class_name_O = models.CharField(max_length=50)
    Cmnt = models.TextField()
    Type = models.IntegerField()
    class Meta:
        db_table = "OwnerDocument"

class Workerdoc(models.Model):
    Serialw = models.AutoField(primary_key = True)
    Doc_name_w = models.CharField(max_length = 50)
    Sub_Date_w = models.DateTimeField()
    Owner_w = models.ForeignKey('Userdata', on_delete = models.CASCADE)
    class_name =  models.CharField(max_length=50)
    Filew = models.FileField(upload_to='Document')
    Late = models.BooleanField()
    Doc_path = models.IntegerField()
    class Meta:
        db_table = "Worker Document"

class Roles(models.Model):
    Role = models.CharField(max_length=50, primary_key= True)
    class Meta:
        db_table = "Role"
    def __str__(self):
        return self.Role  
class ClassGrp(models.Model):
    Cname = models.CharField(max_length = 50)
    Cowner = models.ForeignKey('Userdata', on_delete = models.CASCADE)
    class Meta:
        db_table = "Class"
    def __str__(self):
        return self.Cname    
 
class Stream(models.Model):
    Streamno = models.AutoField(primary_key = True)
    Content = models.TextField()
    Classname = models.CharField(max_length=50)
    posted = models.ForeignKey('Userdata', on_delete = models.CASCADE)
    
class Attendance(models.Model):
    Date_attended = models.DateField()
    Student = models.ForeignKey('Userdata', on_delete = models.CASCADE)
    W_class = models.CharField(max_length = 50)
    class Meta:
        db_table = "Attendance"
        unique_together = (("Date_attended", "Student"),)

class Alert(models.Model):
    Serialno = models.AutoField(primary_key = True)
    classname_a = models.CharField(max_length = 50)
    Student_a = models.ForeignKey('Userdata', on_delete = models.CASCADE)
    type = models.CharField( max_length=50)

class Grade(models.Model):
    Serialno = models.AutoField(primary_key = True)
    Grade_c = models.CharField(max_length = 5)
    ownerd = models.IntegerField()
    workerd = models.ForeignKey('Userdata', on_delete = models.CASCADE)
    class Meta:
        db_table = "Grade"
        unique_together = (("ownerd", "workerd"),)

class Check(models.Model):
    aidi = models.AutoField(primary_key = True)
    number = models.IntegerField()
    checkopen = models.IntegerField()