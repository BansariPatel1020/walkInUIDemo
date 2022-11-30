import 'package:appsinvo_machine_test/index.dart';
import 'package:flutter/material.dart';

class MyQRPage extends StatelessWidget {
  const MyQRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            children: [
              Image.asset(
                ImagePath.myQR,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  ImagePath.homeIconBlue,
                  scale: 6,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'John',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.phone,
            ),
            SizedBox(width: 3),
            Text(
              '98765432100',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.email_outlined,
            ),
            SizedBox(width: 3),
            Text(
              'john@walkin.com',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
