library;

export 'src/string_calculator_base.dart';

int add(String numbers) {
  if (numbers.isEmpty) return 0;

  String delimiter = ',';
  String numbersPart = numbers;

  if (numbers.startsWith('//')) {
    final parts = numbers.split('\n');
    delimiter = parts[0].substring(2);
    numbersPart = parts[1];
  }

  final normalized = numbersPart.replaceAll('\n', delimiter);
  final tokens = normalized.split(delimiter);

  final values = tokens.map(int.parse).toList();

  // Check for negative numbers
  final negatives = values.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception(
      'negative numbers not allowed ${negatives.join(',')}',
    );
  }

  return values.reduce((a, b) => a + b);
}
