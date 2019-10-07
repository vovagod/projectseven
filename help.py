1. Staticfiles
   python manage.py collectstatic
   
   file selection.js is customized:
       to folder:
   /home/vova/projectthree/myvenv/lib/python3.5/site-packages/django/contrib/admin/static/admin/js
   put file: selection.js

   add a string to file:/home/vova/projectthree/myvenv/lib/python3.5/
                        site-packages/django/contrib/admin/templates/admin/change_form.html
       <script type="text/javascript" src="{% static 'admin/js/selection.js' %}"></script>
       


1.1 Project installation

    # Create the project directory
    mkdir project
    cd project

    # To create a virtual environment for python 2.7:
    virtualenv -p python2.7 env

    # Create a virtualenv to isolate our package dependencies locally
    project$ python3 -m venv myvenv
    project$ source myvenv/bin/activate  # On Windows use `myvenv\Scripts\activate`

    # Install Django and Django REST framework into the virtualenv
    project$ python3 -m pip install --upgrade pip
    project$ requirements.txt  ->  Django~=2.0.6
    project$ pip install -r requirements.txt
    project$ pip install djangorestframework

    # Set up a new project with a single application
    project$ django-admin startproject project .  # Note the trailing '.' character
    project/project$ django-admin startapp myproject

    # DB migrations in case of problems (initial mogrations, etc)
    python manage.py makemigrations your_app_label
    python manage.py migrate --fake-initial


2. Git put:
   $ git init
   $ git status
   $ git add --all
   $ git commit -m "Projectthree app, first commit"
   $ git remote set-url origin https://github.com/vovagod/projectthree.git
   $ git push -u origin master or git push origin master

   $ git git remote add origin https://vovagod@bitbucket.org/vovagod/blog.git
   $ git push -u origin master

   $ git push -f origin master

   Git get:
   $ git clone https://github.com/vovagod/projectthree.git
   $ rm -rf .git - форсированное удаление git
   $ rm -r .git - удаление git из папки
   

3. Requirements:
   pip freeze > requirements.txt
   pip install -r requirements.txt
   Ctrl + H -to see hidden folder .git

3.1 Testing of unused dependencies:
    python pyflakes <module name.py>

    pip install pylint-django
    
    pylint test_file.py --load-plugins pylint_django

4. Creation and configuration Postgresql:

    sudo apt install postgresql

    enter under root: sudo su postgres
    farther command: psql
    commands inside:
    create database django_db;
    create user admin with password '12345';
    grant all privileges on database django_db to admin;
    drop database django_db;
    \q
    Ctrl+D
    exit
    
    pip install psycopg2

    for tests.py: alter user blogger createdb;

    FATAL CONNECTION, increase max_connection and shared_buffers:
        in postgresql.conf change:

        max_connections = 100
        shared_buffers = 24MB

        to

        max_connections = 600
        shared_buffers = 1GB
        work_mem = 64MB
        maintenance_work_mem = 256MB

        in sysctl.conf set slowly bigger then shared_buffers:
            kernel.shmmax=100663296 (96 * 1024 * 1024 = 100663296)
            
        reboot: sudo systemctl restart postgresql.service

5. Открыть доступ к USB0:

   #sudo chmod 777 -R /dev/ttyUSB0
    sudo adduser webscada dialout

   Команды USB: lsusb, dmesg | grep tty,


6. Статический IP:

    sudo nano /etc/netplan/01-netcfg.yaml

    sudo netplan apply

Example:
# This file describes the network interfaces available on your system
# For more information, see netplan(5).
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
     dhcp4: no
     addresses: [192.168.1.222/24]
     gateway4: 192.168.1.1
     nameservers:
       addresses: [8.8.8.8,8.8.4.4]

7. Nginx

   sudo nano /etc/nginx/sites-available/mysite

   sudo apt update
   sudo apt install nginx
   sudo ufw app list
   sudo ufw allow 'Nginx HTTP'
   sudo ufw status
   sudo ufw enable
   
   make sudo ufw disable - then work ssh!
  
   systemctl status nginx
   sudo systemctl stop nginx
   sudo systemctl start nginx
   sudo systemctl restart nginx
   sudo systemctl reload nginx                   

server {
    listen 80;
    server_name 192.168.0.2
                192.168.1.2
                192.168.2.2
                127.0.0.1
                46.188.60.127;

    location = /favicon.ico { access_log off; log_not_found off; }
    location /static/ {
        root /home/webscada/projectthree/mysite;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/run/gunicorn.sock;
    }
}


8. Gunicorn

   sudo nano /etc/systemd/system/gunicorn.socket
    sudo systemctl start gunicorn.socket
    sudo systemctl enable gunicorn.socket
    sudo systemctl status gunicorn.socket
    sudo journalctl -u gunicorn.socket

[Unit]
Description=gunicorn socket

[Socket]
ListenStream=/run/gunicorn.sock

