from django.http import HttpResponse

def home1(request):
    return render(request, 'login.html')

def name(request):
    return render(request, 'index.html',{'name' : 'Rafat'})

def age(request):
    return render(request, 'adDash.html')