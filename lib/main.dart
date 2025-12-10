import 'package:clean_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:clean_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly/Features/home/domain/use_cases/fetch_featured_books_usecase.dart';
import 'package:clean_bookly/Features/home/domain/use_cases/fetch_news_book_usecase.dart';
import 'package:clean_bookly/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:clean_bookly/Features/home/presentation/manager/news_books/new_books_cubit.dart';
import 'package:clean_bookly/constants.dart';
import 'package:clean_bookly/core/di/app_locater.dart';
import 'package:clean_bookly/core/utils/app_router.dart';
import 'package:clean_bookly/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBooksCache);
  await Hive.openBox<BookEntity>(kNewBookCache);

  await initServiceLocator();

  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FeaturedBooksCubit(
                FetchFeaturedBooksUsecase(homeRepo: getIt.get<HomeRepoImpl>()),
              )..fetchFeaturedBooks(),
            ),
            BlocProvider(
              create: (context) => NewBooksCubit(
                FetchNewsBookUsecase(homeRepo: getIt.get<HomeRepoImpl>()),
              )..fetchNewBooks(),
            ),
          ],
          child: child!,
        );
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
