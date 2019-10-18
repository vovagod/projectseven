from django import forms

class ListTextWidget(forms.TextInput):
    def __init__(self, data_list, name, placeholder, autocomplete, *args, **kwargs):
        super(ListTextWidget, self).__init__(*args, **kwargs)
        self._name = name
        self._list = ('Меня заинтересовала ваша технология, свяжитесь со мной пожалуйста',
                      'Прошу прислать мне логин и пароль для входа в демо Comaex',
                      )
        self.attrs.update({'list':'list__%s' % self._name,
                           'placeholder':placeholder,
                           'autocomplete':autocomplete})

    def render(self, name, value, attrs=None, renderer=None):
        text_html = super(ListTextWidget, self).render(name, value, attrs=attrs)
        data_list = '<datalist id="list__%s">' % self._name
        for item in self._list:
            data_list += '<option value="%s">' % item
        data_list += '</datalist>'

        return (text_html + data_list)
