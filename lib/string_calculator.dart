library;

export 'src/string_calculator_base.dart';

int add(String numbers) {
  // If the input is empty, the sum should be 0
  if (numbers.isEmpty) return 0;

  // This allows us to handle both commas and newlines uniformly
  final normalized = numbers.replaceAll('\n', ',');
  final parts = normalized.split(',');
  // Convert each token to int and sum them up
  return parts.map(int.parse).reduce((a, b) => a + b);
}
