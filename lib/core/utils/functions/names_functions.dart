/// Returns the first [wordCount] words of the [fullName].
String getFirstNWords(String fullName, {int wordCount = 3}) {
  if (fullName.isEmpty) return '';
  final words = fullName.split(' ');
  if (words.length <= wordCount) return fullName;
  return words.sublist(0, wordCount).join(' ');
}
