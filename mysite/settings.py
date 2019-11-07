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
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

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

#STATICFILES_DIRS = [
    #"/mysite/base/static",
    #os.path.join(BASE_DIR, "mysite/base/static", "media"),
    #]

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


#DATABASES = {
    #'default': {
        #'ENGINE': 'django.db.backends.postgresql_psycopg2',
        #'NAME': 'projectseven_db',
        #'USER': 'admin',
        #'PASSWORD': '12345',
        #'HOST': '127.0.0.1',
        #'PORT': '5432',
    #}
#}


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


# Google Email settings
#EMAIL_USE_TLS = True
#EMAIL_HOST = 'smtp.gmail.com' 
#EMAIL_HOST_PASSWORD = '' 
#EMAIL_HOST_USER = 'gva008@gmail.com' 
#EMAIL_PORT = 587
#DEFAULT_FROM_EMAIL = 'Comaex server <comaex@gmail.com>'
#BASE_URL = '127.0.0.1:8000'


# Yandex Email settings
#EMAIL_USE_TLS = True
#EMAIL_HOST = 'smtp.yandex.ru' 
#EMAIL_HOST_PASSWORD = 'comaex2019info' 
#EMAIL_HOST_USER = 'comaex.info@yandex.ru' 
#EMAIL_PORT = 587
#DEFAULT_FROM_EMAIL = 'Comaex server <comaex.info@yandex.ru>'
#BASE_URL = '127.0.0.1:8000'

# AWS Email settings
EMAIL_USE_TLS = True
EMAIL_HOST = 'email-smtp.us-east-1.amazonaws.com'
EMAIL_HOST_USER = 'AKIAZ37L3WD4CXMH5AZK' 
EMAIL_HOST_PASSWORD = 'BPf6zVOe65C+V7LHLsYbNRy59ySdAeMACTsMXaDnWeuh'
SUBJECT = "Amazon SES Email"
FROM = 'comaex.info@comaex.info'
#IAM User Name = ses-smtp-user.20191102-135328
#SMTP Username = AKIAZ37L3WD4CXMH5AZK
#SMTP Password = BPf6zVOe65C+V7LHLsYbNRy59ySdAeMACTsMXaDnWeuh
#EMAIL_HOST_USER = 'comaex.info@yandex.ru' 
EMAIL_PORT = 587
#DEFAULT_FROM_EMAIL = 'Comaex server <comaex.info@comaex.info>'


# Internationalization
# https://docs.djangoproject.com/en/2.0/topics/i18n/

LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# User settings
CATEGORIES = (
    ('HVAC', 'HVAC'),
    ('Smart Home', 'Smart Home'),
    ('IoT', 'IoT'),
    ('Facebook', 'Facebook'),
    ('Mathematics', 'Mathematics'),
    )

SURVEY_TIME = 36


# Email template footer content
PHONE = '+7(985)482-85-88'
EMAIL_ADDRESS = 'comaex.info@comaex.info'
COMAEX_DEMO = 'http://comaex.ddns.net'
ADDRESS = 'Москва, Сиреневый бульвар 32'
FOOTER_TITLE = 'Супервизор-сервер Comaex'

MEDIA_URL = '/static/media/'

# email template settings
PATH = 'http://'+DOMAIN+'/static/media/'
if DEBUG:
    PATH = '/media/'
    MEDIA_URL = '/media/'
    DOMAIN = '127.0.0.1:8000'
MSG = {'letter':PATH+'letter.png',
        #'guest': guest,
        #'messages': message,
        'url':'http://'+DOMAIN,
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
        }


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.0/howto/static-files/

STATIC_URL = '/static/'


STATIC_ROOT = os.path.join(BASE_DIR, 'static')
#STATIC_ROOT = os.path.join(BASE_DIR, 'static')


#MEDIA_URL = '/static/media/'
#if DEBUG:
    #MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'static', 'media')
RAW_IMAGE_ROOT = os.path.join(BASE_DIR, 'static', 'media/raw_image')
LOGO_IMAGE = os.path.join(BASE_DIR, 'static', 'media/logo.jpg')

#PROTECTED_ROOT = os.path.join(os.path.dirname(BASE_DIR), "static_cdn", "protected_media")
