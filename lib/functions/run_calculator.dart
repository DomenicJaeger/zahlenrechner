// Function to handle the loop and user interaction
import 'dart:io';

import 'get_binary_input.dart';
import 'get_decimal_input.dart';
import 'get_hexadecimal_input.dart';
import '../models/unecessarily_long_calculator.dart';

void runCalculator(UnecessarilyLongCalculator calculator) {
  while (true) {
    stdout.write(
        'What do you want to do? - 1: Convert binary to decimal - 2: Convert binary to hexadecimal - 3: Convert decimal to binary - 4: Convert decimal to hexadecimal - 5: Convert hexadecimal to binary - 6: Convert hexadecimal to decimal - 7: Exit: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        String binary = getBinaryInput();
        print('The decimal value of $binary is ${calculator.convertBinaryToDecimal(binary)}');
        break;
      case '2':
        String binary = getBinaryInput();
        print('The hexadecimal value of $binary is ${calculator.convertBinaryToHexadecimal(binary)}');
        break;
      case '3':
        int decimal = getDecimalInput();
        print('The binary value of $decimal is ${calculator.convertDecimalToBinary(decimal)}');
        break;
      case '4':
        int decimal = getDecimalInput();
        print('The hexadecimal value of $decimal is ${calculator.convertDecimalToHexadecimal(decimal)}');
        break;
      case '5':
        String hexadecimal = getHexadecimalInput();
        print('The binary value of $hexadecimal is ${calculator.convertHexadecimalToBinary(hexadecimal)}');
        break;
      case '6':
        String hexadecimal = getHexadecimalInput();
        print('The decimal value of $hexadecimal is ${calculator.convertHexadecimalToDecimal(hexadecimal)}');
        break;
      case '7':
        print('Exiting the program.');
        return;
      default:
        print('Invalid input. Please choose a valid option (1, 2, 3, 4, 5, 6, or 7).');
    }
  }
}
