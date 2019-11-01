from __future__ import absolute_import, unicode_literals
import sys, os, django
sys.path.append("/mysite/base") #these is root folder (means parent)
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "store.settings")
import time
import logging
import multiprocessing
#import django.dispatch
from multiprocessing import Process, Pool, Lock, Event, TimeoutError
from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
from mysite.base.tasks import CycleOne
                        


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
        self.running = True

    def run(self):
        while self.running:
            CycleOne()
            time.sleep (24.0)  #(settings.BITSURVEY)
        
    def stop(self):
        self.running = False


#class DataSurvey(Process):
    #def __init__(self):
        #Process.__init__(self)
        #self.running = True
        
    #def run(self):
        #while self.running:
            #datasurvey()
            #time.sleep(settings.DATASURVEY)
            
    #def stop(self):
        #self.running = False


#def surveyvalueset(id_num, value, offset, mul):
    #with Pool(processes=4, maxtasksperchild=8) as pool:
        #res = pool.apply_async(devicevalueset, (id_num, value, offset, mul,))
        #try:
            #res.get(timeout=settings.VALUESET)
        #except TimeoutError:
            #logger.info('SURVEYVALUESET multiprocessing.TimeoutError occured, timeout set: {}'.format(settings.VALUESET))
            #return False
        #return True


#def surveybitset(id_num, bit):
    #with Pool(processes=4, maxtasksperchild=8) as pool:
        #res = pool.apply_async(devicebitset, (id_num, bit,))
        #try:
            #res.get(timeout=settings.BITSET)
        #except TimeoutError:
            #logger.info('SURVEYBITSET multiprocessing.TimeoutError occured, timeout set: {}'.format(settings.BITSET))
            #return False
        #return True


#def surveyreport(subject, message, receiver, path_to_file):
    #with Pool(processes=4, maxtasksperchild=8) as pool:
        #res = pool.apply_async(reportletter, (subject, message, receiver, path_to_file))
        #try:
            #res.get(timeout=settings.REPORTSEND)
        #except TimeoutError:
            #logger.info('SURVEYREPORT multiprocessing.TimeoutError occured, timeout set: {}'.format(settings.REPORTSEND))
            #return False
        #return True


#def surveyevent(sender, events, **kwargs):
    #from django.db import connection
    #connection.close()
    #with Pool(processes=4, maxtasksperchild=8) as pool:
        #res = pool.apply_async(eventmessage, (events))
        #try:
            #res.get(timeout=settings.EVENTMESSAGE)
        #except TimeoutError:
            #logger.info('SURVEYEVENT multiprocessing.TimeoutError occured, timeout set: {}'.format(settings.EVENTMESSAGE))
            #return False
        #return True


#class DBValueRecord(Process):
    #def __init__(self, event):
        #Process.__init__(self)
        #self.stopped = event

    #def run(self):
        #while not self.stopped.wait(0.0):
            #start = time.time()
            #dbvaluerecord()
            #end = time.time()
            #gap3 = end - start
            #gap_db = settings.DATASURVEY - gap3
            #if gap3 > settings.DATASURVEY:
                #gap_db = 0.0
            #time.sleep(gap_db)


#class TickCounter(Process):
    #def __init__(self, event):
        #Process.__init__(self)
        #self.stopped = event

    #def run(self):
        #while not self.stopped.wait(0.0):
            #start = time.time()
            #tickcounter()
            #end = time.time()
            #gap4 = end - start
            #gap_tic = settings.DATASURVEY - gap4
            #if gap4 > settings.DATASURVEY:
                #gap_tic = 0.0
            #time.sleep(gap_tic)

            

class Command(BaseCommand):
    help = 'Devices polling script'

    def survey(self, *args):
       pass
        

    def handle(self, *args, **options):
        import django
        django.setup()
        #logger.info('SURVEY script is started...')
        stopFlag = Event()
        #stopFlag1 = Event()
        try:
            a = SurveyOne()
            #b = DataSurvey()
            #c = DBValueRecord(stopFlag)
            #d = TickCounter(stopFlag1)
            a.start()
            #b.start()
            #c.start()
            #d.start()
            #d.join()
        except KeyboardInterrupt:
            logger.info('SURVEY script KeyboardInterrupt action...')
            a.terminate()
            #b.terminate()
            #c.terminate()
            #d.terminate()
            stopFlag.set()
            #stopFlag1.set()
            pass


