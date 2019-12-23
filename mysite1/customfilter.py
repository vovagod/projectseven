import sys
from django.views.debug import ExceptionReporter
from django.utils.log import AdminEmailHandler
from copy import copy


class CustomExceptionReporterFilter(ExceptionReporter):

    def get_traceback_data(self):
        c = super(CustomExceptionReporterFilter, self).get_traceback_data()
        del c['request']
        del c['settings']
        return c
    

class CustomAdminEmailHandler(AdminEmailHandler):
    '''
    Remove extra data - 'request' and 'settings' from context
    when sending error message to ADMIN
    '''

    def emit(self, record):
        try:
            request = record.request
            subject = '%s (%s IP): %s' % (
                record.levelname,
                ('internal' if request.META.get('REMOTE_ADDR') in settings.INTERNAL_IPS
                 else 'EXTERNAL'),
                record.getMessage()
            )
        except Exception:
            subject = '%s: %s' % (
                record.levelname,
                record.getMessage()
            )
            request = None
        subject = self.format_subject(subject)

        # Since we add a nicely formatted traceback on our own, create a copy
        # of the log record without the exception data.
        no_exc_record = copy(record)
        no_exc_record.exc_info = None
        no_exc_record.exc_text = None

        if record.exc_info:
            exc_info = record.exc_info
        else:
            exc_info = (None, record.getMessage(), None)

        reporter = CustomExceptionReporterFilter(request, *sys.exc_info())
        message = "%s\n\n%s" % (self.format(no_exc_record), reporter.get_traceback_text())
        html_message = reporter.get_traceback_html() if self.include_html else None
        self.send_mail(subject, message, fail_silently=True, html_message=html_message)

    

