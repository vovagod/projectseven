import sys
from django.views.debug import SafeExceptionReporterFilter, ExceptionReporter
from django.conf import settings


CLEANSED_SUBSTITUTE = '********************'

class CustomExceptionReporterFilter(SafeExceptionReporterFilter, ExceptionReporter):

    CLEANSED_SUBSTITUTE = '********************'

    def is_active(self, request):
        return settings.DEBUG is False

    def get_post_parameters(self, request):
        
        if self.is_active(request):
            
            cleansed = request.POST.copy()
                #if sensitive_post_parameters == '__ALL__':
                    # Cleanse all parameters.
            for k in cleansed:
                cleansed[k] = CLEANSED_SUBSTITUTE
            return cleansed

    def get_traceback_frame_variables(self, request, tb_frame):
        
        cleansed = {}
        if self.is_active(request):
            #if sensitive_variables == '__ALL__':
                # Cleanse all variables
            for name in tb_frame.f_locals:
                cleansed[name] = CLEANSED_SUBSTITUTE

            for name, value in tb_frame.f_locals.items():
                cleansed[name] = CLEANSED_SUBSTITUTE

            cleansed['func_args'] = CLEANSED_SUBSTITUTE
            cleansed['func_kwargs'] = CLEANSED_SUBSTITUTE
        print('CLEANSED:{}'.format(cleansed.items()))
        return cleansed.items()


    def get_traceback_data(self):
        c = super(CustomExceptionReporterFilter, self).get_traceback_data(*args, **kwargs)
        print('C:{}'.format(c))
        c.pop('request')
        c.pop('settings')
        return c

    

   

        
       
