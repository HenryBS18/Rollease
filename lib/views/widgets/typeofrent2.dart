import 'package:flutter/material.dart';
import 'package:rollease/views/widgets/dotsindicator.dart';
import 'package:rollease/views/pages/next_page.dart';  // Import halaman baru

class TypeOfRent2 extends StatefulWidget {
  @override
  _TypeOfRent2State createState() => _TypeOfRent2State();
}

class _TypeOfRent2State extends State<TypeOfRent2> {
  final List<OnBoarding> _onBoardingList = [
    OnBoarding(
      title: 'Ambil tipe kendaraan listrik yang anda inginkan',
      description: ' ',
      image: 'assets/TORArgo1.png',
    ),
    OnBoarding(
      title: 'Pilih lama durasi yang anda inginkan untuk menyewa kendaraan listrik',
      description: ' ',
      image: 'assets/torargo2.png',
    ),
    OnBoarding(
      title: 'Gunakan kendaraan listrik tersebut secara bebas di kawasan CPI',
      description: ' ',
      image: 'assets/TORArgoo2.png',
    ),
    OnBoarding(
      title: 'Bayar sesuai dengan durasi yang telah dipilih.',
      description: ' ',
      image: 'assets/TORArgo3.png',
    ),
  ];

  final PageController _controller = PageController();
  double _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: _onBoardingList.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index.toDouble();
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingCard(
                title: _onBoardingList[index].title,
                description: _onBoardingList[index].description,
                image: _onBoardingList[index].image,
              );
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _onBoardingList.length,
          position: _currentIndex,
          decorator: DotsDecorator(
            color: Color.fromARGB(255, 215, 239, 185), // default dot color
            size: Size(13.0, 11.0),
            activeColor: Colors.green,
            activeSize: Size(17.0, 17.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        SizedBox(height: 30.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // background (button) color
            onPrimary: Colors.white, // foreground (text) color
            padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 26.0),
            textStyle: TextStyle(fontSize: 24.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NextPage()),
            );
          },
          child: Text("Next"),
        ),
        SizedBox(height: 40.0), // Spacing below button
      ],
    );
  }
}

class OnBoarding {
  final String title;
  final String description;
  final String image;

  OnBoarding({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnBoardingCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnBoardingCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        SizedBox(height: 16.0),
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.0),
        Text(
          description,
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
