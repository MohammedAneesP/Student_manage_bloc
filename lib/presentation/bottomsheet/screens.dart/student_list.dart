import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_statemanagement/application/list_view/for_list_view_bloc.dart';
import 'package:student_statemanagement/presentation/search_screen.dart/search_screen.dart';
import 'package:student_statemanagement/presentation/studentShow/student_display.dart';

import '../../../application/student_display/student_display_bloc.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ForListViewBloc>(context).add(StudentListeningList());
    });
    // log("message");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Student's List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<ForListViewBloc, ForListViewState>(
          builder: (context, state) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  if (state.listBloc.isEmpty) {
                    return const Center(
                      child: Text("No Data"),
                    );
                  } else {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return StudentDisplay(
                                thisIndex: state.listBloc
                                    .indexOf(state.listBloc.elementAt(index)),
                              );
                            },
                          ),
                        );
                        BlocProvider.of<StudentDisplayBloc>(context)
                            .add(DisplayingDetls(aaIndex: index));
                      },
                      leading: Text("$index"),
                      title: Text(state.listBloc[index].name),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Do you Want to Delete"),
                                  content: const Text("Are you sure"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            snackBarFunc(
                                                'Deleted Successfully-',
                                                Colors.green),
                                          );
                                          BlocProvider.of<ForListViewBloc>(
                                                  context)
                                              .add(
                                            RemoveList(
                                              anIndex:
                                                  state.listBloc.indexWhere(
                                                (element) =>
                                                    element.name ==
                                                    state.listBloc[index].name,
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Yes")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No")),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  }
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.listBloc.length);
          },
        ),
      ),
    );
  }

  SnackBar snackBarFunc(String theText, Color theColor) {
    return SnackBar(
      content: Text(theText),
      backgroundColor: theColor,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    );
  }
}
