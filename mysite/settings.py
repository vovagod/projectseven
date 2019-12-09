"""
Django settings for mysite project.

Generated by 'django-admin startproject' using Django 2.0.4.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.0/ref/settings/
"""

import os
from django.contrib import admin
from django.utils.translation import ugettext_lazy as _

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'rrrh4^o!qkw!^=h)y455jn68&vi^u@(c%5-xke!$7y0djo#&wq'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True


ALLOWED_HOSTS = ['*',]


DOMAIN = 'www.comaex.info'


# Application definition
INSTALLED_APPS = [
    'admin_actions',
    'django_object_actions',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'mysite.base',
    'interaction',
    'clients',
    'promotion',
    'scheduler',
]


#AUTH_USER_MODEL = 'accounts.User'
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.common.BrokenLinkEmailsMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]


# Manager data
MANAGERS = ['chim73@mail.ru',]

ROOT_URLCONF = 'mysite.urls'


TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'mysite/base/templates'),],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]


ADMIN = os.path.dirname(os.path.abspath(admin.__file__))
STATICFILES_DIRS = ( BASE_DIR + '/mysite/base/static/',
                     ADMIN + '/static/admin/',
                     )


WSGI_APPLICATION = 'mysite.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.0/ref/settings/#databases
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}


CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': 'unique-snowflake',
    }
}

# Password validation
# https://docs.djangoproject.com/en/2.0/ref/settings/#auth-password-validators
AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# AWS Email settings
EMAIL_USE_TLS = True
EMAIL_HOST = 'email-smtp.us-east-1.amazonaws.com'
EMAIL_HOST_USER = 'AKIAZ37L3WD4CXMH5AZK' 
EMAIL_HOST_PASSWORD = 'BPf6zVOe65C+V7LHLsYbNRy59ySdAeMACTsMXaDnWeuh'
SUBJECT = "Amazon SES Email"
FROM = 'comaex.info@comaex.info'
EMAIL_PORT = 587


# Internationalization
# https://docs.djangoproject.com/en/2.0/topics/i18n/
LANGUAGE_CODE = 'ru'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True # was false
USE_TZ = False  # was false


LOCALE_PATHS = (
    BASE_DIR + '/mysite/locale',
    )


# DateTime format
DATETIME_FORMAT = 'd-m-Y H:i' 


# User settings
CATEGORIES = (
    ('HVAC', 'HVAC'), #[0][0]
    ('Smart Home', 'Smart Home'), #[1][0]
    ('IoT', 'IoT'), #[2][0]
    ('Facebook', 'Facebook'), #[3][0]
    ('Mathematics', 'Mathematics'), #[4][0]
    ('SFUGD', 'SFUGD'), #[5][0]
    )


# Language tuple
LANG = (
    ('RU', 'RU'), #[0][0]
    ('EN', 'EN'), #[1][0]
    )


# Subjects and templates for mail
SUBJECT_MAIL = {
    'HVAC':_('Business proposition'),
    'Smart Home':_('Business proposition'),
    'IoT':_('Business proposition'),
    'Facebook':_('Business proposition'),
    'Mathematics':_('Business proposition'),
    'SFUGD':_('Business proposition'),
    }

TEMPLATE_MAIL = {
    'HVAC':'proposition',
    'Smart Home':'proposition',
    'IoT':'proposition',
    'Facebook':'proposition',
    'Mathematics':'proposition',
    'SFUGD':'proposition',
    }


# Tick interval(must be 3600 sec)
SURVEY_TIME_ONE = 36
SURVEY_TIME_TWO = 10
SURVEY_TIME_THREE = 20
SURVEY_TIME_FOUR = 30
SURVEY_TIME_FIVE = 40 
SURVEY_TIME_SIX = 50 


# Valid extensions list
VALID_EXTENSIONS = ['pdf', 'doc', 'docx', 'jpg', 'png', 'xlsx', 'xls']


