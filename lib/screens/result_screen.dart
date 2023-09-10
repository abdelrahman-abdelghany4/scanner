import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/model/contact_model.dart';
import 'package:scanner/cubit/cubit.dart';
import 'package:scanner/cubit/states.dart';
import '../custum_widgets/custom_widgets.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.deepOrangeAccent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
                //replace with our own icon data.
              ),
              title: const Text(
                'Result',
                style: TextStyle(color: Colors.white),
              )),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Name : ${AppCubit.get(context).name}'),
                Text('Gender : ${AppCubit.get(context).gender}'),
                Text('CountryCode : ${AppCubit.get(context).countryCode}'),
                Text('Date of Birth : ${AppCubit.get(context).dateOfBirth}'),
                Text('Expiry Date : ${AppCubit.get(context).expiryDate}'),
                Text('DocNum : ${AppCubit.get(context).docNum}'),
                const SizedBox(
                  height: 30,
                ),
                MuButton(
                    onPressed: () {
                      var contact = ContactModel(
                          name: AppCubit.get(context).name,
                          gender: AppCubit.get(context).gender,
                          countryCode: AppCubit.get(context).countryCode,
                          dateOfBirth:
                              AppCubit.get(context).dateOfBirth.toString(),
                          expiryDate:
                              AppCubit.get(context).expiryDate.toString(),
                          docNum: AppCubit.get(context).docNum);
                      AppCubit.get(context).addContact(contact);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Added successfully!'),
                        padding: EdgeInsetsDirectional.all(20),
                        duration: Duration(milliseconds: 800),
                      ));
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const HomeScreen()),
                      // );
                    },
                    text: 'Save'),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
