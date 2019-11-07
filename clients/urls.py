from django.urls import path
#from django.views.generic.edit import UpdateView
#from . import views
from .views import ClientsUnsubscribeView, ClientsInterestedView 


app_name = 'clients'

urlpatterns = [
    path('<uuid>', ClientsUnsubscribeView.as_view(), name='clientsview'),
    path('<uuid>', ClientsInterestedView.as_view(), name='clientsview'),
    
]
