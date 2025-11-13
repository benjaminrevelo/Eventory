import 'package:eventory/models/event.dart';
import 'package:eventory/screens/create/create.dart';
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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle('Eventory'), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [ 
            Expanded(
              child: events.isEmpty 
              ? const Center(child: StyledHeadline("It's quiet in here..."),
              )
              : ListView.builder(
                itemCount: events.length,
                itemBuilder:  (_, index){
                  return EventCard(events[index]);
                },
              ),
            ),
            StyledButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder:  (ctx) => const Create()
              ));
            }, child: const StyledHeadline('Post an Event')),
          ],
        ),
      ),
    );
  }
}
