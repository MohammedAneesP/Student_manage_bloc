import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_statemanagement/application/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:student_statemanagement/presentation/bottomsheet/screens.dart/first_screen.dart';
import 'package:student_statemanagement/presentation/bottomsheet/screens.dart/student_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = [
      const FirstScreen(),
      const StudentList(),
    ];
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        int theCurrentIndex = state.count;
        return Scaffold(
          
          body: pages[theCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: theCurrentIndex,
              onTap: (value) {
                if (value == 0) {
                  BlocProvider.of<BottomNavigationBloc>(context).add(BottomFirstScreen());
                }
                else{
                  BlocProvider.of<BottomNavigationBloc>(context).add(BottomStudntListScreen());
                }
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_home,
                    ),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt), label: 'List')
              ]),
        );
      },
    );
  }
}
