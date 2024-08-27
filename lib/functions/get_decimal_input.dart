// Helper function to get user input
import 'dart:io';

int getDecimalInput() {
  while (true) {
    stdout.write('Enter a decimal number: ');
    String? decimalInput = stdin.readLineSync();

    // Check if the input is a valid decimal number
    if (decimalInput != null && RegExp(r'^\d+$').hasMatch(decimalInput)) {
      return int.parse(decimalInput);
    } else {
      print('Invalid decimal number. Please enter an integer.');
    }
  }
}
