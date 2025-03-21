import 'package:anbd/data/service/auth_service.dart';
import 'package:anbd/data/service/mypage_service.dart';
import 'package:anbd/data/service/share_post_service.dart';
import 'package:anbd/data/service/user_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  ///dio 등록
  getIt.registerLazySingleton<Dio>(() => Dio());

  ///Service 등록
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<MypageService>(() => MypageService());
  getIt.registerLazySingleton<SharePostService>(() => SharePostService());
  getIt.registerLazySingleton<UserService>(() => UserService());
}
