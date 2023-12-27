import 'package:basomed/model/book_model.dart';
import 'package:basomed/model/user_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  // replace this with your backend url
  static final baseUrl = 'http://192.168.110.61:5000';

  Future<UserModel?> loginUser(String nisn, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/login',
        data: {'nisn': nisn, 'password': password},
      );

      if (response.statusCode == 200) {
        // Parse the response JSON and create a UserModel object
        final responseData = response.data as Map<String, dynamic>;
        final message = responseData['message'] as String?;
        final userMap = responseData['user'] as Map<String, dynamic>?;

        if (message == 'Login successful' && userMap != null) {
          return UserModel.fromJson(userMap);
        } else {
          // Handle login failure
          print('Login failed: $message');
          return null;
        }
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
      return null;
    }
  }

  Future<UserModel?> register(String nisn, String name, String imageUrl,
      String email, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/register',
        data: {
          "nisn": nisn,
          "name": name,
          "image_url": imageUrl,
          "email": email,
          "password": password
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
      return null;
    }
  }

  Future<UserModel?> updateImage(String nisn, FormData file) async {
    try {
      final response = await _dio.post(
        '$baseUrl/update_image/$nisn',
        data: file,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
      return null;
    }
  }

  Future<List<BookModel>?> getBooks(String? category) async {
    try {
      final response = await _dio.get(
        category == null
            ? '$baseUrl/books'
            : '$baseUrl/books?category=$category',
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((book) => BookModel.fromJson(book)).toList();
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      // Handle exceptions
      print('Exception: $error');
      return [];
    }
  }
}
