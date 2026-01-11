class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numbersPart = numbers;

    // Handle custom delimiter syntax: //[delimiter]\n
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2); // remove //
      numbersPart = parts[1];
    }

    final normalized = numbersPart.replaceAll('\n', delimiter);
    final parts = normalized.split(delimiter);

    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}
