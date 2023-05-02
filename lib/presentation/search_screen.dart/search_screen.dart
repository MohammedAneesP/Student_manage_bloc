import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_statemanagement/application/search_data/search_data_bloc.dart';
import 'package:student_statemanagement/core/colors.dart';
import 'package:student_statemanagement/presentation/studentShow/student_display.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchDataBloc>(context).add(SearchedList(anQuery: ""));
    });
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TextField(
            decoration: InputDecoration(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              filled: true,
              fillColor: kWhite,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
            onChanged: (value) {
              BlocProvider.of<SearchDataBloc>(context)
                  .add(SearchedList(anQuery: value));
            },
          ),
        ),
        body: BlocBuilder<SearchDataBloc, SearchDataState>(
          builder: (context, state) {
            if (state.filteredValue.isNotEmpty) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.filteredValue[index].name,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return StudentDisplay(
                              thisIndex: state.searchingList
                                  .indexOf(state.filteredValue[index]),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.filteredValue.length);
            }
            else if(state.isNull == true){
              return const Center(
                child:  Text("no data"),
              );
            }
            else{
              return ListView.separated(itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.searchingList[index].name),
                  onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return StudentDisplay(
                              thisIndex: state.searchingList
                                  .indexOf(state.searchingList[index]),
                            );
                          },
                        ),
                      );
                    }, 
                );
              }, separatorBuilder: (context, index) =>const Divider(), itemCount: state.searchingList.length);
            }
            
          },
        ));
  }
}
