import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  
  static const String _baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(utf8.decode(response.bodyBytes));
        final List<dynamic> productsList = decodedData['products'];
        
        return productsList.map((json) {
          return Product(
            id: json['id'],
            title: json['title'],
            price: (json['price'] as num).toDouble(),
            description: json['description'],
            category: json['category'],
            
            image: (json['images'] as List).isNotEmpty 
                ? json['images'][0] 
                : 'https://images.unsplash.com/photo-1468495244123-6c6c332eeece?w=500&q=80',
          );
        }).toList();
      } else {
        throw Exception('Veri yükleme hatası: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Bağlantı hatası oluştu: $e');
    }
  }
}