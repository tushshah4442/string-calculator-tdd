class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final delimiter = _extractDelimiter(numbers);
    final numbersPart = _extractNumbers(numbers);

    final values = _splitNumbers(numbersPart, delimiter);

    _validateNoNegatives(values);

    final filtered = _filterIgnored(values);

    return filtered.reduce((a, b) => a + b);
  }

  String _extractDelimiter(String numbers) {
    if (numbers.startsWith('//')) {
      return numbers.split('\n').first.substring(2);
    }
    return ',';
  }

  String _extractNumbers(String numbers) {
    if (numbers.startsWith('//')) {
      return numbers.split('\n')[1];
    }
    return numbers;
  }

  List<int> _splitNumbers(String numbers, String delimiter) {
    final normalized = numbers.replaceAll('\n', delimiter);
    return normalized.split(delimiter).map(int.parse).toList();
  }

  void _validateNoNegatives(List<int> values) {
    final negatives = values.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }
  }

  //NEW REFACTOR METHOD
  List<int> _filterIgnored(List<int> values) {
    return values.where((n) => n <= 1000).toList();
  }
}
