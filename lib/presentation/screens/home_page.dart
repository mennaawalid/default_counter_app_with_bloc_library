// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:default_counter_app_bloc_library/constants/enums.dart';
import 'package:default_counter_app_bloc_library/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final Color color;

  const MyHomePage({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        }
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.wifi) {
                    return const Text(
                      'WIFI',
                    );
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.mobile) {
                    return const Text(
                      'MOBILE',
                    );
                  } else if (state is InternetDisconneted) {
                    return const Text('DISCONNECTED');
                  } else {
                    return const Text('Loading');
                  }
                },
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Counter was incremented!',
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Counter was Decremented!',
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     FloatingActionButton(
              //       heroTag: UniqueKey(),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //       },
              //       tooltip: 'Decrement',
              //       child: const Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       heroTag: UniqueKey(),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).increment();
              //       },
              //       tooltip: 'Increment',
              //       child: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');

                  // Navigator.of(context).pushNamed('/second');
                },
                child: const Text(
                  'Go To Second Page',
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: const Text(
                  'Go To Third Page',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
