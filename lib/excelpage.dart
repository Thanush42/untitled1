import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xl;
import 'package:untitled1/main.dart';

createexcel(
    List<String> cha, List<double> x, List<double> y, List<double> z) async {
  try {
    final xl.Workbook wb = xl.Workbook();
    final xl.Worksheet sheet = wb.worksheets[0];
    sheet.getRangeByName("B1").setText("Acc");
    sheet.getRangeByName("A2").setText("Character");
    sheet.getRangeByName("B2").setText("X");
    sheet.getRangeByName("C2").setText("Y");
    sheet.getRangeByName("E1").setText("kEYSTROCK");
    sheet.getRangeByName("D2").setText("Z");
    sheet.getRangeByName("E2").setText("H");
    sheet.getRangeByName("F2").setText("DD");
    sheet.getRangeByName("G2").setText("UD");
    sheet.getRangeByName("H2").setText("S");
    sheet.getRangeByName("I1").setText("User");

    int count = 3;
    for (int i = 0; i < cha.length; i++) {
      sheet.getRangeByName("A" + count.toString()).setText(cha[i]);
      sheet
          .getRangeByName("B" + count.toString())
          .setText(x[i].toStringAsFixed(5));

      sheet
          .getRangeByName("C" + count.toString())
          .setText(y[i].toStringAsFixed(5));

      sheet
          .getRangeByName("D" + count.toString())
          .setText(z[i].toStringAsFixed(5));

      sheet
          .getRangeByName("I" + count.toString())
          .setText(FirebaseAuth.instance.currentUser!.displayName);
      count++;
    }

    final byte = wb.saveAsStream();
    wb.dispose();
    final String fn = "/storage/emulated/0/Download/user.xlsx";
    final File file = File(fn);
    await file.writeAsBytes(byte, flush: true);
  } catch (e) {
    print(e);
  }
}
