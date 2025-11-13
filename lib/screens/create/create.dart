import 'package:eventory/models/event.dart';
import 'package:eventory/screens/home/home.dart';
import 'package:eventory/shared/styled_button.dart';
import 'package:eventory/shared/styled_text.dart';
import 'package:eventory/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _eventDateTime;

  Future<void> _pickDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.white, 
              onPrimary: Colors.black, 
              surface: Colors.black, 
              onSurface: Colors.white, 
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.white, 
                onPrimary: Colors
                    .black, 
                surface: Colors.black, 
                onSurface: Colors.white, 
              ),
              timePickerTheme: const TimePickerThemeData(
                dialBackgroundColor: Colors.black,
                dialHandColor: Colors.white,
                hourMinuteTextColor: Colors.white,
                entryModeIconColor: Colors.white,
                helpTextStyle: TextStyle(color: Colors.white),
                dayPeriodTextColor: Colors.white,
                hourMinuteColor: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor:
                      Colors.white, 
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        final fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          _eventDateTime = fullDateTime;
        });
      }
    }
  }

  void _saveEvent() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a name of the event')),
      );
      return;
    }
    if (_locationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a location of the event')),
      );
      return;
    }
    if (_descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the description of the event'),
        ),
      );
      return;
    }
    if (_eventDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please pick a date & time for the event'),
        ),
      );
      return;
    }
    events.add(
      Event(
        id: uuid.v4(),
        name: _nameController.text,
        description: _descriptionController.text,
        location: _locationController.text,
        time: _eventDateTime!,
      ),
    );
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => const Home(),
    ));

    // TODO: Save to database here (e.g., Hive, SQLite, Firebase);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle('New Event'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            // Center(
            //   child: Center(
            //     child: Icon(Icons.code, color: AppColors.textColor),
            //   ),
            // ),
            const SizedBox(height: 10),
            const Center(child: StyledText('Fill out the form below')),
            const SizedBox(height: 30),

            // Event name
            TextField(
              controller: _nameController,
              style: GoogleFonts.kleeOne(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.event),
                label: StyledText('Event Name'),
              ),
            ),
            const SizedBox(height: 10),

            // Location
            TextField(
              controller: _locationController,
              style: GoogleFonts.kleeOne(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_city),
                label: StyledText('Location'),
              ),
            ),
            const SizedBox(height: 10),
            // Description
            TextField(
              controller: _descriptionController,
              minLines: 1,
              maxLines: null,
              style: GoogleFonts.kleeOne(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.description),
                label: StyledText('Description'),
              ),
            ),
            const SizedBox(height: 30),

            // Date & Time picker
            Row(
              children: [
                Expanded(
                  child: Text(
                    _eventDateTime == null
                        ? 'No date selected'
                        : '${_eventDateTime!.year}-${_eventDateTime!.month.toString().padLeft(2, '0')}-${_eventDateTime!.day.toString().padLeft(2, '0')} '
                              '${_eventDateTime!.hour.toString().padLeft(2, '0')}:${_eventDateTime!.minute.toString().padLeft(2, '0')}',
                    style: GoogleFonts.kleeOne(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => _pickDateTime(context),
                  icon: const Icon(Icons.calendar_month),
                  label: const StyledText('Pick Date & Time'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(color: Colors.white54, width: 1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: StyledButton(
          onPressed: _saveEvent,
          child: const StyledHeadline('Save Event'),
        ),
      ),
    );
  }
}
