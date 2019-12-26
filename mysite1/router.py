from django.utils import translation


class Router(object):
    
    def db_for_read(self, model, **hints):
        try:
            lang = translation.get_language()[:2]
        except TypeError:
            lang = 'ru'
        if model._meta.app_label == 'sessions':
            return 'database_ru'
        if lang == 'en' and model._meta.app_label == 'base':
            return 'database_en'
        return 'database_ru'
        

    def db_for_write(self, model, **hints):
        try:
            lang = translation.get_language()[:2]
        except TypeError:
            lang = 'ru'
        if model._meta.app_label == 'sessions':
            return 'database_ru'
        if lang == 'en' and model._meta.app_label == 'base':
            return 'database_en'
        return 'database_ru'


    def allow_migrate(self, db, app_label, model=None, **hints):
    
        if db == 'database_en':
            return True
        if db == 'database_ru':
            return True


