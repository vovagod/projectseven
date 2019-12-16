from django.conf import settings
from django.utils import translation
from django.core.cache import cache
from mysite.base.models import LangInfo



class LanguageMiddleware:

    
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        #lang = translation.get_language_from_request(request, check_path=True)
        #self.lang = request.LANGUAGE_CODE
        #print('LANGUAGE_CODE:{}'.format(self.lang))
        #LANG = translation.get_language()[:2]
        # if language set to default in format 'en-us'
        #if settings.LANGUAGE_CODE == 'en-us':
        #if LANG == 'en-us':
            #user_language = str(request.META['HTTP_ACCEPT_LANGUAGE'][:2])
        #else:
            #user_language = settings.LANGUAGE_CODE
            
        #translation.activate(lang)
        
        
        
        # Code to be executed for each request before
        # the view (and later middleware) are called.

        response = self.get_response(request)

        print('SESSION_COOKIE_NAME:{}'.format(settings.SESSION_COOKIE_NAME))

        response.delete_cookie(
                    settings.SESSION_COOKIE_NAME,
                    path=settings.SESSION_COOKIE_PATH,
                    domain=settings.SESSION_COOKIE_DOMAIN,
                )

        current = request.session.get(translation.LANGUAGE_SESSION_KEY, False)
        print('LANGUAGE_CURRENT:{}'.format(current))
        new = request.LANGUAGE_CODE
        if new != current:
            del request.session['translation.LANGUAGE_SESSION_KEY']
            #request.session.flush()
        request.session[translation.LANGUAGE_SESSION_KEY] = new
        #cache.set('lang', lang, 3)
        print('LANGUAGE_NEW:{}'.format(new))

        #lang = request.LANGUAGE_CODE
        
        #cache.set('lang', lang, 3)
        #print('LANGUAGE_CODE:{}'.format(cache.get('lang')))
        
        #translation.activate(lang)
        #request.session[translation.LANGUAGE_SESSION_KEY] = lang

        # Code to be executed for each request/response after
        # the view is called.
        #global LANG
        #LANG = request.LANGUAGE_CODE
        #cache.set('lang', lang, 3)
        #request.session[translation.LANGUAGE_SESSION_KEY] = request.LANGUAGE_CODE
        #print('LANGUAGE_CODE:{}'.format(LANG))
        #print('RESPONSE:{}'.format(response.__dict__))

        return response
