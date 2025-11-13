import 'package:eventory/models/event.dart';
import 'package:eventory/shared/styled_text.dart';
import 'package:eventory/theme.dart';
import 'package:flutter/material.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({
    super.key,
    required this.event,
    });

    final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle('Event Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //basic information about the event
            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor,
              child: Row(
                children: [
               //Image.asse('assets/img/sprites/${event.sprites.image}'),
               //width: 140,
               //height: 140,
               //),
               const SizedBox(width: 20),
               Expanded(
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeadline(event.name),
                  ],
                 ),
               )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StyledHeadline('Location'),
                  StyledText(event.location),
                  const SizedBox(height: 10),
                  const StyledHeadline('Description'),
                  StyledText(event.description),
                  const SizedBox(height: 10),
                  const StyledHeadline('Time'),
                  StyledText(event.time.toIso8601String()),
                  const SizedBox(height: 10),

                ],
              ),
            ),
            ),
            
          ],
        ),
      ),
    );
  }
}