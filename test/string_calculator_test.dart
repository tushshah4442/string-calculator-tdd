import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('returns number itself for single number', () {
    final result = add('1');
    expect(result, 1);
  });
}
