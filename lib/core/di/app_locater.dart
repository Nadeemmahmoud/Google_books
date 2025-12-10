import 'package:clean_bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:clean_bookly/core/databases/api/dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceimpl(),
      homeRemoteDataSource: HomeRemoteDataSourceimpl(
        apiConsumer: getIt.get<DioConsumer>(),
      ),
    ),
  );
}
