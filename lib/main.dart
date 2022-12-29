import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';
import '/presentation/router/app_router.dart';
import '/logic/cubit/internet_cubit.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  const MyApp({super.key, required this.appRouter, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(
            connectivity: connectivity,
          ),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
    // BlocProvider(
    //   create: (context) => CounterCubit(),
    // child: MaterialApp(
    //   title: 'Flutter Demo',
    //   onGenerateRoute: appRouter.onGenerateRoute,
    // ),
    // );
  }
}
