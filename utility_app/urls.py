from django.urls import path
from . import views

app_name = 'utility_app'

urlpatterns = [
    path('', views.home, name='home'),
]
