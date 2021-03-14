import 'package:teste_slidy/app/modules/detail/detail_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_slidy/app/modules/detail/detail_store.dart';

class DetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailRepository()),
    Bind.lazySingleton((i) => DetailStore()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
