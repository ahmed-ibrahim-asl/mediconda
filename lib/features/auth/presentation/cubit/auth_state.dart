part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthChangeLoginState extends AuthState {}
final class AuthSuccessState extends AuthState {}
