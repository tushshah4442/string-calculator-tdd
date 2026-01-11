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
  //adding two number
  test('two comma separated numbers return their sum', () {
    final calculator = StringCalculator();
    expect(calculator.add('1,5'), 6);
  });
  //Newlines (\n) should behave like commas
  test('numbers separated by newlines are also summed', () {
    final calculator = StringCalculator();
    expect(calculator.add('1\n2,3'), 6);
  });
  //supports custom delimiter
  test('supports custom delimiter', () {
    final calculator = StringCalculator();
    expect(calculator.add("//;\n1;2"), 3);
  });
  //Negative numbers
  test('throws exception for negative numbers', () {
    final calculator = StringCalculator();

    expect(
          () => calculator.add('1,-2,3,-4'),
      throwsA(
        predicate((e) =>
        e is Exception &&
            e.toString().contains('negative numbers not allowed -2,-4')),
      ),
    );
  });

}
