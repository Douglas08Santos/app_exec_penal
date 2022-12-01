import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

var now = DateTime.now();
var firstDay = DateTime(now.year, now.month - 3, now.day);
var lastDay = DateTime(now.year, now.month + 3, now.day);

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: now,
          firstDay: firstDay,
          lastDay: lastDay,
          calendarFormat: format,
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Mês',
            CalendarFormat.twoWeeks: '2 Semanas',
            CalendarFormat.week: 'Semana'
          },
          headerStyle: HeaderStyle(
            leftChevronIcon: const Icon(
              Icons.chevron_left,
              size: 24,
              color: Colors.black,
            ),
            rightChevronIcon: const Icon(
              Icons.chevron_left,
              size: 24,
              color: Colors.black,
            ),
            headerPadding: EdgeInsets.zero,
            formatButtonVisible: true,
            formatButtonShowsNext: true,
            formatButtonDecoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
            ),
            formatButtonTextStyle:
                const TextStyle(color: Colors.white, fontSize: 12),
            titleTextStyle: const TextStyle(color: Colors.blueGrey),
            titleCentered: true,
          ),
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
                color: Colors.blueGrey, shape: BoxShape.rectangle),
            selectedTextStyle: TextStyle(
              color: Color.fromRGBO(238, 230, 226, 1),
            ),
            todayDecoration:
                BoxDecoration(color: Colors.grey, shape: BoxShape.rectangle),
            todayTextStyle: TextStyle(
              color: Colors.blueGrey,
            ),
            defaultDecoration: BoxDecoration(
                color: Colors.transparent, shape: BoxShape.rectangle),
            defaultTextStyle: TextStyle(color: Colors.blueGrey),
            weekendDecoration:
                BoxDecoration(color: Colors.amber, shape: BoxShape.rectangle),
            weekendTextStyle: TextStyle(color: Colors.blueGrey),
          ),
          calendarBuilders: CalendarBuilders(dowBuilder: (context, day) {
            String text;
            if (day.weekday == DateTime.sunday) {
              text = 'Dom';
            } else if (day.weekday == DateTime.monday) {
              text = 'Seg';
            } else if (day.weekday == DateTime.tuesday) {
              text = 'Ter';
            } else if (day.weekday == DateTime.wednesday) {
              text = 'Qua';
            } else if (day.weekday == DateTime.thursday) {
              text = 'Qui';
            } else if (day.weekday == DateTime.friday) {
              text = 'Sex';
            } else if (day.weekday == DateTime.saturday) {
              text = 'Sáb';
            } else {
              text = 'err';
            }
            return Center(
                child:
                    Text(text, style: const TextStyle(color: Colors.blueGrey)));
          }),
        ),
      ],
    );
  }
}
