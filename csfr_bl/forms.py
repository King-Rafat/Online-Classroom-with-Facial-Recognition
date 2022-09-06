from django import forms
from django.forms.widgets import Widget
from first.models import Userdata, Roles, Ownerdoc, ClassGrp, Workerdoc, Stream, Grade
from django.forms import DateTimeInput
from django.contrib.admin.widgets import AdminSplitDateTime 
class RolesForm(forms.ModelForm):
    class Meta:
        model = Roles
        fields = ('Role',)

class UserForm(forms.ModelForm):
    class Meta:
        model = Userdata
        fields = ('Username', 'Email', 'password', 'Role', 'Image')


class DocForm(forms.ModelForm):
    class Meta:
        model = Ownerdoc
        fields = ('Doc_name', 'Cmnt' ,'File')
        

class ClassForm(forms.ModelForm):
    class Meta:
        model  = ClassGrp
        fields = ('Cname', 'Cowner')



class WorkerForm(forms.ModelForm):
    class Meta:
        model = Workerdoc
        fields = ('Doc_name_w', 'Filew')

class StreamForm(forms.ModelForm):
    class Meta:
        model = Stream
        fields = ('Content',)
        widgets ={

            'Content':forms.TextInput(attrs={'class':'input'}),

        }


class GradeForm(forms.ModelForm):
    class Meta:
        model = Grade
        fields = ('Grade_c',)
