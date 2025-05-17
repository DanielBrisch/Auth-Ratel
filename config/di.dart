import 'package:ratel/annotations/geral_annotations.dart';
import 'package:ratel/dependency_injector/binding.dart';
import 'package:ratel/dependency_injector/injector.dart';

import '../internal/database/repositorys/auth_repository.dart';
import '../internal/database/repositorys/auth_repository_impl.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Injector().put<AuthRepository>(() => AuthRepositoryImpl());
    Injector().put<Auth>(() => Auth());
  }
}
