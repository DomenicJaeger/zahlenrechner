import 'package:zahlenrechner/models/unecessarily_long_calculator.dart';
import 'package:test/test.dart';

void main() {
  final calculator = UnecessarilyLongCalculator();
  group('binary => decimal', () {
    test('calculator.convertBinaryToDecimal("1010")', () {
      expect(calculator.convertBinaryToDecimal('1010'), 10);
      expect(calculator.convertBinaryToDecimal('1111'), 15);
      expect(calculator.convertBinaryToDecimal('1010101'), 85);
    });
  });
  group('binary => hexadecimal', () {
    test('calculator.convertBinaryToHexadecimal("1010")', () {
      expect(calculator.convertBinaryToHexadecimal('1010'), 'a');
      expect(calculator.convertBinaryToHexadecimal('1111'), 'f');
      expect(calculator.convertBinaryToHexadecimal('1010101'), '55');
    });
  });
  group('decimal => binary', () {
    test('calculator.convertDecimalToBinary(10)', () {
      expect(calculator.convertDecimalToBinary(10), '1010');
      expect(calculator.convertDecimalToBinary(15), '1111');
      expect(calculator.convertDecimalToBinary(85), '1010101');
    });
  });
  group('decimal => hexadecimal', () {
    test('calculator.convertDecimalToHexadecimal(10)', () {
      expect(calculator.convertDecimalToHexadecimal(10), 'a');
      expect(calculator.convertDecimalToHexadecimal(15), 'f');
      expect(calculator.convertDecimalToHexadecimal(85), '55');
    });
  });
  group('hexadecimal => binary', () {
    test('calculator.convertHexadecimalToBinary(A)', () {
      expect(calculator.convertHexadecimalToBinary('a'), '1010');
      expect(calculator.convertHexadecimalToBinary('f'), '1111');
      expect(calculator.convertHexadecimalToBinary('55'), '1010101');
    });
  });
  group('hexadecimal => decimal', () {
    test('calculator.convertHexadecimalToDecimal(A)', () {
      expect(calculator.convertHexadecimalToDecimal('a'), 10);
      expect(calculator.convertHexadecimalToDecimal('f'), 15);
      expect(calculator.convertHexadecimalToDecimal('55'), 85);
    });
  });
}
