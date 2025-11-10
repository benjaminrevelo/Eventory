import 'package:eventory/screens/home/event_card.dart';
import 'package:eventory/shared/styled_button.dart';
import 'package:eventory/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List events = ['shoes', 'food', 'drinks', 'dance', 'bar'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle('Eventory'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder:  (_, index){
                  return EventCard(events[index]);
                },
              ),
            ),
            StyledButton(onPressed: () {}, child: const StyledHeadline('Post an Event')),
          ],
        ),
      ),
    );
  }
}
