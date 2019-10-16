from django.contrib import admin
from django.core.exceptions import ValidationError
#from django import forms
from markdown import markdown

from .models import Base, Menu, SubMenu, Contact, Image

#from mysite.forms import MyBaseForm

#class Base_Form(forms.ModelForm):

   #class Meta:
       #model = Base
       #fields = "__all__"

   #def clean_urllink(self):
       #print('CLEAN URLLINK')
       #if self.cleaned_data["urllink"] is None:
           #raise forms.ValidationError(u"You need set some urllink.")



class MenuAdmin(admin.ModelAdmin):
    list_display = ['title']
    fields = (('title', 'slug'),
              ('mark', 'fafa'),
              ('color'),
              )

class SubMenuAdmin(admin.ModelAdmin):
    list_display = ['subtitle']
    fields = (('submenu'),
              ('subtitle', 'subslug'),
              ('submark', 'subfafa'),
              ('subcolor'),
              )

class ImageInline(admin.StackedInline):
    model = Image
    extra = 1
    fields = (('name', 'image'),
              ('title', 'sentence'),
              ('description'),
              )
    exclude = ('slug',)
    #prepopulated_fields = {'slug': ('title', )}

class BaseAdmin(admin.ModelAdmin):
    #form = MyBaseForm
    list_display = ['menu', 'title','timestamp' ]
    fields = (('menu', 'title'),
              ('slug'),
              ('subtitle', 'sentence'),
              ('description'),
              #('description2'),
              #('description3'),
              ('urllink', 'filenum', 'flag'),
              ('image'),
              #('image2'),
              ('data1', 'data2', 'data3', 'data4'),
              )
    prepopulated_fields = {'slug': ('menu', )}

    inlines = [
        ImageInline,
    ]


    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit=False)
        for obj in formset.deleted_objects:
            obj.delete()
        for instance in instances:
            instance.desc_html = markdown(instance.description)
            instance.save()
            print('SAVE_FORMSET:{}'.format(instance.desc_html))
        formset.save_m2m()
        

    #def full_clean(exclude=None, validate_unique=True):
        #print('CLEAN FIELDS')
        #pass

    #def save_model(self, request, obj, form, change):
        #print('SAVE MODEL:{}'.format(obj.__dict__))
        #try:
            #obj.urllink = obj.urllink
        #except ValidationError:
            #print('ValidationError')
            #pass
            
        #obj.save()

    #def clean(self):
        #print('CLEAN FUNCTION')
        #cleaned_data = self.cleaned_data
        #try:
            #cleaned = cleaned_data.get("urllink")
            #print('CLEANED_DATA:{}'.format(cleaned))
        #except ValidationError:
            #print("ValidationError")
            #pass
        #super(BaseAdmin, self).clean() # important- let admin do its work on data!        
        #return cleaned_data

    #def clean_photo(self):
        #print('CLEAN FUNCTION')
        #if self.cleaned_data["urllink"] is None:
            #raise forms.ValidationError(u"You need set some urllink.")


#def changeform_view(self, request, object_id=None, form_url='', extra_context=None):
        
    #try:
        #return super(BaseAdmin, self).changeform_view(request, object_id, form_url, extra_context)
    #except ValidationError as e:
        #print("ValidationError")
        #self.message_user(request, e, level=messages.ERROR)
        #return HttpResponseRedirect(form_url)


#class MyBaseForm(forms.ModelForm):
    #def clean_name(self):
        #print('MYBASEFORM')
        # do something that validates your data
        #return self.cleaned_data["urllink"]



class ContactAdmin(admin.ModelAdmin):
    list_display = ['id', 'fullname', 'timestamp']
    fields = (('fullname', 'email'),
              ('phone'),
              ('content'),
              ('ipaddr', 'flag'),
              )


admin.site.register(Menu, MenuAdmin)
admin.site.register(SubMenu, SubMenuAdmin)
admin.site.register(Base, BaseAdmin)
admin.site.register(Contact, ContactAdmin)
