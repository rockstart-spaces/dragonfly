from api.models import Movie
from rest_framework import serializers

# define visible fields

class MovieSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Movie
        fields = ['id', 'title', 'origin', 'status', 'enabled']
