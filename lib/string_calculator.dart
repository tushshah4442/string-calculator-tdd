library;

export 'src/string_calculator_base.dart';

int add(String numbers) {
  if (numbers.isEmpty) return 0;

  final normalized = numbers.replaceAll('\n', ',');
  final parts = normalized.split(',');
  return parts.map(int.parse).reduce((a, b) => a + b);
}
