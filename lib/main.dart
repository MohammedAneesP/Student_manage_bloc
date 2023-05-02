import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_statemanagement/application/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:student_statemanagement/application/image_picker/image_picker_bloc.dart';
import 'package:student_statemanagement/application/list_view/for_list_view_bloc.dart';
import 'package:student_statemanagement/application/search_data/search_data_bloc.dart';
import 'package:student_statemanagement/application/student_display/student_display_bloc.dart';
import 'package:student_statemanagement/application/updating_details/update_details_bloc.dart';
import 'package:student_statemanagement/database/dbfunctions.dart';
import 'package:student_statemanagement/database/model_class.dart';
import 'package:student_statemanagement/presentation/splash_screen.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
  openStudentBox();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(),
        ),
        BlocProvider(
          create: (context) => ForListViewBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => StudentDisplayBloc(),
         
        ),
        BlocProvider(
          create: (context) => SearchDataBloc(),
         
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
