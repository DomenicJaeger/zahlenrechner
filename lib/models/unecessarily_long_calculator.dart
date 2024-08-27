/// This is an unnecessarily long calculator that provides functions to convert between binary, decimal and hexadecimal numbers.
// It is unnecessarily long because dart already has built-in functions to convert between these number systems and
// this is just a demonstration of how to convert between these number systems manually.
class UnecessarilyLongCalculator {
  UnecessarilyLongCalculator();

  /// function to convert binary to decimal
  int convertBinaryToDecimal(String binary) {
    // check if the binary string is empty
    if (binary.isEmpty) {
      // throw an error if the binary string is empty
      throw ArgumentError('Binary String cannot be empty');
    }
    // initialize the sum and the power of two
    var sum = 0;
    var powerOfTwo = 1;
    // iterate through the binary string in reverse order
    for (int i = binary.length - 1; i >= 0; i--) {
      // check if the character at the current index is not a binary digit
      if (binary[i] != '0' && binary[i] != '1') {
        // throw an error if the character is not a binary digit
        throw ArgumentError('Invalid binary number: $binary');
      }
      // check if the character at the current index is '1'
      if (binary[i] == '1') {
        // calculate the value of the current bit and add it to the sum
        final x = 1 * powerOfTwo;
        sum += x;
        // increment the power of two
        powerOfTwo = powerOfTwo * 2;
      } else {
        // if the character is '0', increment the power of two
        powerOfTwo = powerOfTwo * 2;
      }
    }
    // return the sum
    return sum;
  }

  /// function to convert binary to hexadecimal
  String convertBinaryToHexadecimal(String binary) {
    // check if the binary string is empty
    if (binary.isEmpty) {
      // throw an error if the binary string is empty
      throw ArgumentError('Binary String cannot be empty');
    }
    // check if the binary string is '0'
    if (binary == '0') {
      return '0';
    }
    // as we need to check the binary string in groups of 4, we need to check if zeros need to be added
    final missingZeros = 4 - (binary.length % 4);
    // if the binary string length is not divisible by 4, we add zeros to the left
    if (missingZeros < 4) {
      binary = binary.padLeft(binary.length + missingZeros, '0');
    }

    // We check the Strings in groups of 4. We pick the first 4 digits and convert them to hexadecimal
    final hexBuffer = StringBuffer();
    for (int i = 0; i < binary.length; i += 4) {
      final binaryGroup = binary.substring(i, i + 4);
      // convert the binary group to decimal
      final decimal = convertBinaryToDecimal(binaryGroup);
      // convert the decimal to hexadecimal
      final hex = convertDecimalToHexadecimal(decimal);
      // add the hexadecimal digit to the buffer
      hexBuffer.write(hex);
    }
    // return the hexadecimal number
    return hexBuffer.toString();
  }

  /// function to convert decimal to binary
  String convertDecimalToBinary(int decimal) {
    // check if the decimal number is zero
    if (decimal == 0) {
      // return zero if the decimal number is zero
      return '0';
    }
    // initialize a string buffer to store the binary number
    final buffer = StringBuffer();
    // store the decimal number in a variable
    var x = decimal;
    // iterate until x is greater than zero
    while (x > 0) {
      // get the remainder when x is divided by 2
      final y = x % 2;
      // append the remainder to the buffer
      buffer.write(y);
      // divide x by 2 rounding down to the nearest integer and store the result in x
      x = x ~/ 2;
    }
    // return the binary number in reverse order
    return buffer.toString().split('').reversed.join();
  }

  /// function to convert decimal to hexadecimal
  String convertDecimalToHexadecimal(int decimal) {
    // check if the decimal number is zero
    if (decimal == 0) {
      // return zero if the decimal number is zero
      return '0';
    }

    // initialize a string buffer to store the hexadecimal number
    final buffer = StringBuffer();
    // store the decimal number in a variable
    var x = decimal;
    // define the hexadecimal digits
    final hexDigits = '0123456789abcdef';
    // iterate until x is greater than zero
    while (x > 0) {
      // get the remainder when x is divided by 16
      final y = x % 16;
      // append the hexadecimal digit to the buffer
      buffer.write(hexDigits[y]);
      // divide x by 16 rounding down to the nearest integer and store the result in x
      x = x ~/ 16;
    }
    // return the hexadecimal number in reverse order
    return buffer.toString().split('').reversed.join();
  }

  /// function to convert hexadecimal to binary
  String convertHexadecimalToBinary(String hexadecimal) {
    // check if the hexadecimal string is empty
    if (hexadecimal.isEmpty) {
      throw ArgumentError('Hexadecimal string cannot be empty.');
    }
    // check if the hexadecimal string is '0'
    if (hexadecimal == '0') {
      return '0';
    }

    // initialize a string buffer to store the binary number
    final binaryBuffer = StringBuffer();
    final hexToBinary = {
      '0': '0000',
      '1': '0001',
      '2': '0010',
      '3': '0011',
      '4': '0100',
      '5': '0101',
      '6': '0110',
      '7': '0111',
      '8': '1000',
      '9': '1001',
      'a': '1010',
      'b': '1011',
      'c': '1100',
      'd': '1101',
      'e': '1110',
      'f': '1111',
    };
    // iterate through the hexadecimal string
    for (int i = 0; i < hexadecimal.length; i++) {
      final hex = hexadecimal[i].toLowerCase();
      // get the binary number for the current hexadecimal digit
      final binary = hexToBinary[hex];

      if (binary == null) {
        throw ArgumentError('Invalid hexadecimal number: $hex');
      }
      // add the binary number to the buffer
      binaryBuffer.write(binary);
    }
    // return the binary number without leading zeros
    return binaryBuffer.toString().replaceFirst(RegExp(r'^0+'), '');
  }

  /// function to convert hexadecimal to decimal
  int convertHexadecimalToDecimal(String hexadecimal) {
    // check if the hexadecimal string is empty
    if (hexadecimal.isEmpty) {
      // throw an error if the hexadecimal string is empty
      throw ArgumentError('Hexadecimal string cannot be empty.');
    }

    // initialize the sum and the power of sixteen
    var sum = 0;
    var powerOfSixteen = 1;
    // define the hexadecimal digits
    final hexDigits = '0123456789abcdef';
    // convert the hexadecimal string to lowercase
    hexadecimal = hexadecimal.toLowerCase();

    // iterate through the hexadecimal string in reverse order
    for (int i = hexadecimal.length - 1; i >= 0; i--) {
      // get the character at the current index
      final char = hexadecimal[i];
      // get the index of the character in the hexadecimal digits
      final index = hexDigits.indexOf(char);

      if (index == -1) {
        throw ArgumentError('Invalid hexadecimal number: $hexadecimal');
      }

      // add the product of the index and the power of sixteen to the sum
      sum += index * powerOfSixteen;
      // multiply the power of sixteen by sixteen
      powerOfSixteen *= 16;
    }

    // return the sum
    return sum;
  }
}
