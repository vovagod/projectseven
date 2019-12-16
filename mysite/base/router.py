from django.conf import settings
from django.utils import translation
#from django.http import HttpRequest
from django.core.cache import cache
from mysite.base.models import LangInfo

#LANG = translation.get_language()[:2]

class Router(object):

    #LANG = translation.get_language()[:2]
    
    def db_for_read(self, model, **hints):
        lang = translation.get_language()[:2]
        #print('LANG_IN_DB:{}'.format(hints.get('instance')))
        if lang == 'en':
            return 'database_en'
        return 'database_ru'
        

    def db_for_write(self, model, **hints):
        
      
        lang = translation.get_language()[:2]
    
        if lang == 'en':
            return 'database_en'
        return 'database_ru'

    #def allow_relation(self, obj1, obj2, **hints):
        
        #if obj1._meta.app_label == 'auth' or \
           #obj2._meta.app_label == 'auth':
           #return True
        #return False

    def allow_migrate(self, db, app_label, model=None, **hints):
        
        #if app_label == 'auth':
            #return db == 'auth_db'
        #return None
        #lang = cache.get('lang')
        #lang = translation.get_language()[:2]

        #if lang == 'en':
            #return 'database_en'
        return True


