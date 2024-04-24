import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mcluck_app/mcluck_app.dart';
import 'package:mcluck_app/models/prediction_model.dart';
import 'package:mcluck_app/screens/prediction/prediction_bloc/prediction_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(PredictionModelAdapter());
  await Hive.openBox('predictions');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PredictionBloc>(create: (context) => PredictionBloc()),
      ],
      child: McLuckApp(),
    ),
  );
}
