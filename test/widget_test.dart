// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

void main() {
  final List<String> nama = ['dani', 'arya', 'putra'];
  final List<String> nama2 = ['imran', 'afdillah'];

  final List<String> gabunganNama = [...nama, ...nama2];

  print(gabunganNama);
}
