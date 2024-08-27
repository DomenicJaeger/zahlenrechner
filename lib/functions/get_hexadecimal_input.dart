// Helper function to get user input
import 'dart:io';

String getHexadecimalInput() {
  while (true) {
    stdout.write('Enter a hexadecimal number: ');
    String? hexadecimal = stdin.readLineSync();

    // Check if the input is a valid hexadecimal number
    if (hexadecimal != null && RegExp(r'^[0-9a-fA-F]+$').hasMatch(hexadecimal)) {
      return hexadecimal.toLowerCase(); // Convert to lowercase for consistency
    } else {
      print('Invalid hexadecimal number. Please enter a number containing only 0-9 and a-f (or A-F).');
    }
  }
}
