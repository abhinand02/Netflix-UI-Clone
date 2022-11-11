import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/screens/Fast%20Laughs/video_list_item.dart';

import '../../application/fast_laugh/fast_laugh_bloc.dart';

class FastLaughs extends StatelessWidget {
  const FastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.idError) {
            return const Center(
              child: Text('Error While Getting data'),
            );
          } else if (state.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          } else if (state.videoList.isEmpty) {
            return const Center(
              child: Text('VideoList empty'),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                  state.videoList.length,
                  (index) => VideoListItemInheritedWidget(
                      VideoListItem(index: index), state.videoList[index])),
            );
          }
        },
      ),
    );
  }
}
