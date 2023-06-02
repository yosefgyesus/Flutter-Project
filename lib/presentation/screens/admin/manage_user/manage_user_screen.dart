import 'package:finalproject/infrastructure/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject/application/admin/manage_user/manage_user_bloc.dart';
import 'package:finalproject/application/admin/manage_user/manage_user_event.dart';
import 'package:finalproject/application/admin/manage_user/manage_user_state.dart';

class ManageUserScreen extends StatefulWidget {
  @override
  _ManageUserScreenState createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Users'),
      ),
      body: BlocConsumer<ManageUserBloc, ManageUserState>(
        listener: (context, state) {
          if (state is UserCreationSuccess) {
            // Handle success, e.g., show success message or navigate to another screen
          } else if (state is UserCreationFailure) {
            // Handle failure, e.g., show error message
          }
        },
        builder: (context, state) {
          if (state is UserCreationInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var _formKey3;
          return Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey3,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey3.currentState?.validate() ?? false) {
                        final name = _nameController.text;
                        final email = _emailController.text;
                        final user = UserModel(
                            name: name, email: email, id: '', password: '');
                        context
                            .read<ManageUserBloc>()
                            .add(CreateUserEvent(user));
                      }
                    },
                    child: Text('Create User'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
