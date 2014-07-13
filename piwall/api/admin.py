from django.contrib import admin
from api.models import *

class MovieAdmin(admin.ModelAdmin):
    list_display    = ['title', 'status', 'enabled']

admin.site.register(Movie, MovieAdmin)
