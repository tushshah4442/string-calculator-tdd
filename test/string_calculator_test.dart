import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('supports newline as delimiter along with comma', () {
    final result = add('1\n2,3');
    expect(result, 6);
  });
}
