from __future__ import absolute_import, unicode_literals
import sys, os, django
sys.path.append("/mysite/base") #these is root folder (means parent)
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "store.settings")
import time
#import logging
import multiprocessing
from multiprocessing import Process, Pool, Lock, Event, TimeoutError
from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
from mysite.base.tasks import CycleOne, CycleTwo, CycleThree, CycleFour, CycleFive, CycleSix
                        

#logger = logging.getLogger('base.survey')
#logger.setLevel(logging.INFO)
#fh = logging.handlers.RotatingFileHandler('base/debug.log')
##fh.setLevel(logging.INFO)
#formatter = logging.Formatter('%(levelname)s--%(asctime)s--%(module)s--%(message)s',
                              #datefmt = '[%d/%B/%Y %H:%M:%S]')
#fh.setFormatter(formatter)
#logger.addHandler(fh)


class SurveyOne(Process):
    def __init__(self):
        Process.__init__(self)
        self.lock = Lock()
        self.running = True

    def run(self):
        while self.running:
            CycleOne(self)
            time.sleep (settings.SURVEY_TIME_ONE)
        
    def stop(self):
        self.running = False


class SurveyTwo(Process):
    def __init__(self):
        Process.__init__(self)
        self.lock = Lock()
        self.running = True

    def run(self):
        while self.running:
            CycleTwo(self)
            time.sleep (settings.SURVEY_TIME_TWO)
        
    def stop(self):
        self.running = False


class SurveyThree(Process):
    def __init__(self):
        Process.__init__(self)
        self.lock = Lock()
        self.running = True

    def run(self):
        while self.running:
            CycleThree(self)
            time.sleep (settings.SURVEY_TIME_THREE)
        
    def stop(self):
        self.running = False


class SurveyFour(Process):
    def __init__(self):
        Process.__init__(self)
        self.lock = Lock()
        self.running = True

    def run(self):
        while self.running:
            CycleFour(self)
            time.sleep (settings.SURVEY_TIME_FOUR)
        
    def stop(self):
        self.running = False


class SurveyFive(Process):
    def __init__(self):
        Process.__init__(self)
        self.lock = Lock()
        self.running = True

    def run(self):
        while self.running:
            CycleFive(self)
            time.sleep (settings.SURVEY_TIME_FIVE)
        
    def stop(self):
        self.running = False


class SurveySix(Process):
    def __init__(self):
        Process.__init__(self)
        self.lock = Lock()
        self.running = True

    def run(self):
        while self.running:
            CycleSix(self)
            time.sleep (settings.SURVEY_TIME_SIX)
        
    def stop(self):
        self.running = False


class Command(BaseCommand):
    help = 'Cycle running script'

    def survey(self, *args):
       pass
        

    def handle(self, *args, **options):
        import django
        django.setup()
        try:
            a = SurveyOne()
            b = SurveyTwo()
            c = SurveyThree()
            d = SurveyFour()
            e = SurveyFive()
            f = SurveySix()
            a.start()
            b.start()
            c.start()
            d.start()
            e.start()
            f.start()
            f.join()
        except KeyboardInterrupt:
            print('SURVEY script KeyboardInterrupt action...')
            a.terminate()
            b.terminate()
            c.terminate()
            d.terminate()
            e.terminate()
            f.terminate()
            pass


