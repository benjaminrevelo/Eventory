import 'package:eventory/models/event.dart';
import 'package:eventory/screens/event_info/event_info.dart';
import 'package:eventory/shared/styled_text.dart';
import 'package:eventory/theme.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard(this.event, {super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(children: [
          SizedBox(width: 20), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //StyledHeadline(event.userId),
              StyledText(event.name)
            ],
          ),
          //expanded create space between the text and the icon
          //sized box to take the available space
          Expanded(
            child: SizedBox(),
            ),
            IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.favorite, color: AppColors.textColor),
            ),
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (ctx) => EventInfo(event: event),
                ));
            }, 
            icon: Icon(Icons.arrow_forward_sharp, color: AppColors.textColor),
            )
        ],
        ),
      )
    );
  }
}