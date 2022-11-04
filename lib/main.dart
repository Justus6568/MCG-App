import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mcgapp/firebase_options.dart';
import 'package:mcgapp/screens/auth/signin_screen.dart';
import 'package:mcgapp/screens/auth/signup_screen.dart';
import 'package:mcgapp/screens/credits_screen.dart';
import 'package:mcgapp/screens/grades/course_grades_screen.dart';
import 'package:mcgapp/screens/grades/grade_edit_screen.dart';
import 'package:mcgapp/screens/grades/grades_screen.dart';
import 'package:mcgapp/screens/home_screen.dart';
import 'package:mcgapp/screens/roomplan_screen.dart';
import 'package:mcgapp/screens/settings_screen.dart';
import 'package:mcgapp/screens/substitutions_screen.dart';
import 'package:mcgapp/screens/teacher_details_screen.dart';
import 'package:mcgapp/screens/teacher_list_screen.dart';
import 'package:mcgapp/screens/timetable_screen.dart';
import 'package:mcgapp/theme/theme_constants.dart';
import 'package:mcgapp/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _initialRoute = SignInScreen.routeName;

  @override
  void initState() {
    themeManager.loadTheme();
    themeManager.addListener(themeListener);

    if (FirebaseAuth.instance.currentUser != null) {
      _initialRoute = HomeScreen.routeName;
    }

    super.initState();
  }

  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCG App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      initialRoute: _initialRoute,
      routes: {
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        TimetableScreen.routeName: (context) => const TimetableScreen(),
        SubstitutionsScreen.routeName: (context) => const SubstitutionsScreen(),
        RoomplanScreen.routeName: (context) => const RoomplanScreen(),
        TeacherListScreen.routeName: (context) => const TeacherListScreen(),
        TeacherDetailsScreen.routeName: (context) => const TeacherDetailsScreen(),
        SekretariatScreen.routeName: (context) => const SekretariatScreen(),
        GradesScreen.routeName: (context) => const GradesScreen(),
        GradeEditScreen.routeName: (context) => const GradeEditScreen(),
        CourseGradesScreen.routeName: (context) => const CourseGradesScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        CreditsScreen.routeName: (context) => const CreditsScreen(),
      },
    );
  }
}