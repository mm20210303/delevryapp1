//lib/features/auth/data/services/signin_service.dart

import '../api_service.dart';
class SigninService extends ApiService {
  SigninService() : super(baseUrl: 'http://10.224.155.245:8000/api/v1/login');
}