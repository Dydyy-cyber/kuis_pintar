
import 'package:flutter_test/flutter_test.dart';
import 'package:kuis_pintar/main.dart';

void main() {
  testWidgets('Aplikasi Kuis Pintar berhasil dijalankan',
      (WidgetTester tester) async {

    await tester.pumpWidget(const KuisPintarApp());

    expect(find.text('Kuis Pintar'), findsWidgets);
  });
}
