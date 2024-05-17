import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_bloc_api/application/bloc/todo_list_bloc.dart';
import 'package:todo_app_bloc_api/data/provider/todo_provider.dart';
import 'package:todo_app_bloc_api/data/repository/todo_repository.dart';
import 'package:todo_app_bloc_api/presentation/home/home_page.dart';

class RootWidgetPage extends StatelessWidget {
  const RootWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => TodoRespository(
              todoProvider: TodoProvider(),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TodoListBloc(
                context.read<TodoRespository>(),
              )..add(FetchedAllTodosEvent()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            home: const HomePage(),
          ),
        ),
      );
    });
  }
}
