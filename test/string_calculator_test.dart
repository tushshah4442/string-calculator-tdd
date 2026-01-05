import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('returns sum of two comma-separated numbers', () {
    final result = add('1,5');
    expect(result, 6);
  });
}
