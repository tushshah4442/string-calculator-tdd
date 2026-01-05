import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('returns sum of two comma-separated numbers', () {
    final result = add('1,2,3');
    expect(result, 6);
  });
}
