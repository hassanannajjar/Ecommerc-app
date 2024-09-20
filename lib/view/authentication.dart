import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/authentication_provider.dart';
import '../utils/assets.dart';
import '../utils/routes/route_keys.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.orange,
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.2,
              ),
              child: Image.asset(
                authImage,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'What is your firstname?',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) =>
                    context.read<AuthenticationProvider>().setFirstName(value),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF3F1F1),
                  hintText: 'First Name',
                  hintStyle: TextStyle(
                    color: Color(0xffB1B1B1),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationProvider>().setValueToNamed();
                Navigator.pushReplacementNamed(context, routeHome);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(MediaQuery.sizeOf(context).width * 0.9, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Start Ordering',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
