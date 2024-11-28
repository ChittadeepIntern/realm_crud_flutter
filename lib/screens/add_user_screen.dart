import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm_poc/core/variables.dart';
import 'package:realm_poc/models/gender.dart';
import 'package:realm_poc/providers/add_user_form_provider.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final AddUserFormProvider provider =
        Provider.of<AddUserFormProvider>(listen: false, context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 206, 231),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 60),
              child: Form(
                  key: formKey,
                  child: Column(children: [
                    Consumer<AddUserFormProvider>(
                      builder: (context, provider, child) => Stack(
                        alignment: Alignment.center,
                        children: [
                          // Circle Avatar
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: provider.imageFile != null
                                ? FileImage(provider.imageFile!)
                                : const AssetImage(
                                    'assets/images/default_image.jpg'), // Your image here
                          ),
                          // Change Icon at the corner
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () async {
                                await provider.pickImage();
                              },
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: TextFormField(
                          onSaved: (value) => provider.name = value!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your username',
                            //prefixIcon: Icon(Icons.person_3_outlined)
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        // Country Code Dropdown
                        Consumer<AddUserFormProvider>(
                          builder: (context, provider, child) => Container(
                            width: 80, // Adjust the width of the dropdown
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              border:
                                  Border.all(color: Colors.grey), // Add border
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: DropdownButtonFormField<String>(
                                onSaved: (value) =>
                                    provider.countryCode = value!,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Country code should be present";
                                  }
                                  return null;
                                },
                                onChanged: (value) =>
                                    provider.countryCode = value!,
                                value: provider.countryCode,
                                decoration: const InputDecoration(
                                  border: InputBorder
                                      .none, // Removes default border
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                                items: Variables.countryCodes
                                    .map(
                                      (value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),

                        // Spacing between dropdown and text field
                        const SizedBox(
                            width:
                                1), // No visible gap between dropdown and text field

                        // Phone Number Text Field
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              border:
                                  Border.all(color: Colors.grey), // Add border
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              child: TextFormField(
                                onSaved: (value) => provider.phoneNumber=value!,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Phone number cannot be null";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Enter phone number',
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: TextFormField(
                          onSaved: (value) {
                            provider.email = value!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email field cannot be empty";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)) {
                              return "email format is wrong";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: "Email", border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Consumer<AddUserFormProvider>(
                      builder: (context, provider, child) => Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Birthdate cannot be empty";
                              }
                              return null;
                            },
                            readOnly: true,
                            decoration: const InputDecoration(
                                hintText: "Birth Date",
                                border: InputBorder.none),
                            onTap: () => provider.selectDate(context),
                            controller:
                                TextEditingController(text: provider.showDate),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Consumer<AddUserFormProvider>(
                        builder: (context, provider, child) => Container(
                              child: Column(children: [
                                ListTile(
                                  title: const Text("Male"),
                                  leading: Radio(
                                      value: Gender.MALE.toString(),
                                      groupValue: provider.gender.toString(),
                                      onChanged: (value) =>
                                          provider.gender = Gender.MALE),
                                ),
                                ListTile(
                                  title: const Text("Female"),
                                  leading: Radio(
                                      value: Gender.FEMALE.toString(),
                                      groupValue: provider.gender.toString(),
                                      onChanged: (value) =>
                                          provider.gender = Gender.FEMALE),
                                ),
                                ListTile(
                                  title: const Text("Other"),
                                  leading: Radio(
                                      value: Gender.OTHER.toString(),
                                      groupValue: provider.gender.toString(),
                                      onChanged: (value) =>
                                          provider.gender = Gender.OTHER),
                                )
                              ]),
                            )),
                    Consumer<AddUserFormProvider>(
                        builder: (context, provider, child) => ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState?.validate() ?? false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Form is valid!')));
                                formKey.currentState?.save();
                                provider.saveData();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Form is not valid!')));
                              }
                            },
                            child: const Text("Submit")))
                  ]))),
        ),
      ),
    );
  }
}
