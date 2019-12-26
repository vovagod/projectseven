from django.urls import path
from .views import ClientsActionView, ClientsPreorderView, ClientsBuyView


app_name = 'clients'

urlpatterns = [
    path('preorder/<uuid>', ClientsPreorderView.as_view(), name='preorder'),
    path('buy/<uuid>', ClientsBuyView.as_view(), name='buy'),
    path('<action>/<uuid>', ClientsActionView.as_view(), name='action'),
]
