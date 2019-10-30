import importlib
from django.conf import settings
from django.contrib import admin
from django.apps import apps

# automatic registration module
models = apps.get_models()
for model in models:
    model_name = str(model.__name__)

    # filtering user apps
    #model_module = None
    #for m in settings.INSTALLED_APPS:
        #if m.split(".")[0] == 'django':
            #continue
        #try:
            #model_module = apps.get_model(app_label=m.split(".")[-1], model_name=model_name)
            #break
        #except LookupError:
            #pass
        
    #if model_module is None:
        #continue

    #print('MODEL_MODULE:{}'.format(model.__module__))

    # import and registration
    app_list = model.__module__.split(".")
    idx = app_list.index('models')
    app1 = app_list[idx-1]
    del app_list[idx:]

    #print('APP_LIST:{}'.format(app_list))

    try:
        module = importlib.import_module('.'.join(app_list)+'.'+app1.title()+'Admin')
    except ImportError:
        continue
    #print('CLASS_ADMIN:{}'.format(model_name+'Admin'))
    class_admin = module.str_to_class(model_name+'Admin')
    if class_admin is None:
        continue
    try:
        admin.site.register(model, class_admin)
    except admin.sites.AlreadyRegistered:
        pass

