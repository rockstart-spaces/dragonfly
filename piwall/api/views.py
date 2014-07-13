from django.shortcuts import render
from rest_framework import viewsets
from api.serializers import MovieSerializer
from api.models import Movie

class MovieViewSet(viewsets.ModelViewSet):
    """API endpoint for movies"""
    #model = Movie
    queryset = Movie.objects.all()
    serializer_class = MovieSerializer

