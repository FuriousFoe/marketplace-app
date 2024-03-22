import 'package:flutter/material.dart';

const enableBorder =
    UnderlineInputBorder(borderSide: BorderSide(color: Colors.black));
const focusBorder =
    UnderlineInputBorder(borderSide: BorderSide(color: Colors.black));

const backgroundColor = Color(0xFFF2F2F2);
const mainColor = Color(0xFF719f4b);

const div = Padding(
  padding: EdgeInsets.only(left: 8.0, right: 8),
  child: Divider(
    color: Colors.black,
  ),
);


const textsty = TextStyle(
  fontSize: 25,
  color: Colors.black,
);


PreferredSizeWidget appbar(String text) {
  return AppBar(
    backgroundColor: Color(0xffE9E3D5),
    title: Text(
      text,
      style: const TextStyle(
        fontFamily: "Anton",
        wordSpacing: 2,
        // fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
   
    centerTitle: true,
  );
}


Widget dropdownMenu<T>(
    List<T> list, T? dropdownValue, ValueChanged<T?> onChanged) {
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Set the color of the border
          width: 1.0, // Set the width of the border
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: DropdownButton<T>(
          elevation: 0,
          iconEnabledColor: const Color.fromARGB(255, 69, 122, 158),
          dropdownColor: const Color.fromARGB(255, 198, 209, 228),
          value: dropdownValue,
          onChanged: onChanged,
          borderRadius: BorderRadius.circular(25),
          items: list.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              alignment: Alignment.center,
              child: Text(
                value.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
      ));
}