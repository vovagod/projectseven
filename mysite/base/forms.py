from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.utils.safestring import mark_safe

class ContactForm(forms.Form):
    full_name  = forms.CharField()
    email      = forms.CharField(validators=[validate_email])
    #phone      = forms.EmailField()
    message    = forms.CharField()

    def __init__(self, request, *args, **kwargs):
        self.request = request
        super(ContactForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super(ContactForm, self).clean()
        cc_email = self.cleaned_data.get("email")

        if cc_email is None:
            #msg = "Email error"
            #self.add_error('email', msg)
            #raise forms.ValidationError(mark_safe(msg))
            raise forms.ValidationError("Enter a valid email address", code='email_error')
        return cleaned_data

    def send_email(self):
        # send email using the self.cleaned_data dictionary
        pass
