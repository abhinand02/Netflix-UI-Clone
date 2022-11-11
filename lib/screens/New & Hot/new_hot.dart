import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/constants/colors.dart';
import 'package:netflix/constants/styles.dart';
import 'package:netflix/screens/New%20&%20Hot/everyone_watching.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';
import '../../constants/strings.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: newHotAppBar(),
          body:const TabBarView(children: [
            MyWidget(),
            EveryonesWatching(),
          ]),
        ),
      ),
    );
  }

  AppBar newHotAppBar() {
    return AppBar(
      backgroundColor: blackClr,
      leadingWidth: double.infinity,
      actions: [
        const Icon(Icons.notifications),
        Container(
          margin: const EdgeInsets.all(15),
          height: 20,
          width: 25,
          color: whiteClr,
        )
      ],
      leading: const Text(
        'New & Hot',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      bottom: TabBar(
          labelColor: blackClr,
          unselectedLabelColor: whiteClr,
          indicator: BoxDecoration(
              color: whiteClr, borderRadius: BorderRadius.circular(30)),
          isScrollable: true,
          labelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          tabs: const [
            Tab(
              text: '🍟 Coming Soon',
            ),
            Tab(
              text: '🔥 Everyone\'s Watching',
            ),
          ]),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const ComingSoon());
    });
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height10,
        const Text(
          '🍟 Coming Soon',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        height10,
        Expanded(
          child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              } else if (state.hasError) {
                return const Center(child: Text('Error While Getting data'));
              } else if (state.comingSoonList.isEmpty) {
                return const Center(
                  child: Text('List is Empty'),
                );
              } else {
                return ListView.builder(itemBuilder: (context, index) {
                  final movie = state.comingSoonList[index];
                  String month ='';
                  String date ='';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                final formatedDate=   DateFormat.yMMMMd('en-US').format(_date!);
                month= formatedDate.split(' ').first.substring(0,3).toUpperCase();
                date =movie.releaseDate!.split('-')[1];
                  } catch (e) {
                    month =' ';
                    date =' ';
                  }
                  
                  return ComingScreenWidget(
                      id: movie.id.toString(),
                      month: month,
                      day: date,
                      posterPath: '$imageAppendUrl${movie.backdropPath}' ,
                      movieName: movie.originalTitle ?? 'No Title',
                      description: movie.overview ?? 'No decription');
                },itemCount: state.comingSoonList.length,);
              }
            },
          ),
        )
      ],
    );
    ;
  }
}

class ComingScreenWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const ComingScreenWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            color: blackClr,
            child: Column(
              children: [
                Text(month, style: dateText),
                Text(
                  day,
                  style: dateText,
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Image(
                    image: NetworkImage(posterPath
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Expanded(
                           child: FittedBox(
                             child: Text(
                              movieName,
                              style: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                                                   ),
                           ),
                         ),
                        Row(
                          children: const [
                            NewAndHotIconWidget(
                              title: 'Remind Me',
                              icon: Icons.notifications_none_outlined,
                            ),
                            NewAndHotIconWidget(
                                icon: Icons.info_outline, title: 'Info'),
                          ],
                        ),
                      ],
                    ),
                  ),
                   Text(
                    'coming on $day $month',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  height10,
                   Text(
                    description,
                    style:const TextStyle(
                        fontSize: 14,
                        color: greyClr,
                        fontWeight: FontWeight.w600),
                  ),
                  height10,
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.circle,
                  //       color: whiteClr,
                  //       size: 8,
                  //     ),
                  //     Text(
                  //       ' Mind-Bending',
                  //       style: TextStyle(
                  //           fontSize: 10, fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                  height20,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NewAndHotIconWidget extends StatelessWidget {
  const NewAndHotIconWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Icon(
              icon,
              color: whiteClr,
            ),
          ),
          height10,
          Text(
            title,
            style: const TextStyle(fontSize: 10, color: greyClr),
          ),
        ],
      ),
    );
  }
}


