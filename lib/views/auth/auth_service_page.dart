import 'package:mydevice/models/login_user_model.dart'; // Adjust import if necessary

import 'package:mydevice/services/api_service.dart'; // Adjust import if necessary

class AuthService {
  final DBHelper _DBHelper = DBHelper();

  Future<bool> isUserRegistered(String email) async {
    final List<Map<String, dynamic>> maps = await _DBHelper.getUserByEmail(email);
    return maps.isNotEmpty;
  }

  Future<void> register(String firstName, String lastName, String email, String password, String organizationName) async {
    if (await isUserRegistered(email)) {
      throw Exception('User is already registered.');
    }

    await _DBHelper.insertUser(
      LoginUser(
        email: email,
        password: password,
      ),
    );
  }

  Future<bool> login({required String email, required String password}) async {
    final List<Map<String, dynamic>> maps = await _DBHelper.getUserByEmailAndPassword(email, password);
    return maps.isNotEmpty;
  }

  static Future<void> sendOtp(String email) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate async delay
    // Implement OTP sending logic here
  }

  static Future<void> verifyOtp(String email, String otp) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate async delay
    // Implement OTP verification logic here
  }
}
