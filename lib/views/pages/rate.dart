import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateApp extends StatelessWidget {
  const RateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: showFeedbackBottomSheet(context: context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return SizedBox
            .shrink(); // Mengembalikan widget kosong sementara menunggu tampilan bottom sheet.
      },
    );
  }

  static Future<void> showFeedbackBottomSheet({
    required BuildContext context,
  }) async {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: width,
            height: height * 0.44,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                Image.asset(
                  "rate.png",
                  width: 260,
                  height: 150,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "How was your trip?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                RatingBar.builder(
                  glow: false,
                  allowHalfRating: true,
                  unratedColor: Colors.grey[400],
                  itemSize: 50,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Color(0xFFA2C90C)),
                  onRatingUpdate: (rating) {
                    // Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
