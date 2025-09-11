import '../api_service.dart';

class ProductService extends ApiService {
  ProductService() : super(baseUrl: 'http://127.0.0.1:8000/api/v1/orders');
}