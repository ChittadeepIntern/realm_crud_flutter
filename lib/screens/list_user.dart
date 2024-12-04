import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm_poc/providers/list_all_users_provider.dart';

class ListUser extends StatelessWidget {
  const ListUser({super.key});
  @override
  Widget build(BuildContext context) {
    final ListAllUsersProvider listAllUsersProvider =
        Provider.of<ListAllUsersProvider>(listen: false, context);

    // Trigger fetchAllUsers once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      listAllUsersProvider.fetchAllUsers();
    });

    return Scaffold(body: Center(
      child:
          Consumer<ListAllUsersProvider>(builder: (context, provider, child) {
        if (provider.isLoading) {
          log("Provider is loading");
          return const CircularProgressIndicator();
        }

        if (provider.userList.isEmpty) {
          return const Text("No users have been added");
        }

        return ListView.builder(
            itemCount: provider.userList.length,
            itemBuilder: (context, index) => ListTile(
                trailing: InkWell(
                  child: Icon(Icons.delete),
                  onTap: () {
                    provider.deleteAnUser(provider.userList[index].email);
                  },
                ),
                title: Text(
                  provider.userList[index].email,
                )));
      }),
    ));
  }
}
