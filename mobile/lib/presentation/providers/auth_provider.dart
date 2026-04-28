import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/api_constants.dart';
import '../../core/storage/secure_storage.dart';
import '../../domain/models/app_user.dart';
import 'database_provider.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final storage = ref.watch(secureStorageProvider);
  final dio = ref.watch(dioProvider);
  return AuthNotifier(storage, dio);
});

class AuthState {
  final AppUser? user;
  final bool isLoading;
  final String? error;

  const AuthState({this.user, this.isLoading = false, this.error});

  bool get isAuthenticated => user != null;

  AuthState copyWith({AppUser? user, bool? isLoading, String? error}) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final SecureStorage _storage;
  final Dio _dio;

  AuthNotifier(this._storage, this._dio) : super(const AuthState());

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {'username': username, 'password': password},
      );

      final data = response.data as Map<String, dynamic>;
      await _storage.saveTokens(
        accessToken: data['access'] as String,
        refreshToken: data['refresh'] as String,
      );

      final user = AppUser.fromJson(data['user'] as Map<String, dynamic>);
      state = AuthState(user: user);
    } on DioException catch (e) {
      final detail = (e.response?.data as Map<String, dynamic>?)?['detail']
          ?? 'Login failed. Check your credentials.';
      state = AuthState(error: detail as String);
    }
  }

  Future<void> loadCurrentUser() async {
    final token = await _storage.getAccessToken();
    if (token == null) return;

    try {
      final response = await _dio.get(ApiConstants.me);
      final user = AppUser.fromJson(response.data as Map<String, dynamic>);
      state = AuthState(user: user);
    } catch (_) {
      await _storage.clearTokens();
    }
  }

  Future<void> logout() async {
    final refreshToken = await _storage.getRefreshToken();
    try {
      await _dio.post(ApiConstants.logout, data: {'refresh': refreshToken});
    } catch (_) {}
    await _storage.clearTokens();
    state = const AuthState();
  }
}
