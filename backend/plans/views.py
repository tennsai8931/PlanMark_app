from rest_framework import viewsets
from .models import Point
from .serializers import PointSerializer


class PointViewSet(viewsets.ModelViewSet):
    queryset = Point.objects.all().order_by('-created_at')
    serializer_class = PointSerializer