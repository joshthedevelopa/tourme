import '../imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final List<String> _tabs = const [
    "All",
    "Greater Accra",
    "Ashanti",
    "Central",
    "Western",
    "Volta",
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Material(
      child: Padding(
        padding: mediaQuery.viewPadding,
        child: Column(
          children: [
            const HomeAppBar(),
            AnimatedCardDisplay(mediaQuery: mediaQuery),
            CategoryTabBar(
              onSelected: (int value) {},
              items: _tabs,
            ),
            const CategoryListView()
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
      padding: ConstSizes.padding2x,
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
                Text(
                  "Explore and enjoy the experience!!",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: ConstColors.secondary,
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstSizes.padding2x,
      child: SizedBox(
        width: double.infinity,
        height: widget.mediaQuery.size.width * 0.5,
        child: Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(ConstSizes.size * 2),
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  ConstAssets.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6.0,
                        spreadRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: ConstSizes.padding2x + ConstSizes.padding,
                          child: const Text(
                            "Amazon Rain Forest",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.heart,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

