import time
from multiprocessing import Process, Lock  
from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
from mysite.base.tasks import CycleOne

                        

class SurveyOne(Process):
    def __init__(self):
        Process.__init__(self)
        self.lock = Lock()
        self.lock_s = Lock()
        self.running = True

    def run(self):
        while self.running:
            for category in settings.CATEGORIES:
            
                self.lock_s.acquire()
                try:
                    CycleOne(self, category[0])
                finally:
                    self.lock_s.release()
               
            time.sleep (settings.SURVEY_TIME_ONE)
        
    def stop(self):
        self.running = False



class Command(BaseCommand):
    help = 'Cycles running script'

    def survey(self, *args):
       pass
        
    def handle(self, *args, **options):
        import django
        django.setup()
        try:
            a = SurveyOne()
            a.start()
            a.join()
        except KeyboardInterrupt:
            print('SURVEY script KeyboardInterrupt action...')
            a.terminate()
            pass


