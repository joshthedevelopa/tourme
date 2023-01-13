import 'dart:math';

import '../imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Material(
      child: Padding(
        padding: mediaQuery.viewPadding,
        child: Column(
          children: const [
            HomeAppBar(),
            // const SizedBox(height: 16.0),
            // AnimatedCardDisplay(
            //   mediaQuery: mediaQuery,
            // ),
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello Joshua",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                  child: Text(
                    "Explore and enjoy the experience!!",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: ConstColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkResponse(
            onTap: () {},
            child: const Icon(Iconsax.notification),
          )
        ],
      ),
    );
  }
}

class AnimatedCardDisplay extends StatefulWidget {
  const AnimatedCardDisplay({
    super.key,
    required this.mediaQuery,
  });

  final MediaQueryData mediaQuery;

  @override
  State<AnimatedCardDisplay> createState() => _AnimatedCardDisplayState();
}

class _AnimatedCardDisplayState extends State<AnimatedCardDisplay> {
  final List<Color> testColors = [
    Colors.blueGrey,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.indigo,
    Colors.brown,
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Need help on where to go?",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       selected = Random().nextInt(testColors.length);
          //     });
          //   },
          //   icon: Icon(Iconsax.activity),
          // ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: widget.mediaQuery.size.width * 0.45,
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    for (int i = 0; i < testColors.length; i++)
                      Center(
                        child: AnimatedOpacity(
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 1600),
                          opacity: selected == i ? 1 : 0,
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: const Duration(milliseconds: 1200),
                            width: selected == i ? constraints.maxWidth : 0,
                            height: selected == i ? constraints.maxHeight : 0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                24.0,
                              ),
                              color: testColors[i],
                            ),
                            curve: Curves.decelerate,
                          ),
                        ),
                      ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
