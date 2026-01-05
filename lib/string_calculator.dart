library;

export 'src/string_calculator_base.dart';

int add(String numbers) {
  if (numbers.isEmpty) return 0;

  String delimiter = ',';
  String numbersPart = numbers;

  // Check for custom delimiter definition
  if (numbers.startsWith('//')) {
    final parts = numbers.split('\n');
    delimiter = parts[0].substring(2); // Extract delimiter after //
    numbersPart = parts[1];
  }

  // Normalize newlines to delimiter
  final normalized = numbersPart.replaceAll('\n', delimiter);

  // Split and sum
  final tokens = normalized.split(delimiter);
  return tokens.map(int.parse).reduce((a, b) => a + b);
}
