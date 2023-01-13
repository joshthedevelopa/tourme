import '../imports.dart';

enum Views {
  splash,
  onBoarding,
  home,
  profile,
  detail,
  showcase,
}

extension ViewExtension on Views {
  String get path {
    return "/${name.headerCase.toLowerCase()}";
  }
}

class ViewHelper {
  static const Map<Views, Widget> _views = {
    Views.home: HomeView(),
  };

  static Widget views(Views view) {
    return _views[view] ?? const HomeView();
  }
}
