class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final delimiters = _extractDelimiters(numbers);
    final numbersPart = _extractNumbers(numbers);

    final values = _splitNumbers(numbersPart, delimiters);

    _validateNoNegatives(values);

    final filtered = _filterIgnored(values);

    return filtered.reduce((a, b) => a + b);
  }

  // --- Delimiter Handling ---

  List<String> _extractDelimiters(String numbers) {
    if (!numbers.startsWith('//')) return [','];

    final header = numbers.split('\n').first;
    return _parseDelimiters(header);
  }

  List<String> _parseDelimiters(String header) {
    // Single char delimiter: //;
    if (!header.contains('[')) {
      return [header.substring(2)];
    }

    // Multiple or multi-char delimiters: //[*][%] or //[***]
    final regex = RegExp(r'\[(.*?)\]');
    return regex
        .allMatches(header)
        .map((m) => m.group(1)!)
        .toList();
  }

  String _extractNumbers(String numbers) {
    if (numbers.startsWith('//')) {
      return numbers.split('\n')[1];
    }
    return numbers;
  }

  // --- Parsing ---

  List<int> _splitNumbers(String numbers, List<String> delimiters) {
    final normalized = _normalizeDelimiters(numbers, delimiters);
    return normalized.split(',').map(int.parse).toList();
  }

  String _normalizeDelimiters(String numbers, List<String> delimiters) {
    var result = numbers.replaceAll('\n', ',');

    for (final delimiter in delimiters) {
      result = result.replaceAll(delimiter, ',');
    }

    return result;
  }

  // --- Validation ---

  void _validateNoNegatives(List<int> values) {
    final negatives = values.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }
  }

  // --- Ignore > 1000 ---

  List<int> _filterIgnored(List<int> values) {
    return values.where((n) => n <= 1000).toList();
  }
}
