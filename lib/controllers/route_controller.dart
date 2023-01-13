import '../imports.dart';

class RouteController extends Controller {
  late GoRouter router;

  final List<GoRoute> _routes = [
    GoRoute(
      path: Views.home.path,
      builder: (context, state) => ViewHelper.views(Views.home),
    ),
  ];

  RouteController({List<GoRoute>? routes}) {
    router = GoRouter(
      routes: routes ?? _routes,
      initialLocation: Views.home.path,
      redirect: (context, state) {
        return state.location;
      },
    );
  }
}
