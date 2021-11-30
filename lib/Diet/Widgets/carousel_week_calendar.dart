import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

List<String> _daysOfTheWeek = [
  'Poniedziałek',
  'Wtorek',
  'Środa',
  'Czwartek',
  'Piątek',
  'Sobota',
  'Niedziela',
];

DateTime today = DateTime.now();
DateFormat dateFormat = DateFormat('dd.MM.yyyy');

//musi byc stateful widget - zmianie ulegaja przyciski po nacisnieciu
class WeekCalendarCarouselWidget extends StatefulWidget {
  final String chosenDate;
  final Function(String) callback;

  WeekCalendarCarouselWidget(this.chosenDate, this.callback);

  @override
  _WeekCalendarCarouselWidgetState createState() =>
      _WeekCalendarCarouselWidgetState();
}

class _WeekCalendarCarouselWidgetState extends State<WeekCalendarCarouselWidget> {
  bool _pressedCalendar = false;
  List<bool> _pressedButton = List.generate(
    _daysOfTheWeek.length,
    (i) {
      if (i == 0) // dla dzisiejszego dnia tygodnia
        return true; // zaznacz nazwe dnia
      else
        return false;
    },
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setSp(80.0), // ograniczenie wysokosci przycisku
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _daysOfTheWeek.length,
        itemBuilder: (context, i) {
          DateTime date = DateTime(today.year, today.month, today.day + i);
          return Row(
            children: <Widget>[
              //=========================== PRZYCISK ================================
              MaterialButton(
                  height: ScreenUtil().setSp(
                      1000), //nie zmieniaj wartosci - max zakres wysokosci przycisku
                  color: _pressedButton[i] // KOLOR TŁA
                      ? Colors.grey[700] //gdy jest wcisniety
                      : null, // gdy nie jest wcisniety
                  child: Text(_daysOfTheWeek[date.weekday - 1],
                      //child: Text(dateFormat.format(date).toString(),
                      style: TextStyle(
                          fontSize: 16,
                          color: _pressedButton[i] // KOLOR TEKSTU
                              ? Colors.white // gdy  jest wcisniety
                              : Colors.grey[700], // gdy nie jest wcisneity
                          fontWeight: FontWeight.w800)),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    widget.callback(dateFormat.format(date)); // wyslij nowo wybrana date do list_diets_details.dart, zeby zapisac ja jako tekst nad karuzela
                    _pressedButton = List.generate(_daysOfTheWeek.length,(i) => false); //zdezaktywuj reszte przyciskow
                    _pressedCalendar = false;
                    setState(() => _pressedButton[i] = !_pressedButton[i]); // podswietl nowo nacisniety przycisk,
                  }),

              if (i == 6) // po ostatnim przycisku ustaw ikone kalendarza, zeby wybrac inny dzien
                MaterialButton(
                    height: ScreenUtil().setSp(
                        1000), //nie zmieniaj wartosci - max zakres wysokosci przycisku
                    color: _pressedCalendar // KOLOR TŁA
                      ? Colors.grey[700] //gdy jest wcisniety
                      : null, // gdy nie jest wcisniety
                    child: Icon(Icons.date_range, color: _pressedCalendar // KOLOR TEKSTU
                              ? Colors.white // gdy  jest wcisniety
                              : Colors.grey[700]), // gdy nie jest wcisneity
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      _selectDate(context); // odwolanie do kalendarza
                    }),
              //====================================================================
              SizedBox(width: 5),
              //====================================================================
            ],
          );
        },
      ),
    );
  }

  //===================== KALENDARZ =========================
  Future<Null> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime picked = await showDatePicker(
      context: context,
      locale: const Locale('pl', 'PL'),
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          isMaterialAppTheme: true,
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.lightGreen),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );

    //on OK clicked - jezeli nacisniesz ok w kalendarzu
    if (picked != null && picked != selectedDate)
      setState(
        () {
          setState(() => _pressedCalendar = true); // podswietl nowo nacisniety przycisk,
          _pressedButton = List.generate(_daysOfTheWeek.length,(i) => false); //zdezaktywuj reszte przyciskow
          selectedDate = picked;
          widget.callback(dateFormat.format(selectedDate)); // wyslij nowo wybrana date do list_diets_details.dart, zeby zapisac ja jako tekst nad karuzela
        },
      );
  }
  //====================================================================
}
