from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def home(request):
    """
    Simple home page view for the utility app.
    """
    context = {
        'title': 'Utility App',
        'message': 'Welcome to the Utility App!',
    }
    return render(request, 'utility_app/home.html', context)