[Install]
WantedBy=sockets.target


    sudo nano /etc/systemd/system/gunicorn.service
    sudo systemctl status gunicorn
    sudo journalctl -u gunicorn
    sudo systemctl daemon-reload
    sudo systemctl start gunicorn
    sudo systemctl enable gunicorn
    sudo systemctl restart gunicorn
 

[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=webscada
Group=www-data
WorkingDirectory=/home/webscada/projectthree/mysite
ExecStart=/home/webscada/projectthree/myvenv/bin/gunicorn \
          --access-logfile - \
          --log-file - \
          --log-level debug \
          --workers 4 \
          --threads=16 \
          --max-requests=0 \
          --timeout=30 \
          --bind unix:/run/gunicorn.sock \
          mysite.wsgi:application

[Install]
WantedBy=multi-user.target

9. Survey

   sudo nano /etc/systemd/system/survey.service
    sudo systemctl daemon-reload
    sudo systemctl start survey.service
    sudo systemctl enable survey.service
    sudo systemctl status survey.service

[Unit]
Description=Survey Service
After=network.target
#Conflicts=getty@tty1.service

[Service]
Type=simple
User=webscada
#Group=webscada
#WorkingDirectory=/home/webscada/projectthree/mysite
ExecStart=/home/webscada/projectthree/myvenv/bin/python home/webscada/projectthree/mysite/manage.py survey
Restart=no
#StandardInput=ttyUSB0-force

[Install]
WantedBy=multi-user.target

10. SSH

sudo nano /etc/ssh/sshd_config 

 service ssh status
 sudo service ssh start
 sudo service ssh start
 sudo service ssh stop
 sudo systemctl disable ssh
 sudo systemctl enable ssh

 ssh webscada@rps-01


#       $OpenBSD: sshd_config,v 1.101 2017/03/14 07:19:07 djm Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/bin:/bin:/usr/sbin:/sbin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key

11. Resolve 'Connection refused'

 sudo nano /etc/hosts.allow

 add:
 ssh:localhost:allow
 sshd:localhost:allow

12. Firewall

https://ru.wikibooks.org/wiki/Настройка_межсетевого_экрана_в_Linux

13. Terminal command
 sudo poweroff
 sudo reboot
 sudo apt-get install glances - system monitor

14. Put file on dir path:
    import sys
    sys.path.append("/home/username/google_search")

15. Platform info:
    import platform
    platform.platform()

16. Install python-dev for c extention
    sudo apt-get install gcc 
    sudo apt-get install python3.5-dev
     python extension_all.py
     gcc dict_all.c
     make libmodbus in path: ./configure, make, sudo make install

17. i18n
    django-admin makemessages -l en - подготовка файла
    django-admin makemessages -a - повторный проход
    django-admin compilemessages - делает бинарник
    django-admin makemessages -d djangojs -l en - делает перевод яваскрипт кода
     
18. Си справочник - http://all-ht.ru/inf/prog/c/func/strcpy.html
    Си сборка пакетов - https://www.opennet.ru/docs/RUS/zlp/002.html

19. Postfix settings

    file view:
    sudo nano /etc/hosts
    127.0.0.1       localhost
    127.0.1.1       vovavova-Lenovo-G580 # this is localhost name
                                         # terminal command - $hostname
    sudo systemctl restart postfix
    echo "Postfix Send-Only Server" | mail -s "Postfix Testing" userx@example.com

20. Stop the website:
    sudo systemctl stop survey.service
    sudo systemctl stop gunicorn
    sudo systemctl stop gunicorn.socket

21. Possible problems with CFFI:
    C = ffi.dlopen('modbus')
    C = ffi.dlopen(None)

22. Sendmail installation
    remove Postfix - sudo systemctl stop postfix
                     sudo apt remove postfix && purge postfix
    sudo apt install sendmail
    sudo sendmailconfig - select all 'yes'
    cat /etc/mail/local-host-names - add domain names

23. Change permission to file:
    $ whoami
    $ sudo groupadd varwwwusers
    $ sudo chgrp -R varwwwusers /var/www/
    $ sudo adduser www-data varusers
    $ sudo chmod -R 770 /var/www/
    $ usermod -a -G varwwwusers ubuntu

24. HTML:
    
    Два пробела — введите &ensp;
    Четыре пробела — введите &emsp;
    Интервал табуляции — введите &nbsp;&nbsp;&nbsp;&nbsp;
    HTML Symbols:
    &#127760; &phone; &#9990; &#9993; &#127968; &#128222; &#128232; &#128269;
    &#128722; &#128231;

25. Projectseven
    gorizontal menu: описание возможности применение контакты новости
    

26. Django get related objects ManyToMany relationships

    class CartToys(models.Model):
        name = models.CharField(max_length=350)
        quantity = models.IntegerField()

    class Cart(models.Model):
        cart_item = models.ManyToManyField(CartToys)

    cart = Cart.objects.first()
    objects = cart.cart_item.all() # this line return all related objects for CartToys
    # and in reverse
    cart_toy = CartToys.objects.first()
    carts = cart_toy.cart_set.all() # this line return all related objects for Cart

