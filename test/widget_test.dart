import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecodelivery_app/main.dart';

void main() {
  testWidgets('EcoDeliveryApp renders placeholder screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: EcoDeliveryApp()));

    expect(find.text('EcoDelivery App'), findsOneWidget);
  });
}
