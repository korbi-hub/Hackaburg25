import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_app/l10n/app_localizations.dart';
import 'package:mobile_app/repositories/bluetooth_connection_repo.dart';
import 'package:mobile_app/screens/bluetooth_cubit/bluetooth_cubit.dart';
import 'package:mobile_app/screens/home/cubit/home_cubit.dart';
import 'package:mobile_app/screens/nav_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<BluetoothConnectionRepo>(
      create: (context) => BluetoothConnectionRepo(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BluetoothCubit>(
            create:
                (context) => BluetoothCubit(
                  repo: context.read<BluetoothConnectionRepo>(),
                )..init(),
          ),
          BlocProvider<HomeCubit>(
            create:
                (context) =>
                    HomeCubit(context.read<BluetoothConnectionRepo>())
                      ..getBikes(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          ),
          home: Builder(
            builder: (context) {
              return NavWrapper();
            },
          ),
        ),
      ),
    );
  }
}
