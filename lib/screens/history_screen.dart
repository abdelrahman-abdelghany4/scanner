import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanner/model/contact_model.dart';
import 'package:scanner/cubit/cubit.dart';
import 'package:scanner/cubit/states.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        List<ContactModel> contact = AppCubit.get(context).contact ?? [];
        return Scaffold(
          backgroundColor: Colors.white,
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
                'History',
                style: TextStyle(color: Colors.white),
              )),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                      itemBuilder: (context, index) =>
                          listItem(contact[index], context),
                      itemCount: contact.length),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget listItem(contact, context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Text('Name : ${contact.name}',
              style: const TextStyle(color: Colors.white)),
          Text('Gender : ${contact.gender}',
              style: const TextStyle(color: Colors.white)),
          Text('CountryCode : ${contact.countryCode}',
              style: const TextStyle(color: Colors.white)),
          Text('Date of Birth : ${contact.dateOfBirth}',
              style: const TextStyle(color: Colors.white)),
          Text('Expiry Date : ${contact.expiryDate}',
              style: const TextStyle(color: Colors.white)),
          Text('DocNum : ${contact.docNum}',
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
