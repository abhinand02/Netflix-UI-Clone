import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/constants/strings.dart';
import 'package:netflix/screens/Home/widget/maincard.dart';
import '../../../application/home/home_bloc.dart';
import '../../../constants/styles.dart';
import '../../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import '../../widgets/widgets.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({Key? key, required this.title, required this.tvDramas}) : super(key: key);
  
  final List<HotAndNewData> tvDramas;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          BlocBuilder<HomeBloc, Homestate>(
            builder: (context, state) {
              return LimitedBox(
                maxHeight: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      state.tvDramas.length,
                      (index) => MainCard(
                            image:
                                '$imageAppendUrl${tvDramas[index].posterPath}',
                          )),
                ),
              );
            },
          ),
          height20,
        ],
      ),
    );
  }
}
