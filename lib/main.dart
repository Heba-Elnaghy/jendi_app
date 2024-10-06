import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'logic/cubits/health_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final healthCubit = HealthCubit();

  // Configure Sahha SDK
  healthCubit.configureSahha();

  // Authenticate Sahha SDK
  healthCubit.authenticateSahha();

  runApp(
    BlocProvider<HealthCubit>(
      create: (context) => healthCubit,
      child: const MyApp(),
    ),
  );
}
