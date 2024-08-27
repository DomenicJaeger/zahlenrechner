// Helper function to get user input
import 'dart:io';

String getBinaryInput() {
  while (true) {
    stdout.write('Enter a binary number: ');
    String? binary = stdin.readLineSync();

    // Check if the input is a valid binary number
    if (binary != null && RegExp(r'^[01]+$').hasMatch(binary)) {
      return binary;
    } else {
      print('Invalid binary number. Please enter a binary number containing only 0s and 1s.');
    }
  }
}
