import 'package:string_calculator_tdd/string_calculator_tdd.dart';
import 'package:test/test.dart';

void main() {
  test('returns 0 for empty string', () {
    final calculator = StringCalculator();

    final result = calculator.add('');

    expect(result, 0);
  });
}
