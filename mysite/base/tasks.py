from datetime import datetime, timedelta
import time
from django.utils import timezone



def CycleOne():
    start = time.time()

    end = time.time()
    res = end - start
    print("CYCLE_ONE, START: {}, DELAY: {}".format(datetime.now(tz=timezone.utc), res))
    return res
