from django.db.models.fields import DateField, NullBooleanField
from django.shortcuts import render, redirect
from django.contrib.auth.models import auth, User
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import authenticate,login,logout
from first.models import Userdata, Roles, ClassGrp, Ownerdoc, Workerdoc, Stream, Alert, Attendance, Check, Grade
from first.forms import RolesForm, UserForm, DocForm, ClassForm, WorkerForm, StreamForm, GradeForm
from django.contrib import messages
from django.conf import settings
from django.core.mail import send_mail
from django.contrib.auth.decorators import login_required
from django import forms
from datetime import date, datetime
from django.http import HttpResponse
from django.utils import timezone
import cv2
import numpy as np
import face_recognition
import json
from django.http import HttpResponse

#Role Creation
def createRole(request):
    message = "Role creation Unsuccessful"
    if request.method == "POST":
        form = RolesForm(request.POST)
        if form.is_valid():
            try:
                name = "Role Created Successfully"
                form.save()
                return JsonResponse({"name":name})
            except:
                pass
    else:
        form = RolesForm()
    return render(request, "CreateRoles.html", {'form' : form, 'message' : message})

#Create User
def createUser(request):
    message = 0
    if request.method == "POST":
        form = UserForm(request.POST, request.FILES)
        Username = request.POST['Username']
        Email = request.POST['Email']
        Password = request.POST['password']
        user  = User.objects.create_user(username = Username, email = Email, password = Password)
        if form.is_valid():
            try:
                form.save()
                message = "User Created Successfully"
            except:
                pass
    else:
        form = UserForm()
    return render(request, "createUser.html", {'form' : form, 'message' : message})
#Login
def signIn(request):
    
    if request.method == 'POST':
        
        form = AuthenticationForm(request=request, data = request.POST)
       
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')             
            user = authenticate(username = username, password = password)
            if user is not None:
                C = None
                d = None
                login(request, user) 
                request.session['username']= username
                uname = request.session['username']
                sk = Check.objects.get(aidi = 1)
                request.session['ExamChecker'] = sk.checkopen
                u = Userdata.objects.get(Username = uname)
                C  = ClassGrp.objects.all().filter(Cowner = u)
                r1 = Roles.objects.get(Role = 'Admin')
                if(u.Role == r1):
                    return redirect('Adda')
                return redirect('Dash')
                #(request,"adDash.html", {'C' : C, 'D' : d})
            else:
                messages.error(request,'Invalid username or password')    
        else:
           messages.error(request,'Invalid username or password')
    else:
        form = AuthenticationForm()
    return render(request,"login.html",{'form':form})  

def AdminDash(request):

    return render(request, "InfoAdmin.html")


def Dashboard(request):
    uname = request.session['username']
    u = Userdata.objects.get(Username = uname)
    C  = ClassGrp.objects.all().filter(Cowner = u)
    return render(request,"adDash.html", {'C' : C, 'u' : u})

#Add to Class
def ClassCreate(request):
    message = 0
    if request.method == "POST":
        form = ClassForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                message = "Class Created Successfully"
            except:
                pass
    else:
        form = ClassForm()
    return render(request, "ClassC.html", {'form' : form, 'message' : message})
#Class Content
def ClassContent(request,pk):
    u = request.session['username']
    us = Userdata.objects.get(Username = u)
    r1 = Roles.objects.get(Role = 'Teacher')
    r2 = Roles.objects.get(Role = 'Student')
    request.session['classname'] = pk
    classname = request.session['classname']
    return render(request, "Dashboard.html", {'us' : us, 'r1': r1, 'r2' : r2})

#upload classwork
def UploadQC(request):
    message = 0 
    if request.method == "POST":
        form = DocForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                uname = request.session['username']
                u = Userdata.objects.get(Username = uname)
                c = request.session['classname']
                message = "Classwork Posted Successfully"
                instance = form.save(commit = False)
                instance.Owner = u
                instance.Sub_Date = datetime.today()
                instance.Post_Date = datetime.today()
                instance.class_name_O = c
                instance.Type = 1
                instance.save()
            except:
                pass
    else:
        form = DocForm()
    return render(request, "UpDoc.html", {'form' : form, 'message' : message})
