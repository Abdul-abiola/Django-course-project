# Django-course-project
This is about my django login first project


##📂 Project Structure
Code


Copy
login_project/
├── manage.py
├── login_project/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│   └── asgi.py
├── accounts/
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── forms.py
│   ├── models.py
│   ├── urls.py
│   ├── views.py
│   └── templates/
│       └── registration/
│           ├── login.html
│           ├── signup.html
│           └── base.html
└── requirements.txt
⚙️ Key Files
requirements.txt

Code


Copy
Django>=4.0
settings.py (snippet)

Python


Copy
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'accounts',
]

LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/accounts/login/'
accounts/views.py

Python


Copy
from django.contrib.auth import login
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect

def signup_view(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('/')
    else:
        form = UserCreationForm()
    return render(request, 'registration/signup.html', {'form': form})
accounts/urls.py

Python


Copy
from django.urls import path
from . import views

urlpatterns = [
    path('signup/', views.signup_view, name='signup'),
]
login_project/urls.py

Python


Copy
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
]
This gives you:

A signup page (/accounts/signup/)

A login page (/accounts/login/)

Logout handling

Redirects after login/logout


