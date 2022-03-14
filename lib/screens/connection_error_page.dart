import 'package:flutter/material.dart';

class ConnectionErrorPage extends StatelessWidget {
  const ConnectionErrorPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue[50],
      alignment: Alignment.center,
      
      child: const Text("Ooops ! Looks Like you are not connected to the internet",
      textAlign: TextAlign.center,
      
      style: TextStyle(
        decoration: TextDecoration.none,
        color: Colors.black,
                ),
      
      ),
    );
  }
}