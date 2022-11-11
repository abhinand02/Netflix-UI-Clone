import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/constants/colors.dart';
import 'package:netflix/constants/strings.dart';
import 'package:netflix/screens/Home/widget/maintitle_card.dart';
import 'package:netflix/screens/Home/widget/top10_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.getImages());
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<HomeBloc,Homestate>(
          builder: (context, state) {
            if(state.isLoading){
               return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
            }
            else if(state.hasError){
              return const Center(child:  Text('Error while getting data'));
            }else if(state.tvShows.isEmpty || state.dramas.isEmpty || state.top10.isEmpty || state.trendingNow.isEmpty){
               return const Center(child:  Text('List is Empty'));
            }
            return Column(
              children:  [
                const MainImageCard(),
                MainTitleCard(
                  title: 'TV Dramas',
                  tvDramas: state.tvDramas,
                ),
                MainTitleCard(
                  title: 'Trending Now',
                  tvDramas: state.trendingNow
                ),
                MainTitleCard(title: 'Dramas',
                tvDramas: state.dramas),
                Top10Card(
                  title: 'Top 10 Movies in India Today',
                  top10: state.top10,
                ),
                MainTitleCard(title: 'Award-Winning TV Shows',tvDramas: state.tvShows)
              ],
            );
          }
        ),
      ),
    );
  }
}

class MainImageCard extends StatelessWidget {
  const MainImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, Homestate>(
      builder: (context, state) {
        return state.trendingNow.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: width * 1.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '$imageAppendUrl${state.trendingNow[0].posterPath}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent.withOpacity(.5),
                    width: double.infinity,
                    height: 50,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomButtonWidget(
                          title: 'My List',
                          icon: Icons.add,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            color: blackClr,
                            size: 28,
                          ),
                          label: const Text(
                            'Play',
                            style: TextStyle(
                                color: blackClr,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(whiteClr)),
                        ),
                        const CustomButtonWidget(
                            icon: Icons.info_outline, title: 'Info'),
                      ],
                    ),
                  )
                ],
              );
      },
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: whiteClr,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: greyClr),
        ),
      ],
    );
  }
}
