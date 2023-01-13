import '../imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing Navigation"),
      ),
      body: const Center(
        child: Text("Test Run"),
      ),
    );
  }
}
