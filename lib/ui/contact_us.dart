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
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _messageController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomizedAppBar(centerTitle: true),
      drawer: CustomizedDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get In Touch',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.left,
                ),
                // const SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.name,
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
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Message',
                    constraints: BoxConstraints(
                      // minWidth: 150,
                      minHeight: MediaQuery.of(context).size.height / 4,
                    ),
                  ),
                ),
                Center(
                  child: button(
                    context,
                    callback: () => submitfunction(),
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

  submitfunction() {}
}
