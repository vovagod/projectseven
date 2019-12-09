"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from mysite.base.views import BaseRedirectView, emailview
from promotion.views import promotionview
from clients.views import download

app_name = 'mysite'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/', include('mysite.base.urls'), name='mysite-home'),
    path('', BaseRedirectView.as_view(), name='mysite-index'),
    path('email', emailview),  # test view
    path('promotion/<email>/<category>/<lang>', promotionview),  # test view
    path('email/', include('clients.urls'), name='mysite-clients'),
    path('uploads/<folder>/<file>', download),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

