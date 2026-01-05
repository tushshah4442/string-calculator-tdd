library;

export 'src/string_calculator_base.dart';

int add(String numbers) {
  if (numbers.isEmpty) return 0;
  return int.parse(numbers);
}
