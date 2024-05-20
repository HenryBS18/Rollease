import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'debitPay.dart';

class OvoPayment extends StatelessWidget {
  const OvoPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Back",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.account_balance_wallet,
                      size: 30,
                      color: Color(0xFFA2C90C),
                    ),
                  ),
                  const SizedBox(width: 0),
                  Text(
                    "Payment",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DebitPayment()));
                    },
                    child: const Card(
                      elevation: 0,
                      color: Color(0xFFF0F8CF),
                      child: SizedBox(
                        width: 124,
                        height: 124,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.account_balance_wallet, color: Color(0xFF81895F),
                                size: 55,
                              ),
                              Text(
                                "debit",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Card(
                    elevation: 0,
                    color: Color(0xFFA2C90C),
                    child: SizedBox(
                      width: 124,
                      height: 124,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.wallet,
                              size: 55, color: Color(0xFF81895F),
                            ),
                            Text(
                              "ovo",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(color:  Color(0xFFA2C90C))),
                child: ListTile(
                  title: Text(
                    "Balance",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Rp230.031",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: Text(
                          "OVO",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
