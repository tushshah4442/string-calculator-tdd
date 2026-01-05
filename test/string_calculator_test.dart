import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('throws exception for negative numbers', () {
    expect(
          () => add('1,-2,-33'),
      throwsA(
        predicate((e) =>
        e is Exception &&
            e.toString().contains('Exception: negative numbers not allowed -2,-33')),
      ),
    );
  });
}
