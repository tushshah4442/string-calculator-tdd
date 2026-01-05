import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('returns 0 for empty string', () {
    final result = add('');
    expect(result, 0);
  });
}
