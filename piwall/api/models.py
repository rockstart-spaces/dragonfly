from django.db import models

STATUS = [(x,x) for x in ['ADDED', 'DOWNLOADING', 'DECODING', 'READY']]
class Movie(models.Model):
    # general properties
    title    = models.CharField(max_length=200)
    origin   = models.CharField(max_length=200) # url
    filename = models.CharField(max_length=50)  # local file
    # posting
    ip       = models.GenericIPAddressField()
    created  = models.DateTimeField(auto_now_add=True)
    updated  = models.DateTimeField(auto_now=True)
    # playing (status == READY and enabled => play)
    status   = models.CharField(max_length=max([len(x) for x,y in STATUS]),
                                choices=STATUS,
                                default=STATUS[0])
    enabled  = models.BooleanField(default=True)
    
