import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_journal/TextField.dart';
import 'package:new_journal/data.dart';
import 'package:new_journal/datacontroller.dart';
import 'package:provider/provider.dart';

class Entry extends StatefulWidget {
  const Entry({super.key});

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  final TextEditingController _title = TextEditingController();
  DateTime _selector = DateTime.now();
  String _formattedTime = DateFormat("hh:mm").format(DateTime.now()) + " AM";
  int _selectedMood = 0; // Default mood

  final List<String> _moods = [
    'lib/icons/smile.png',
    'lib/icons/smile2.png',
    'lib/icons/smile3.png',
    'lib/icons/smile4.png',
    'lib/icons/smile5.png',
  ];

  final List<Color> _moodColors = [
    Colors.green,
    Colors.lightGreen,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: _appbar(),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        margin: const EdgeInsets.only(left: 1, right: 1),
        child: Column(
          children: [
            Text(
              "Add Entry",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            // Mood selection row
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_moods.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedMood = index;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Image.asset(
                          _moods[index],
                          color: _selectedMood == index
                              ? _moodColors[index]
                              : Colors.grey,
                        ),
                        height: 50,
                        width: 50,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Textfield(
                title: "Title",
                hint: "Enter",
                controller: _title,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Textfield(
                      title: "Date",
                      hint: DateFormat.yMd().format(_selector),
                      widget: IconButton(
                        icon: const Icon(Icons.calendar_month_outlined),
                        onPressed: () {
                          _getDate();
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Textfield(
                    title: "Time",
                    hint: _formattedTime,
                    widget: IconButton(
                      icon: const Icon(Icons.watch_later_outlined),
                      onPressed: () {
                        _getTime();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.surface,
                ),
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
              onPressed: () {
                _addDataToDb();
                Get.back();
              },
              child: Text(
                "SAVE",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  _addDataToDb() async {
    final dataProvider = Provider.of<Datacontroller>(context, listen: false);
    await dataProvider.addData(
      data: Data(
        title: _title.text,
        date: DateFormat.yMMMMd().format(_selector),
        mood: _selectedMood,
        time: _formattedTime,
      ),
    );
    dataProvider.fetchDataByDate(
        DateFormat.yMMMMd().format(_selector)); // Refresh the data list
    Get.back();
  }

  _getDate() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: _selector,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context)
                  .colorScheme
                  .primary, // Header background color
              onPrimary: Colors.white, // Header text color
              surface: Theme.of(context)
                  .colorScheme
                  .background, // Background color of the picker
              onSurface: Theme.of(context)
                  .colorScheme
                  .onSurface, // Text color of the picker
            ),
            dialogBackgroundColor: Theme.of(context)
                .colorScheme
                .background, // Background color of the dialog
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    Theme.of(context).colorScheme.primary, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (_pickerDate != null && _pickerDate != _selector) {
      setState(() {
        _selector = _pickerDate;
      });
    }
  }

  _getTime() async {
    TimeOfDay? _pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context)
                  .colorScheme
                  .primary, // Header background color
              onPrimary: Colors.white, // Header text color
              surface: Theme.of(context)
                  .colorScheme
                  .background, // Background color of the picker
              onSurface: Theme.of(context)
                  .colorScheme
                  .onSurface, // Text color of the picker
            ),
            dialogBackgroundColor: Theme.of(context)
                .colorScheme
                .background, // Background color of the dialog
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    Theme.of(context).colorScheme.primary, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (_pickedTime != null) {
      setState(() {
        _formattedTime = _pickedTime.format(context);
      });
    }
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios_outlined,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: const [
        Text(
          "𝓙",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        SizedBox(
          width: 40,
        )
      ],
    );
  }
}
