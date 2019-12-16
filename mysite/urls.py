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
from django.conf.urls.i18n import i18n_patterns
from django.conf import settings
from django.conf.urls.static import static

from django.http import HttpResponseRedirect
from django.urls import reverse, resolve
from django.views.i18n import set_language

from mysite.base.views import BaseRedirectView, emailview
from promotion.views import promotionview
from clients.views import download

#from .urls import setlang

app_name = 'mysite'    


def setlang(request):
    try:
        del request.session['_lanuage']
    except KeyError:
        pass
    print('We are in setlang')
    return HttpResponseRedirect(reverse(set_language))
    #return resolve('i18n/setlang/')


urlpatterns = [
    #path('i18n/', include('django.conf.urls.i18n')),
    path('i18n/setlang/', setlang, name='set_language'),
    ]

urlpatterns += i18n_patterns(
    path('admin/', admin.site.urls),
    path('home/', include('mysite.base.urls'), name='mysite-home'),
    path('', BaseRedirectView.as_view(), name='mysite-index'),
    path('email', emailview),  # test view
    path('promotion/<email>/<category>/<lang>', promotionview),  # test view
    path('email/', include('clients.urls'), name='mysite-clients'),
    path('uploads/<folder>/<file>', download),
)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
