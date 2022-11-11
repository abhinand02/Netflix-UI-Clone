import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/constants/colors.dart';
import 'package:netflix/constants/styles.dart';
import 'package:netflix/screens/search/search_idle.dart';
import 'package:netflix/screens/search/search_result.dart';
import '../../domain/core/Debounce/debounce.dart';

class Search extends StatelessWidget {
  Search({super.key});

  TextEditingController searchContoller = TextEditingController();
  final debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackClr,
        leading: const Icon(Icons.arrow_back_rounded),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.shade900,
              borderRadius: BorderRadius.zero,
              padding: const EdgeInsets.all(15),
              controller: searchContoller,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  Icons.search,
                  color: greyClr,
                  size: 30,
                ),
              ),
              style: const TextStyle(color: whiteClr),
              placeholder: 'Search for a show, movie, genre, etc.',
              suffixIcon: const Icon(
                Icons.close,
                color: greyClr,
              ),
              onChanged: ((value) {
                if (value.isEmpty) {
                  return;
                }
                debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(movieQuery: value));
                });
              }),
            ),
            height10,
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return const SearchIdle();
                  } else {
                    return const SearchResult();
                  }
                },
              ),
            )
            // const Expanded(child: )
          ],
        ),
      ),
    );
  }
}
