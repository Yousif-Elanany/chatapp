import 'package:flutter/material.dart';

import '../Widgets/Chat-Bubble.dart';
import '../constant.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // To Remove the Arrow back
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 50,
                  ),
                const  Text('chat'),
                ],
              ),
              centerTitle: true,
    ),
    body: Column(
      children: [
        Expanded(
          child: ListView.builder(itemBuilder: (context,index){
            return ChatBubble();
          },),
        ),

        TextField(
           decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffixIcon: Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
           )
        )
      ],
    ),
    );
  }
}

