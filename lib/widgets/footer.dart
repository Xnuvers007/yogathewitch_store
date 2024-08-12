import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height < 600 ? 8.0 : 16.0,
          horizontal: 16.0,
        ),
        child: Text(
          '© Xnuvers007 Co-founder & D. Yoga P. Founder Yogathewitch Store',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height < 600 ? 12.0 : 16.0,
          ),
        ),
      ),
    );
  }
}
