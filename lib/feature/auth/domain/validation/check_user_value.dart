import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopzen/feature/auth/data/model/register/register_request_model.dart';
import 'package:shopzen/feature/auth/presentation/cubit/register/register_cubit.dart';

class CheckUserValue {
  static void checkUserValue({
    required RegisterRequestModel registerRequestModel,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      context.read<RegisterCubit>().register(body: registerRequestModel);
    }
  }
}
