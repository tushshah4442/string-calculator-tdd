import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('supports custom delimiter', () {
    final result = add('//;\n1;2');
    expect(result, 3);
  });
}
