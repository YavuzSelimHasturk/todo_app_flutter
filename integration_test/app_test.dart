import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end to end test', () {
    testWidgets('tap on the floating action button , verify yeni kayıt button ',
            (tester) async {

      // Load app widget
    await tester.pumpWidget(const MyApp());





    });
  });
}