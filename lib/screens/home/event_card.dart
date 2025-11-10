import 'package:eventory/theme.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard(this.event, {super.key});

  final String event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(children: [
          Text(event),
          //expanded create space between the text and the icon
          //sized box to take the available space
          Expanded(
            child: SizedBox(),
            ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.arrow_forward_sharp, color: AppColors.textColor),
            )
        ],
        ),
      )
    );
  }
}