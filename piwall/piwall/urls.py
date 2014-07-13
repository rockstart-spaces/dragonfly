from django.conf.urls import patterns, include, url
from rest_framework import routers
from api import views
from django.contrib import admin
admin.autodiscover()

router = routers.DefaultRouter()
router.register(r'movies', views.MovieViewSet)

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'piwall.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^', include(router.urls))
)
