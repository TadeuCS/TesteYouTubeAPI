import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_slidy/app/modules/home/home_repository.dart';
import 'package:teste_slidy/app/modules/home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeRepository(i())),
    Bind.lazySingleton((i) => HomeStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
  ];
}
