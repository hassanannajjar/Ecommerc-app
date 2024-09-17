import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/routes/route_keys.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.2,
            ),
            child: Image.asset(
              welcomeIcon,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Get The Freshest Fruit Salad Combo',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff5D577E),
              ),
              // maxLines: ,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, routeAuthentication);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(MediaQuery.sizeOf(context).width * 0.9, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Let’s Continue',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
