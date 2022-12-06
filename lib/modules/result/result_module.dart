import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:petize_teste/modules/result/domain/usecases/get_user.dart';
import 'package:petize_teste/modules/result/external/datasources/get_user_datasource_impl.dart';
import 'package:petize_teste/modules/result/infra/repositories/get_user_repository_impl.dart';
import 'package:petize_teste/modules/result/presenter/bloc/result_bloc.dart';

import 'presenter/result_page.dart';

class ResultModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => Client()),
        Bind((i) => GetUserDatasourceImpl(i.get<Client>())),
        Bind((i) => GetUserRepositoryImpl(i.get<GetUserDatasourceImpl>())),
        Bind((i) => GetUserImpl(i.get<GetUserRepositoryImpl>())),
        Bind((i) => ResultBloc(i.get<GetUserImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => ResultPage(user: (args.data as String))),
      ];
}
