import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/cubit/cubit.dart';
import 'package:scanner/cubit/states.dart';
import 'package:scanner/screens/history_screen.dart';
import 'package:scanner/screens/scaner_page.dart';

import '../custum_widgets/custom_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome ..',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Scanning a passport, visa or IDs Now!',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    //add border radius
                    child: Image.asset(
                      "assets/images/image-mrz.png",
                      height: 250.0,
                      width: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MuButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScannerScreen()),
                      );
                    },text: 'Scan Naw',),
                    const SizedBox(
                      width: 30,
                    ),

                    MuButton(onPressed: () {
                      AppCubit.get(context).getContact();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HistoryScreen()),
                      );
                    },text:'History' ),

                  ],
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}

