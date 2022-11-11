import 'package:flutter/material.dart';
import '../../../constants/styles.dart';
import '../../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import '../../widgets/widgets.dart';
import 'numbercard.dart';

class Top10Card extends StatelessWidget {
  const Top10Card({Key? key, required this.title, required this.top10}) : super(key: key);

  final String title;
  final List<HotAndNewData> top10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          LimitedBox(
            maxHeight: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  5,
                  (index) => NumberCard(
                        index: index,imageUrl: top10[index].posterPath!,
                      )),
            ),
          ),
          height20,
        ],
      ),
    );
  }
}
