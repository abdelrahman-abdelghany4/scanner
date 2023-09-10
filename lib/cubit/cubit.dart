import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mrz_scanner/mrz_scanner.dart';
import 'package:scanner/model/contact_model.dart';
import 'package:scanner/cubit/states.dart';
import 'package:scanner/screens/result_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  final MRZController control = MRZController();
  late String name;
  late String gender;
  late String countryCode;
  late DateTime dateOfBirth;
  late DateTime expiryDate;
  late String docNum;

  scanner(context) {
    return MRZScanner(
      controller: control,
      onSuccess: (mrzResult) async {
        name = mrzResult.givenNames;
        gender = mrzResult.sex.name;
        countryCode = mrzResult.countryCode;
        dateOfBirth = mrzResult.birthDate;
        expiryDate = mrzResult.expiryDate;
        docNum = mrzResult.documentNumber;
        await showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.deepOrangeAccent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultScreen()),
                      );
                    },
                    child: const Text(
                      'Show Result ...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      control.currentState?.resetScanning();
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
  // Method to Add Data To Local DB
  addContact(ContactModel contact) async {
    emit(AppAddLoadingState());
    try {
      var contactBox = Hive.box<ContactModel>('contact_box');
      await contactBox.add(contact);
      emit(AppAddSuccessState());
    } on Exception catch (e) {
      // TODO
      emit(AppAddErrorState(e.toString()));
    }
  }
  // Method to get Data From Local DB

  List<ContactModel>? contact;

  getContact() {
    var contactBox = Hive.box<ContactModel>('contact_box');
    contact = contactBox.values.toList();
  }
}
