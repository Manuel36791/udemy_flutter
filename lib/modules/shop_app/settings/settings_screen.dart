import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:udemy_flutter/layout/shop_app/shop_cubit/cubit.dart';
import 'package:udemy_flutter/layout/shop_app/shop_cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      // if (state is ShopSuccessGetUserDataState) {
      //   print(state.loginModel.data.name);
      //   print(state.loginModel.data.email);
      //   print(state.loginModel.data.phone);

      //   nameController.text = state.loginModel.data.name;
      //   emailController.text = state.loginModel.data.email;
      //   phoneController.text = state.loginModel.data.phone;
      // }
    }, builder: (context, state) {
      var model = ShopCubit.get(context).userModel;

      nameController.text = model!.data!.name;
      emailController.text = model.data!.email;
      phoneController.text = model.data!.phone;

      return Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              ShopCubit.get(context).userModel != null,
          widgetBuilder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      if (state is ShopLoadingUpdateUserDataState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Name mustn\'t be empty';
                            }
                            return null;
                          },
                          label: 'Name',
                          iconprefix: Icons.person),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Email address mustn\'t be empty';
                          }
                          return null;
                        },
                        label: 'Email Address',
                        iconprefix: Icons.email,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Phone mustn\'t be empty';
                          }
                          return null;
                        },
                        label: 'phone',
                        iconprefix: Icons.phone,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            ShopCubit.get(context).updateUserData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text);
                          }
                        },
                        text: 'Update Profile',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                          function: () {
                            signOut(context);
                          },
                          text: 'Log Out'),
                    ],
                  ),
                ),
              ),
          fallbackBuilder: (context) =>
              Center(child: CircularProgressIndicator()));
    });
  }
}
