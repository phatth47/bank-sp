import 'package:bank_sp/features/users/presentation/bloc/counter_bloc/data_bloc.dart';
import 'package:bank_sp/features/users/presentation/bloc/counter_cubit.dart';
import 'package:bank_sp/infrastructure/components/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _counterCubit = CounterCubit();

  final DataBloc dataBloc = DataBloc();

  int value = 0;

  @override
  void initState() {
    dataBloc.add(DataInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => dataBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'User',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: BlocConsumer<DataBloc, DataState>(
            listener: (context, state) {
              if (state is DataError) {
                print("error");
              }
            },
            builder: (context, state) {
              if (state is DataLoading) {
                return const CircularProgressIndicator();
              }

              if (state is DataLoaded) {
                return const TestWidget();
              }

              // if (state is DataError) {
              //   return const Text("Error");
              // }

              if (state is DataEmpty) {
                return const Text("Empty");
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget get valueCounterWidget {
    final state = _counterCubit.state;
    final val = state.val;
    return Text(
      'Counter: $val',
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    dataBloc.close();
    super.dispose();
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 16,
        );
      },
      itemBuilder: (context, index) {
        return PrimaryButtonWidget(
          title: "Btn",
          onPressed: () {},
        );
      },
    );
  }
}
