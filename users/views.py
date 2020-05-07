from .serializers import UserSerializer
from rest_framework import viewsets
from rest_framework import permissions
from django.contrib.auth import get_user_model

User = get_user_model()


class UserViewSet(viewsets.ModelViewSet):
    queryset = get_user_model().objects
    serializer_class = UserSerializer

    def get_permissions(self):
        if self.request.method != 'GET':
            self.permission_classes = (permissions.IsAuthenticated,)

        return super(UserViewSet, self).get_permissions()
