from django.conf import settings
from django.utils import translation


class LanguageMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        print('LANGUAGE_CODE:{}'.format(settings.LANGUAGE_CODE))
        # if language set to default in format 'en-us'
        if settings.LANGUAGE_CODE == 'en-us':
            user_language = str(request.META['HTTP_ACCEPT_LANGUAGE'][:2])
            print('LANGUAGE_CODE_IF:{}'.format(user_language))
        else:
            user_language = settings.LANGUAGE_CODE
            print('LANGUAGE_CODE_ELSE:{}'.format(user_language))
            
        translation.activate(user_language)
        request.session[translation.LANGUAGE_SESSION_KEY] = user_language
        # Code to be executed for each request before
        # the view (and later middleware) are called.

        response = self.get_response(request)

        # Code to be executed for each request/response after
        # the view is called.

        return response
