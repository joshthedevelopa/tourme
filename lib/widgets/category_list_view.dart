import '../imports.dart';

class CategoryTabBar extends StatefulWidget {
  final ValueChanged<int> onSelected;
  final List<String> items;

  const CategoryTabBar({
    super.key,
    required this.onSelected,
    this.items = const [],
  });

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  int selected = 0;
  Curve curves = Curves.ease;
  Duration duration = const Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstSizes.padding2x,
      child: SizedBox(
        height: ConstSizes.size * 4,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const SizedBox(width: ConstSizes.size);
          },
          scrollDirection: Axis.horizontal,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: duration,
              curve: curves,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: selected == index
                    ? const Color(0x33006400)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  ConstSizes.size * 1.5,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  if (selected != index) {
                    setState(() {
                      selected = index;
                      widget.onSelected(selected);
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ConstSizes.size * 1.5,
                  ),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      style: selected == index
                          ? const TextStyle(
                              color: Color(0xff004E00),
                              fontWeight: FontWeight.w500,
                            )
                          : const TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w500,
                            ),
                      duration: duration,
                      curve: curves,
                      child: Text(widget.items[index]),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}