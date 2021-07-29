import jwt

from django.http import JsonResponse

from my_settings import SECRET_KEY, ALGORITHM
from users.models import User

def authorization(func):
    def wrapper(self, request, *args, **kwargs):
        token = request.headers.get('Authorization', None)

        if token is None:
            return JsonResponse({'error': 'ENTER_THE_TOKEN'}, status=401)

        token = request.headers.get('Authorization', None)
        if token is None:
            return JsonResponse({'error': 'ENTER_THE_TOKEN'}, status=401)
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=ALGORITHM)

            if User.objects.filter(id=payload['user_id']).exists():
                request.user = User.objects.get(id=payload['user_id'])
                return func(self, request, *args, **kwargs)

            return JsonResponse({'message': 'INVALID_USER'}, status=400)

        except jwt.InvalidSignatureError:
            return JsonResponse({'error': 'INVALID_TOKEN'}, status=401)
        except jwt.ExpiredSignatureError:
            return JsonResponse({'error': 'EXPIRED_SIGNATURE'}, status=401)
        except jwt.DecodeError:
            return JsonResponse({'error': 'INVALID_TOKEN'}, status=401)

    return wrapper

def lose_authorization(func):
    def wrapper(self, request, *args, **kwargs):
        token = request.headers.get('Authorization', None)

        if token is None:
            request.user = None
            return func(self, request, *args, **kwargs)

        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=ALGORITHM)

            if User.objects.filter(id=payload['user_id']).exists():
                request.user = User.objects.get(id=payload['user_id'])
                return func(self, request, *args, **kwargs)

            return JsonResponse({'message': 'INVALID_USER'}, status=400)
        
        except jwt.InvalidSignatureError:
            return JsonResponse({'error': 'INVALID_TOKEN'}, status=401)
        except jwt.ExpiredSignatureError:
            return JsonResponse({'error': 'EXPIRED_SIGNATURE'}, status=401)
        except jwt.DecodeError:
            return JsonResponse({'error': 'INVALID_TOKEN'}, status=401)

    return wrapper
