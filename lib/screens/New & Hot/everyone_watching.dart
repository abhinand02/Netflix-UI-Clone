import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/constants/colors.dart';
import 'package:netflix/constants/styles.dart';

import '../../application/hot_and_new/hot_and_new_bloc.dart';
import '../../constants/strings.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const EveryOneIsWatching());
    });
    return  BlocBuilder<HotAndNewBloc,HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              } else if (state.hasError) {
                return const Center(child: Text('Error While Getting data'));
              } else if (state.everyOneIsWatchingList.isEmpty) {
                return const Center(
                  child: Text('List is Empty'),
                );
              } else {
return ListView.builder(
            itemBuilder: (context, index) {
              final tvData = state.everyOneIsWatchingList[index];
              return  EveryoneWatching(description: tvData.overview ?? 'No Description', posterPath: '$imageAppendUrl${tvData.backdropPath}',movieName: tvData.originalName ?? 'No title',);
            },
            itemCount: 10,
          );
              }
        
      }
    );
  }
}

class EveryoneWatching extends StatelessWidget {
    final String posterPath;
  final String movieName;
  final String description;
  const EveryoneWatching({
    Key? key, required this.posterPath, required this.movieName, required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        height10,
         Text(
          movieName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        height10,
         Text(
         description,
          style: TextStyle(color: Colors.grey),
        ),
       const  SizedBox(
          height: 50,
        ),
        VideoWIdget(imageUrl: posterPath),
        height10,
        CustomButtonWidget()
      ],
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
     children: [
       IconButton(onPressed: (){}, icon: Icon(Icons.share,color: whiteClr,)),
       Text("Share")
     ],
   ),
   Column(
     children: [
       IconButton(onPressed: (){}, icon: Icon(Icons.add,color: whiteClr)),
       Text("My List")
     ],
   ),
   Column(
     children: [
       IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow,color: whiteClr)),
       Text("Play")
     ],
   ),
      ],
    );
  }
}

class VideoWIdget extends StatelessWidget {
  final String imageUrl;
  const VideoWIdget({
    Key? key, required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_down_alt,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}