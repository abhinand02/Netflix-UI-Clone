import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import '../../../application/home/home_bloc.dart';
import '../../../infrastructure/home/home_repository.dart';
import '../../../infrastructure/hot_and_new/hot_and_new_impl.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

void setup() {
  // getIt.registerSingleton<HomeRepository>(HomeRepository(),signalsReady: true);
  // getIt.registerFactory<HotAndNewBloc>(
  // () => HotAndNewBloc(HotAndNewImplementation()));
}

@InjectableInit()
Future<void> configureInjection() async {
  $initGetIt(getIt, environment: Environment.prod);
}
