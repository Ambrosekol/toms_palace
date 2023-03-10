import 'package:flutter/material.dart';
import 'package:toms_palace/global_widgets.dart/elevatedbutton.dart';

import '../global_widgets.dart/app_bar.dart';
import '../global_widgets.dart/drawer.dart';

class ContactUsPage extends StatefulWidget {
  ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomizedAppBar(),
      drawer: CustomizedDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get In Touch',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.left,
                ),
                // const SizedBox(height: 10.0),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                TextFormField(
                  maxLines: 10,
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Message',
                    constraints: BoxConstraints(
                      // minWidth: 150,
                      minHeight: MediaQuery.of(context).size.height / 3.5,
                    ),
                  ),
                ),
                Center(
                  child: button(
                    context,
                    callback: () => null,
                    text: 'Submit',
                    customize: false,
                    bgcolor: null,
                    txtColor: null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
