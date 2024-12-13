import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_bloc.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/usecases/log_out.dart';
import 'package:movie_app/init_dependencies_imports.dart';

void showPopup(BuildContext context) {
  final blocContext = context; // Save the context with access to GenericDataBloc<bool>.

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AlertDialog.adaptive(
      title: const Text('LogOut'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.withOpacity(0.5),
          ),
          onPressed: () {
            Navigator.of(dialogContext).pop(); // Close the dialog.
          },
          child: const Text('No'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.withOpacity(0.5),
          ),
          onPressed: () {
            blocContext.read<GenericDataBloc<bool>>().add(
                  GenericDataLoaded(serviceLocator<UserLogOut>(), NoParams()),
                );
            Navigator.of(dialogContext).pop(); // Close the dialog.
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}

