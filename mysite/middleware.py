from django.utils import translation


class LanguageMiddleware:

    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        lang = translation.get_language_from_request(request, check_path=True)
        request.session[translation.LANGUAGE_SESSION_KEY] = lang
        
        # Code to be executed for each request before
        # the view (and later middleware) are called.

        response = self.get_response(request)

        # Code to be executed for each request/response after
        # the view is called.

        return response
