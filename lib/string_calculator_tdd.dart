class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numbersPart = numbers;

    // Handle custom delimiter
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      numbersPart = parts[1];
    }

    final normalized = numbersPart.replaceAll('\n', delimiter);
    final parts = normalized.split(delimiter);

    final values = parts.map(int.parse).toList();

    // NEW: Detect negative numbers
    final negatives = values.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }

    return values.reduce((a, b) => a + b);
  }
}
