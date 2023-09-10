import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:scanner/model/contact_model.dart';
import 'package:scanner/cubit/cubit.dart';
import 'package:scanner/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactAdapter());
  await Hive.openBox<ContactModel>('contact_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AppCubit())],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context,child) =>
            ResponsiveBreakpoints.builder(child: child!,
                breakpoints: [
           const Breakpoint(start: 0, end: 450, name: MOBILE),
           const Breakpoint(start: 451, end: 800, name: TABLET),
           const Breakpoint(start: 801, end: 1920, name: DESKTOP),
           const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ]),
        home: const HomeScreen(),
      ),
    );
  }
}
