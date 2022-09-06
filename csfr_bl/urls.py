from django.urls import path, include
from . import views
from django.conf.urls.static import static
urlpatterns = [
  path('AddRoles/', views.createRole, name='role'),  
  path('Cuser/', views.createUser, name = 'Cuser'),
  path('login/', views.signIn, name = 'login'),
  path('Dash/', views.Dashboard, name = 'Dash'),
  path('class/', views.ClassCreate, name = 'ccreate'),
  path('EV/', views.ExamView, name = 'EV'),
  #path('addclass/', views.addtoClass, name = 'addstudents'),
  path('content/<str:pk>/', views.ClassContent, name = 'CC'),
  #path('stream/', views.Stream, name = 'stream'),
  path('uploadqc/', views.UploadQC, name = 'UQC'),
  path('submitc/<str:pk>/', views.submitc, name = 'submitc'),
  path('Exam/', views.UploadE, name = 'exam'),
  path('classw/', views.Classworks, name = 'Classworks'),
  path('Examsubmit/<str:pk>', views.Exams, name = 'examsubmit'),
  path('examc/<str:pk>/', views.examc, name = 'examc'),
  path('streamview/', views.StreamView, name = 'SV'),
  path('Stream/', views.StreamCon, name = 'SC'), 
  path('people/', views.People, name = 'people'),
  path('CWork/', views.ViewClasswork, name = 'viewclasswork'),
  path('Cdetails/<str:pk>/', views.ClassworkDetails, name = 'Cdet'),
  path('viewExam/', views.ViewExam, name = 'viewExam'),
  path('AdminDash/', views.AdminDash, name = 'Adda'),
  path('ExamD/<str:pk>/', views.ExamDetails, name = 'ExamD'),
  path('rec/', views.VideoCap, name = 'rec'),
  path('mul/<int:pk>/', views.multfunct, name = 'mul'),
  path('att/', views.classAttendance, name = 'att'),
  path('Gsub/<str:pk>/', views.GradeSub, name = 'Gsub'),
  path('Greds/', views.printGrade, name = 'Greds'),
  path('logout/', views.logout, name = 'logout'),
  path('Alert/', views.teacherAlert, name = 'Al'),
  path('patt/', views.AttendanceFunc, name = 'patt'),

  path('JV/', views.JustVid, name = 'JV')
]
