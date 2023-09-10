import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubit/cubit.dart';
import 'package:scanner/cubit/states.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(body: AppCubit.get(context).scanner(context));
      },
      listener: (context, state) {},
    );
  }
}
