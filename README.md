### A single-page website describing the supervisor-server Comaex

#### Technology stack

- Python 3.5
- Django 2.0
- PostgreSQL

##### Website is available on link: [www.comaex.info](https://www.comaex.info)

##### Clone the project from repository:

```bash
git clone https://github.com/vovagod/projectseven.git
```

##### Enter to projectseven directory and install virtual environment:

```bash
sudo apt install python3-venv
```
##### Run environment:

```bash
python3 -m venv myvenv
```

##### Activate environment:

```bash
source myvenv/bin/activate
```

##### Install wheel:  

```bash
pip3 install wheel
```

##### Install dependencies:

```bash
pip install -r requirements.txt
```

## DataBase deployment

##### Create database projectseven_db:

```bash
sudo -u postgres bash -c "psql -c \"CREATE DATABASE projectseven_db;\""
```
```bash
sudo -u postgres bash -c "psql -c \"CREATE USER user WITH PASSWORD 'password';\""
```
```bash
sudo -u postgres bash -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE projectseven_db TO user;\""
```

##### Create database projectseven_en:

```bash
sudo -u postgres bash -c "psql -c \"CREATE DATABASE projectseven_en;\""
```
```bash
sudo -u postgres bash -c "psql -c \"CREATE USER user WITH PASSWORD 'password';\""
```
```bash
sudo -u postgres bash -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE projectseven_en TO user;\""
```

##### Make migration database_ru:

```bash
python manage.py migrate --database=database_ru
```

##### Make migration database_en:

```bash
python manage.py migrate --database=database_en
```

##### Create superuser database_ru:

```bash
python manage.py createsuperuser --database database_ru --username user
```

##### Create superuser database_en:

```bash
python manage.py createsuperuser --database database_en --username user
```

##### Run project:

```bash
python manage.py runserver
```

##### In this project I use two patches that I want to share with the community

#### Patch first


>This non-trivial patch improve Django functionality
by providing automatic registration in main admin.py
of all admin files of the project

#####  admin.py module code:  

```python
import importlib
from django.contrib import admin
from django.apps import apps


 # automatic registration module
models = apps.get_models()
for model in models:
    model_name = str(model.__name__)

    # import and registration
    app_list = model.__module__.split(".")
    idx = app_list.index('models')
    app1 = app_list[idx-1]
    del app_list[idx:]

    try:
        module = importlib.import_module('.'.join(app_list)+'.'+app1.title()+'Admin')
    except ImportError:
        continue
    class_admin = module.str_to_class(model_name+'Admin')
    if class_admin is None:
        continue
    try:
        admin.site.register(model, class_admin)
    except admin.sites.AlreadyRegistered:
        pass
```

>An application admin file example. Make sure the module
name looks like ‘BaseAdmin.py’, where the module name
begins with the application name in uppercase as well
as the word ‘Admin’

#####  BaseAdmin.py module code:

```python
import sys

....

insert your code here

....


def str_to_class(str):
    try:
        obj = getattr(sys.modules[__name__], str)
    except AttributeError:
        return None
    return obj
```


#### Patch second


>This non-trivial patch improve Django functionality
by completely removing extra data, such as request and settings
from error email to ADMIN

##### logging settings in settings.py:
```python
ADMINS = [('Example', 'example@example.com')]

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,

    'filters': {
    'require_debug_false': {
        '()': 'django.utils.log.RequireDebugFalse',
        }
    },
    'handlers': {
        'console': {
            'level': 'DEBUG',
            'class': 'logging.StreamHandler',
        },
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'mysite.customfilter.CustomAdminEmailHandler', # the custom filter
            'include_html': False,
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins', 'console'],
            'level': 'ERROR',
            'propagate': False,
        },
    }
    }
```

##### customfilter.py:
```python
import sys
from django.views.debug import ExceptionReporter
from django.utils.log import AdminEmailHandler
from copy import copy


class CustomExceptionReporterFilter(ExceptionReporter):

    def get_traceback_data(self):
        c = super(CustomExceptionReporterFilter, self).get_traceback_data()
        del c['request']  # remove request data
        del c['settings'] # remove settings data
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
```
        
    
### License
                              
##### Code is licensed under the BSD License. See [LICENSE](https://en.wikipedia.org/wiki/BSD_licenses) for more information.
        
