import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/constants/strings.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            'Top Searches',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
        height10,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error while getting data'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('List is empty'),
                );
              }
              return ListView.separated(
                  itemBuilder: (context, index) => TopSearchItemTile(
                        title: state.idleList[index].title ?? '',
                        imageUrl:
                            '$imageAppendUrl${state.idleList[index].bannerImage}',
                      ),
                  separatorBuilder: (context, index) => height10,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {super.key, required this.imageUrl, required this.title});

  final String title, imageUrl;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: width * .4,
          height: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill),
          ),
        ),
        Expanded(
            child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600),
        )),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.play_circle_outline,
            color: whiteClr,
          ),
        )
      ],
    );
  }
}
