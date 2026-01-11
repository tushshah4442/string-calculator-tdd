import 'package:string_calculator_tdd/string_calculator_tdd.dart';
import 'package:test/test.dart';

void main() {
  //for empty string
  test('returns 0 for empty string', () {
    final calculator = StringCalculator();
    final result = calculator.add('');
    expect(result, 0);
  });
  //pass single number
  test('single number returns the number itself', () {
    final calculator = StringCalculator();
    expect(calculator.add('1'), 1);
  });
}
