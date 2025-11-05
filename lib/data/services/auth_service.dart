class AuthService {
  Future<bool> signInWithOtp(String phone, String otp) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }
}