#Upload Exam
def UploadE(request):
    message = 0 
    if request.method == "POST":
        form = DocForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                uname = request.session['username']
                u = Userdata.objects.get(Username = uname)
                c = request.session['classname']
                message = "Exam Paper Posted Successfully"
                instance = form.save(commit = False)
                instance.Owner = u
                instance. class_name_O = c
                instance.Post_Date = datetime.today()
                instance.Sub_Date = request.POST['sub_date']
                instance.Type = 2
                instance.save()
            except:
                pass
    else:
        form = DocForm()
    return render(request, "UpExam.html", {'form' : form, 'message' : message})
#See the Classworks
def Classworks(request):
    uname = request.session['username']
    u = Userdata.objects.get(Username = uname)
    #get IMAGE and convert to RGB
    imgElon = face_recognition.load_image_file(u.Image)
    imgElon = cv2.cvtColor(imgElon, cv2.COLOR_BGR2RGB)#only can encode RGB

    #locate face and get encodings of face that are distinct
    faceLoc = face_recognition.face_locations(imgElon)[0] #inaccurate so not shown in video
    encodeElon =  face_recognition.face_encodings(imgElon)[0]
    p = 0
    cap =  cv2.VideoCapture(0) 
    #cap.set(200, 200)
    cap.set(3, 640)
    cap.set(4, 480)
    while True:
        success, img = cap.read()
        imgS = cv2.resize(img,(0,0),None, .25, .25)
        imgS = cv2.cvtColor(imgS, cv2.COLOR_BGR2RGB)
        facesincurrentframe = face_recognition.face_locations(imgS)
        encodesincurrentframe = face_recognition.face_encodings(imgS, facesincurrentframe)#video encoding
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) ####
        
        for encodeFace, faceLoc in zip(encodesincurrentframe, facesincurrentframe):
            #faceDis = face_recognition.face_distance([encodeElon], encodeFace)
            matches = face_recognition.compare_faces([encodeElon], encodeFace)
            if matches[0]:
                p = 10
                faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
                faces = faceCascade.detectMultiScale(
                    gray,     
                    scaleFactor=1.2,
                    minNeighbors=5,     
                    minSize=(20, 20)
    )
                for (x,y,w,h) in faces:
                    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
                    cv2.putText(img, u.Username,(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
                    roi_gray = gray[y:y+h, x:x+w]
                    roi_color = img[y:y+h, x:x+w]

            else:
                p = 5
                faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
                faces = faceCascade.detectMultiScale(
                    gray,     
                    scaleFactor=1.2,
                    minNeighbors=5,     
                    minSize=(20, 20)
    )
                for (x,y,w,h) in faces:
                    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
                    cv2.putText(img,"MISMATCH",(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
                    roi_gray = gray[y:y+h, x:x+w]
                    roi_color = img[y:y+h, x:x+w]
        cv2.imshow('Webcam', img)
        k = cv2.waitKey(30) & 0xff
        if k == 27: # press 'ESC' to quit
            break 
    cap.release() 
    cv2.destroyAllWindows()
    if p == 10:
        s = request.session['classname']

        O = Ownerdoc.objects.all().filter(class_name_O = s, Type = 1).order_by('-Serialo')
        form = WorkerForm()
        try:
            now = datetime.now()
            uname = request.session['username']
            u = Userdata.objects.get(Username = uname)
            s = request.session['classname']
            A = Attendance(Date_attended = now, Student = u, W_class = s)
            A.save()
            msg = "Attendance for today marked"
            return render(request,"classw.html",{'O' : O, 'form' : form, 'message': msg})
        except:
            return render(request,"classw.html",{'O' : O, 'form' : form})
    else:
        return redirect('Dash')
#Submit Classwork
def submitc(request,pk):
    message = 0 
    if request.method == "POST":
        form = WorkerForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                uname = request.session['username']
                u = Userdata.objects.get(Username = uname)
                c = request.session['classname']
                message = "Classwork Submitted Successfully"
                instance = form.save(commit = False)
                instance.Owner_w = u
                instance.class_name = c
                instance.Doc_path = pk
                now = datetime.today()
                instance.Sub_Date_w = now
                instance.Late = False
                instance.save()
            except:
                pass
    else:
        form = WorkerForm()
    return redirect('Dash')

def ExamView(request):
    s = request.session['classname']
    O = Ownerdoc.objects.all().filter(class_name_O = s, Type = 2).order_by('-Serialo')
    return render(request,"Exambuttons.html",{'O': O})

#View Exams
def Exams(request, pk):
    uname = request.session['username']
    u = Userdata.objects.get(Username = uname)
    #get IMAGE and convert to RGB
    imgElon = face_recognition.load_image_file(u.Image)
    imgElon = cv2.cvtColor(imgElon, cv2.COLOR_BGR2RGB)#only can encode RGB

    #locate face and get encodings of face that are distinct
    faceLoc = face_recognition.face_locations(imgElon)[0] #inaccurate so not shown in video
    encodeElon =  face_recognition.face_encodings(imgElon)[0]
    p = 0
    cap =  cv2.VideoCapture(0) 
    #cap.set(200, 200)
    cap.set(3, 640)
    cap.set(4, 480)
    while True:
        success, img = cap.read()
        imgS = cv2.resize(img,(0,0),None, .25, .25)
        imgS = cv2.cvtColor(imgS, cv2.COLOR_BGR2RGB)
        facesincurrentframe = face_recognition.face_locations(imgS)
        encodesincurrentframe = face_recognition.face_encodings(imgS, facesincurrentframe)#video encoding
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) ####
        
        for encodeFace, faceLoc in zip(encodesincurrentframe, facesincurrentframe):
            #faceDis = face_recognition.face_distance([encodeElon], encodeFace)
            matches = face_recognition.compare_faces([encodeElon], encodeFace)
            if matches[0]:
                p = 10
                faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
                faces = faceCascade.detectMultiScale(
                    gray,     
                    scaleFactor=1.2,
                    minNeighbors=5,     
                    minSize=(20, 20)
    )
                for (x,y,w,h) in faces:
                    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
                    cv2.putText(img, u.Username,(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
                    roi_gray = gray[y:y+h, x:x+w]
                    roi_color = img[y:y+h, x:x+w]

            else:
                p = 5
                faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
                faces = faceCascade.detectMultiScale(
                    gray,     
                    scaleFactor=1.2,
                    minNeighbors=5,     
                    minSize=(20, 20)
    )
                for (x,y,w,h) in faces:
                    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
                    cv2.putText(img,"MISMATCH",(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
                    roi_gray = gray[y:y+h, x:x+w]
                    roi_color = img[y:y+h, x:x+w]
        cv2.imshow('Webcam', img)
        k = cv2.waitKey(30) & 0xff
        if k == 27: # press 'ESC' to quit
            break 
    cap.release() 
    cv2.destroyAllWindows()
    if p == 10:
        s = request.session['classname']
        O = Ownerdoc.objects.all().filter(class_name_O = s, Type = 2, Serialo = pk).order_by('-Serialo')
        form =  WorkerForm()
        return render(request,"examw.html",{'O' : O, 'form' : form})
    if p == 5:
        uname = request.session['username']
        u = Userdata.objects.get(Username = uname)
        s = request.session['classname']
        A = Alert(classname_a = s, Student_a = u, type = "Mismatch")
        A.save()
        msg = "Image mismatch so wont allowed to sit for exam"
        return render(request, "Breach.html", {'message' : msg})
    if p == 0:
        return redirect('EV')
#Submit Exams
def examc(request, pk):
    message = 0
    if request.method == "POST":
        form = WorkerForm(request.POST, request.FILES)
        if form.is_valid():
            try:
                uname = request.session['username']
                u = Userdata.objects.get(Username = uname)
                c = request.session['classname']
                message = "Classwork Submitted Successfully"
                instance = form.save(commit = False)
                instance.Owner_w = u
                instance.class_name = c
                instance.Doc_path = pk
                now = datetime.now()
                instance.Sub_Date_w = now
                k = Ownerdoc.objects.get(Serialo = pk)
                s = k.Sub_Date
                timess = s.replace(tzinfo = None)
                kk = Check.objects.get(aidi= 1)
                if kk.checkopen == request.session['ExamChecker']:
                    A = Alert(classname_a = c, Student_a = u, type = "Did not open CAM.")
                    A.save()
                if timess  < now:
                    instance.Late = True
                    instance.save()
                    d = Check.objects.get(aidi = 1)
                    s = d.number
                    s = s+1
                    d.number = s
                    d.save()
                else:
                    instance.Late = False
                    instance.save()
                    d = Check.objects.get(aidi = 1)
                    s = d.number
                    s = s+1
                    d.number = s
                    d.save()

            except:
                pass
    else:
        form = WorkerForm() 
    return redirect('EV') 
#View Stream
def StreamCon(request):
    c = request.session['classname']
    S = Stream.objects.all().filter(Classname = c).order_by('-Streamno')
    form = StreamForm()
    return render(request, "Streamone.html", {'form': form, 'S' : S})
#add to stream
def StreamView(request):
    if request.method == "POST":
        form = StreamForm(request.POST)
        if form.is_valid():
            try:
                uname = request.session['username']
                u = Userdata.objects.get(Username = uname)
                C = request.session['classname']
                instance = form.save(commit = False)
                instance.Classname = C
                instance.posted = u
                instance.save()
            except:
                pass 
    return redirect('SC') 
#View People
def People(request):
    C = request.session['classname']
    U = ClassGrp.objects.all().filter(Cname = C)
    k = U
    r1 = Roles.objects.get(Role = 'Teacher')
    r2 = Roles.objects.get(Role = 'Student')
 
    return render(request, "People.html", {'u': k, 'r1' : r1, 'r2': r2})

def ViewClasswork(request):
    C = request.session['classname']
    w =  Ownerdoc.objects.all().filter(class_name_O = C, Type = 1)
    return render(request, "ViewClasswork.html",{'w': w})

def ClassworkDetails(request, pk):
    s = Workerdoc.objects.all().filter(Doc_path = pk)

    return render(request, "Cdetails.html", {'s' : s})

def ViewExam(request):
    C = request.session['classname']
    w = Ownerdoc.objects.all().filter(class_name_O = C, Type = 2).order_by('-Serialo')
    return render(request, "ViewExams.html", {'w' : w})

def ExamDetails(request, pk):
    C = request.session['classname']
    form = GradeForm()
    S = Workerdoc.objects.all().filter(Doc_path = pk)
    G = Grade.objects.all().filter(ownerd = pk)

    return render(request, "Examdetails.html", {'s' : S, 'form' : form, 'g': G})



def Student_attendance(request):
    C = request.session['classname']
    att = Attendance.objects.all().filter(W_class = C)
    return render(request, "Studentatt.html", {'att' : att})











def recognitionstart(request):
    u = Userdata.objects.get(Serial = 3)
    #get IMAGE and convert to RGB
    imgElon = face_recognition.load_image_file('media/test/ELONMUSK1.jpg')
    imgElon = cv2.cvtColor(imgElon, cv2.COLOR_BGR2RGB)
    imgTest = face_recognition.load_image_file('media/test/Rafat_test.jpg')
    imgTest = cv2.cvtColor(imgTest, cv2.COLOR_BGR2RGB)

    #locate face and get encodings of face that are distinct
    faceLoc = face_recognition.face_locations(imgElon)[0]
    encodeElon =  face_recognition.face_encodings(imgElon)[0]

    cv2.rectangle(imgElon, (faceLoc[0], faceLoc[3]), (faceLoc[1], faceLoc[2]), (255, 0, 255), 2)

    faceLocTest = face_recognition.face_locations(imgTest)[0]
    encodeElonTest =  face_recognition.face_encodings(imgTest)[0]

    cv2.rectangle(imgTest, (faceLocTest[0], faceLocTest[3]), (faceLocTest[1], faceLocTest[2]), (255, 0, 255), 2)
    #distance and compare whether matched or not
    faceDis = face_recognition.face_distance([encodeElon], encodeElonTest)
    results = face_recognition.compare_faces([encodeElon], encodeElonTest)
    print(results, faceDis)
    cv2.putText(imgTest, f'{results}{round(faceDis[0], 2)}', (50, 50), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2)

    cv2.imshow('ELONMUSK1', imgElon)
    cv2.imshow('ELONMUSK2', imgTest)
    cv2.waitKey(0)
    
    return redirect('login')

def VideoCap(request):
    uname = request.session['username']
    u = Userdata.objects.get(Username = uname)
    #get IMAGE and convert to RGB
    imgElon = face_recognition.load_image_file(u.Image)
    imgElon = cv2.cvtColor(imgElon, cv2.COLOR_BGR2RGB)#only can encode RGB
    A = Check.objects.get(aidi = 1)
    s = A.number
    #locate face and get encodings of face that are distinct
    faceLoc = face_recognition.face_locations(imgElon)[0] #inaccurate so not shown in video
    encodeElon =  face_recognition.face_encodings(imgElon)[0]
    p = 0
    cap =  cv2.VideoCapture(0) 
    #cap.set(200, 200)
    cap.set(3, 640)
    cap.set(4, 480)
    while True:
        success, img = cap.read()
        imgS = cv2.resize(img,(0,0),None, .25, .25)
        imgS = cv2.cvtColor(imgS, cv2.COLOR_BGR2RGB)
        facesincurrentframe = face_recognition.face_locations(imgS)
        encodesincurrentframe = face_recognition.face_encodings(imgS, facesincurrentframe)#video encoding
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) ####
        k = Check.objects.get(aidi = 1)
        t = k.number
        
        if t != s:
            cap.release() 
            cv2.destroyAllWindows()
            return render(request, "Cooperation.html")
        pin = k.checkopen 
        k.checkopen = pin + 1
        k.save() 
        for encodeFace, faceLoc in zip(encodesincurrentframe, facesincurrentframe):
            #faceDis = face_recognition.face_distance([encodeElon], encodeFace)
            matches = face_recognition.compare_faces([encodeElon], encodeFace)
            if matches[0]:
                p = 10
                faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
                faces = faceCascade.detectMultiScale(
                    gray,     
                    scaleFactor=1.2,
                    minNeighbors=5,     
                    minSize=(20, 20)
    )
                
                for (x,y,w,h) in faces:
                    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
                    cv2.putText(img, u.Username,(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
                    roi_gray = gray[y:y+h, x:x+w]
                    roi_color = img[y:y+h, x:x+w]

            if matches[0] != True:
                p = 5 
                
                k = request.session['classname']
                rth =  Userdata.objects.get(Username = uname)
                q = Alert(classname_a = k, Student_a = rth, type = "Others detected very near/Cheating")
                q.save()
                msg = "Alert sent of Cheating"
                cap.release() 
                cv2.destroyAllWindows()
                return render(request, "Breach.html",{'message' : msg})
                faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
                faces = faceCascade.detectMultiScale(
                    gray,     
                    scaleFactor=1.2,
                    minNeighbors=5,     
                    minSize=(20, 20)
    )
                for (x,y,w,h) in faces:
                    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
                    cv2.putText(img,"MISMATCH",(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
                    roi_gray = gray[y:y+h, x:x+w]
                    roi_color = img[y:y+h, x:x+w]
                    
        cv2.imshow('Webcam', img)
        k = cv2.waitKey(30) 
    cap.release() 
    cv2.destroyAllWindows()
    return render(request, "Breach.html")

def Camera(request):
    faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
    cap = cv2.VideoCapture(0)
    cap.set(3,1280) # set Width
    cap.set(4,960) # set Height
    while True:
        ret, img = cap.read()
        #img = cv2.flip(img, -1) 
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = faceCascade.detectMultiScale(
            gray,     
            scaleFactor=1.2,
            minNeighbors=5,     
            minSize=(20, 20)
    )
        for (x,y,w,h) in faces:
            cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
            cv2.putText(img, "Rafat",(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
            roi_gray = gray[y:y+h, x:x+w]
            roi_color = img[y:y+h, x:x+w]  
        cv2.imshow('video',img)
        k = cv2.waitKey(30) & 0xff
        if k == 27: # press 'ESC' to quit
            break
    cap.release()
    cv2.destroyAllWindows()
    return redirect('login')

def multfunct(request, pk):
    pkt = pk
    Camera(request, pkt)
    return redirect('EV')


def AttendanceFunc(request):
    c = request.session['classname']
    uname = request.session['username']
    u = Userdata.objects.get(Username = uname)
    A = Attendance.objects.all().filter( Student = u, W_class = c).order_by('-Date_attended')
    return render(request, "Attendanceview.html",{'k': A})

def classAttendance(request):
    c = request.session['classname']
    A = Attendance.objects.all().filter(W_class = c).order_by('-Date_attended')
    return render(request, "ClassAtt.html", {'k' : A})


def teacherAlert(request):
    c = request.session['classname']
    T = Alert.objects.all().filter(classname_a = c).order_by('-Serialno')
    return render(request, "Alertdis.html", {'A': T})


def GradeSub(request, pk):
    msg = "Grade Submitted"
    if request.method == "POST":
        form = GradeForm(request.POST)
        if form.is_valid():
            try:
        
                instance = form.save(commit = False)
                w = Workerdoc.objects.get(Serialw = pk)
                instance.ownerd = w.Doc_path
                instance.workerd = w.Owner_w

                instance.save()
                return redirect('viewExam')
            except:
                return render(request,"Already.html", {"message" : msg})
    
        return redirect('ExamD')


    #return redirect('ExamD')

def printGrade(request):
    c = request.session['classname']
    uname = request.session['username']
    u = Userdata.objects.get(Username = uname)
    Grades = Grade.objects.all().filter(workerd = u)
    W = Workerdoc.objects.all().filter(Owner_w = u)
    return render(request, "GradeView.html", {'G' : Grades, 'w': W})


def logout(request):
    auth.logout(request)
    return redirect("login")

def JustVid(request):
    uname = request.session['username']
    u = Userdata.objects.get(Username = uname)
    #get IMAGE and convert to RGB
    imgElon = face_recognition.load_image_file(u.Image)
    imgElon = cv2.cvtColor(imgElon, cv2.COLOR_BGR2RGB)

    #locate face and get encodings of face that are distinct
    faceLoc = face_recognition.face_locations(imgElon)[0]
    encodeElon =  face_recognition.face_encodings(imgElon)[0]
    
    cap =  cv2.VideoCapture(0) 
    #cap.set(200, 200)
    cap.set(3, 640)
    cap.set(4, 480)
    while True:
        success, img = cap.read()
        imgS = cv2.resize(img,(0,0),None, .25, .25)
        imgS = cv2.cvtColor(imgS, cv2.COLOR_BGR2RGB)
        facesincurrentframe = face_recognition.face_locations(imgS)
        encodesincurrentframe = face_recognition.face_encodings(imgS, facesincurrentframe)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        
        for encodeFace, faceLoc in zip(encodesincurrentframe, facesincurrentframe):
            #faceDis = face_recognition.face_distance([encodeElon], encodeFace)
            matches = face_recognition.compare_faces([encodeElon], encodeFace)
            if matches[0]:
                faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
                faces = faceCascade.detectMultiScale(
                    gray,     
                    scaleFactor=1.2,
                    minNeighbors=5,     
                    minSize=(20, 20)
    )
                for (x,y,w,h) in faces:
                    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
                    cv2.putText(img, u.Username,(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
                    roi_gray = gray[y:y+h, x:x+w]
                    roi_color = img[y:y+h, x:x+w]

            else:
                faceCascade = cv2.CascadeClassifier('media/Cascades/haarcascade_frontalface_default.xml')
                faces = faceCascade.detectMultiScale(
                    gray,     
                    scaleFactor=1.2,
                    minNeighbors=5,     
                    minSize=(20, 20)
    )
                for (x,y,w,h) in faces:
                    cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
                    cv2.putText(img,"MISMATCH",(x +6, y -6), cv2.FONT_HERSHEY_COMPLEX, 1, (0, 0, 255),2 )
                    roi_gray = gray[y:y+h, x:x+w]
                    roi_color = img[y:y+h, x:x+w]
        cv2.imshow('Webcam', img)
        k = cv2.waitKey(30) & 0xff
        if k == 27: # press 'ESC' to quit
            break 
    cap.release() 
    cv2.destroyAllWindows()
    return redirect('Adda')
