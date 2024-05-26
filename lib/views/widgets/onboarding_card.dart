part of 'widgets.dart';

class OnBoardingCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnBoardingCard({Key? key, required this.title, required this.description, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 350),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            description,
            style: const TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
