import 'imports.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(TourMeApp());
}

class TourMeApp extends StatelessWidget {
  final RouteController _controller = RouteController();

  TourMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => _controller)),
      ],
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _controller.router,
        );
      }
    );
  }
}

