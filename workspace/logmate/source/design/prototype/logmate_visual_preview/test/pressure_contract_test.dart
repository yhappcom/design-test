import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logmate_visual_preview/first_use.dart';
import 'package:logmate_visual_preview/home_v0_5.dart';
import 'package:logmate_visual_preview/home_v0_7.dart';
import 'package:logmate_visual_preview/home_v0_8.dart';
import 'package:logmate_visual_preview/home_v0_9.dart';
import 'package:logmate_visual_preview/home_v0_10.dart';
import 'package:logmate_visual_preview/home_v0_11.dart';
import 'package:logmate_visual_preview/premium_v0_6.dart';
import 'package:logmate_visual_preview/tokens.dart';

Widget _host(
  Widget child, {
  double textScale = 1,
  double viewInsetBottom = 0,
}) {
  return MaterialApp(
    theme: PreviewTheme.light(),
    home: MediaQuery(
      data: MediaQueryData(
        textScaler: TextScaler.linear(textScale),
        viewInsets: EdgeInsets.only(bottom: viewInsetBottom),
      ),
      child: child,
    ),
  );
}

Future<void> _pumpAt(
  WidgetTester tester,
  Widget child, {
  required Size size,
  double textScale = 1,
  double viewInsetBottom = 0,
}) async {
  await tester.binding.setSurfaceSize(size);
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(
    _host(
      child,
      textScale: textScale,
      viewInsetBottom: viewInsetBottom,
    ),
  );
  await tester.pumpAndSettle();
  expect(tester.takeException(), isNull);
}

void main() {
  testWidgets('Home survives 200% text without render overflow', (tester) async {
    await _pumpAt(
      tester,
      const HomeV05(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });





  testWidgets('Home v0.11 survives 200% text without render overflow',
      (tester) async {
    await _pumpAt(
      tester,
      const HomeV011(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });

  testWidgets('Home v0.11 survives short-height viewport', (tester) async {
    await _pumpAt(
      tester,
      const HomeV011(),
      size: const Size(390, 667),
    );
  });

  testWidgets('Home v0.10 survives 200% text without render overflow',
      (tester) async {
    await _pumpAt(
      tester,
      const HomeV010(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });

  testWidgets('Home v0.10 survives short-height viewport', (tester) async {
    await _pumpAt(
      tester,
      const HomeV010(),
      size: const Size(390, 667),
    );
  });

  testWidgets('Home v0.9 survives 200% text without render overflow',
      (tester) async {
    await _pumpAt(
      tester,
      const HomeV09(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });

  testWidgets('Home v0.9 survives short-height viewport', (tester) async {
    await _pumpAt(
      tester,
      const HomeV09(),
      size: const Size(390, 667),
    );
  });

  testWidgets('Home v0.8 survives 200% text without render overflow',
      (tester) async {
    await _pumpAt(
      tester,
      const HomeV08(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });

  testWidgets('Home v0.8 survives short-height viewport', (tester) async {
    await _pumpAt(
      tester,
      const HomeV08(),
      size: const Size(390, 667),
    );
  });

  testWidgets('Home v0.7.1 survives 200% text without render overflow',
      (tester) async {
    await _pumpAt(
      tester,
      const HomeV07(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });

  testWidgets('Home v0.7.1 survives short-height viewport', (tester) async {
    await _pumpAt(
      tester,
      const HomeV07(),
      size: const Size(390, 667),
    );
  });

  testWidgets('Home v0.6 survives 200% text without render overflow',
      (tester) async {
    await _pumpAt(
      tester,
      const HomeV06(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });

  testWidgets('Home v0.6 survives short-height viewport', (tester) async {
    await _pumpAt(
      tester,
      const HomeV06(),
      size: const Size(390, 667),
    );
  });

  testWidgets('Welcome survives 200% text', (tester) async {
    await _pumpAt(
      tester,
      const WelcomePreview(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });

  testWidgets('Previous Total carry survives 200% text', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _host(const PreviousTotalPreview(), textScale: 2),
    );
    await tester.ensureVisible(find.text('Carry forward totals'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Carry forward totals'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('Empty Home survives 200% text', (tester) async {
    await _pumpAt(
      tester,
      const EmptyHomePreview(),
      size: const Size(390, 844),
      textScale: 2,
    );
  });

  testWidgets('Home survives short-height viewport', (tester) async {
    await _pumpAt(
      tester,
      const HomeV05(),
      size: const Size(390, 667),
    );
  });





  testWidgets('Focused Home v0.11 search survives simulated IME inset',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _host(
        const HomeV011(),
        viewInsetBottom: 320,
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Focused Home v0.10 search survives simulated IME inset',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _host(
        const HomeV010(),
        viewInsetBottom: 320,
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Focused Home v0.9 search survives simulated IME inset',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _host(
        const HomeV09(),
        viewInsetBottom: 320,
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Focused Home v0.8 search survives simulated IME inset',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _host(
        const HomeV08(),
        viewInsetBottom: 320,
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Focused Home v0.7.1 search survives simulated IME inset',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _host(
        const HomeV07(),
        viewInsetBottom: 320,
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Focused Home v0.6 search survives simulated IME inset',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _host(
        const HomeV06(),
        viewInsetBottom: 320,
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Focused Home search survives simulated IME inset', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      _host(
        const HomeV05(),
        viewInsetBottom: 320,
      ),
    );
    await tester.tap(find.byType(TextField));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(TextField), findsOneWidget);
  });
}