# Preorder form context
INTRODUCTION = _("<p style='text-align:justify'>&ensp;Please fill in the form fields. "
      "In the last field, attach the file(s) with a list of controlled parameters in the form"
      " of a sheet of Modbas variables of your controller. "
      "Attach the file(s) with device mnemonics in the same field in the form convenient for you. "
      "Based on the information received, we will create working mnemonic diagrams and, together with the variables, "
      "enter this data into the server and send you a link to the real working application of your order. "
      "After you just have to install the server on the object and start it in work.</p>"
     )
ASTERISK = _("<p style='font-size: 14px; color:gray'>*change if not matching</p>")


# Search phrases and response messages
CREDENTIALS = [_('login'), _('password'), _('enter'), _('data')]
CALLME = [_('interested'), _('please'), _('call'), _('me')]
SUCCESS = _("Your request has been sent successfully!")
MESSAGE_COMMON = {'common':_('We have received your message and will contact you shortly.'),}
MESSAGE_CREDENTIALS = {'credentials':_('To enter use login: user, password: user12345.'),}
MESSAGE_SUCCESS = _("Login data sent to your email.")
MESSAGE_CALLME = {'callme':_('We will contact you in the next hour.'),}

# Client action messages
ACTION_UNSUBSCRIBE = _('You have successfully unsubscribed from the emailing')
ACTION_INTERESTED = _('Thank you for rating!')
ACTION_SUCCESS = _('Thank you, your pre-order has been received!')

# Contact form phrases
PHRASE_ONE = _('I am interested, please contact me')
PHRASE_TWO = _('Please send me login details for Comaex Demo')

# Comaex email template content
PHONE = '+7(985)482-85-88'
EMAIL_ADDRESS = 'comaex.info@yandex.ru'
COMAEX_DEMO = 'http://comaex.ddns.net'
ADDRESS = _('Moscow, Sirenevy bulvar 32')
FOOTER_TITLE = _('Supervisor-server Comaex')


# SFUGD email template content
SFUGD_DOMAIN = 'www.fold-up-door.com'
SFUGD_SITE = 'http://www.fold-up-door.com'
SFUGD_TITLE = _('Compact door SFUGD')


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.0/howto/static-files/
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
MEDIA_URL = '/static/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'static', 'media')
RAW_IMAGE_ROOT = os.path.join(BASE_DIR, 'static', 'media/raw_image')
LOGO_IMAGE = os.path.join(BASE_DIR, 'static', 'media/logo.jpg')


# Email template settings
PATH = 'https://'+DOMAIN+'/static/media/'
if DEBUG:
    PATH = '/media/'
    MEDIA_URL = '/media/'
    DOMAIN = '127.0.0.1:8000'
    
# Comaex (HVAC, IoT, Smart Home) email template data
MSG = {'letter':PATH+'letter.png',
        'url':'https://'+DOMAIN,
        'logo': PATH+'logo.png',
        'website':PATH+'website.png',
        'phone':PATH+'phone.png',
        'email':PATH+'email.png',
        'address':PATH+'address.png',
        'mobile':PHONE,
        'mail':EMAIL_ADDRESS,
        'comaex_demo':COMAEX_DEMO,
        'domain':DOMAIN,
        'addr':ADDRESS,
        'title':FOOTER_TITLE,
        'debug':DEBUG,
        'name': 'Comaex',
        'alt': 'Comaex server',
        'heading': _('Business proposition'),
        'unsub':_('Unsubscribe'),
        'inter':_('Interesting'),
        'preord':_('Pre-order'),
        }

# SFUGD email template data
SFUGD = {'url':'http://'+SFUGD_DOMAIN,
        'logo': PATH+'sfugd.png',
        'comaex_demo':COMAEX_DEMO,
        'domain':SFUGD_DOMAIN,
        'title':SFUGD_TITLE,
        'name': 'SFUGD',
        'alt': 'Compact door',
        'heading': _('Compact door. Patent US8327908'),
        'preord':_('Contact'),
        }

