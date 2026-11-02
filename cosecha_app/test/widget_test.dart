import 'package:cosecha_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('muestra el formulario de cosecha', (tester) async {
    await tester.pumpWidget(const CosechaApp());
    expect(find.text('Registro de cosecha'), findsOneWidget);
    expect(find.text('Registrar cosecha'), findsOneWidget);
  });
}
