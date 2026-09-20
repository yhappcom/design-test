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

Widget _host(Widget child) => MaterialApp(
      theme: PreviewTheme.light(),
      home: child,
    );

void main() {

  testWidgets('Home v0.11 consolidates labels, actions and data tracks',
      (tester) async {
    await tester.pumpWidget(_host(const HomeV011()));

    expect(find.text('LogMate'), findsOneWidget);
    expect(find.text('Add Flight'), findsOneWidget);
    expect(find.text('View Logbook'), findsOneWidget);
    expect(find.text('This month'), findsOneWidget);
    expect(find.text('This year'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Flight'), findsOneWidget);
    expect(find.text('Route'), findsOneWidget);
    expect(find.text('7 days'), findsOneWidget);
    expect(find.text('28 days'), findsOneWidget);
    expect(find.text('90 days'), findsOneWidget);
    expect(find.text('Inst'), findsOneWidget);
    expect(find.text('Search logbook'), findsOneWidget);
    expect(find.text('View all ›'), findsOneWidget);
    expect(find.text('Details ›'), findsNWidgets(2));
    expect(find.text('Customize'), findsNothing);
    expect(find.text('99,999+59'), findsNWidgets(3));
    expect(find.text('28D'), findsNothing);

    final dep = tester.getSize(find.byKey(const ValueKey('v11-dep-r1')));
    final arr = tester.getSize(find.byKey(const ValueKey('v11-arr-r1')));
    expect(dep.width, arr.width);
    expect(dep.width, greaterThanOrEqualTo(42));

    final flight =
        tester.getSize(find.byKey(const ValueKey('v11-flight-r1')));
    final block =
        tester.getSize(find.byKey(const ValueKey('v11-block-r1')));
    expect(flight.width, greaterThanOrEqualTo(76));
    expect(block.width, greaterThanOrEqualTo(52));

    final selector =
        tester.getSize(find.byKey(const ValueKey('activity-selector-v11')));
    expect(selector.width, greaterThan(330));

    final current =
        tester.getSize(find.byKey(const ValueKey('current-grid-v11')));
    final activity =
        tester.getSize(find.byKey(const ValueKey('activity-grid-v11')));
    final totals =
        tester.getSize(find.byKey(const ValueKey('totals-grid-v11')));
    expect(current.width, greaterThan(330));
    expect(activity.width, greaterThan(330));
    expect(totals.width, greaterThan(330));

    final addFlight = tester.getTopLeft(find.text('Add Flight'));
    final viewLogbook = tester.getTopLeft(find.text('View Logbook'));
    final search = tester.getTopLeft(find.byType(TextField));
    expect(addFlight.dy, lessThan(search.dy));
    expect(viewLogbook.dy, lessThan(search.dy));
    expect(addFlight.dx, lessThan(viewLogbook.dx));
  });


  testWidgets('Home v0.10 uses explicit periods and operational recent grid',
      (tester) async {
    await tester.pumpWidget(_host(const HomeV010()));

    expect(find.text('LogMate'), findsOneWidget);
    expect(find.text('Add Flight'), findsOneWidget);
    expect(find.text('View Logbook'), findsOneWidget);
    expect(find.text('Recent Flights'), findsOneWidget);
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Flight'), findsOneWidget);
    expect(find.text('Route'), findsOneWidget);
    expect(find.text('Block'), findsWidgets);
    expect(find.text('7 days'), findsOneWidget);
    expect(find.text('28 days'), findsOneWidget);
    expect(find.text('90 days'), findsOneWidget);
    expect(find.text('28D'), findsNothing);

    final dep = tester.getSize(find.byKey(const ValueKey('v10-dep-r1')));
    final arr = tester.getSize(find.byKey(const ValueKey('v10-arr-r1')));
    expect(dep.width, arr.width);

    final selector =
        tester.getSize(find.byKey(const ValueKey('activity-selector-v10')));
    expect(selector.width, greaterThan(330));

    final activity =
        tester.getSize(find.byKey(const ValueKey('activity-grid-v10')));
    final totals =
        tester.getSize(find.byKey(const ValueKey('totals-grid-v10')));
    expect(activity.width, greaterThan(330));
    expect(totals.width, greaterThan(330));
  });


  testWidgets('Home v0.9 preserves semantics and distributes lower Home across the grid',
      (tester) async {
    await tester.pumpWidget(_host(const HomeV09()));

    expect(find.text('LogMate'), findsOneWidget);
    expect(find.text('Add Flight'), findsOneWidget);
    expect(find.text('View Logbook'), findsOneWidget);
    expect(find.text('Recent Flights'), findsOneWidget);
    expect(find.text('Activity'), findsOneWidget);
    expect(find.text('Totals'), findsOneWidget);
    expect(find.text('28D'), findsOneWidget);
    expect(find.text('30D'), findsNothing);

    final selectorSize =
        tester.getSize(find.byKey(const ValueKey('activity-selector')));
    expect(selectorSize.width, greaterThan(330));

    final s7 =
        tester.getSize(find.byKey(const ValueKey('activity-segment-7D')));
    final s28 =
        tester.getSize(find.byKey(const ValueKey('activity-segment-28D')));
    final s90 =
        tester.getSize(find.byKey(const ValueKey('activity-segment-90D')));
    final custom =
        tester.getSize(find.byKey(const ValueKey('activity-segment-Custom')));
    expect(s7.width, closeTo(s28.width, 0.01));
    expect(s28.width, closeTo(s90.width, 0.01));
    expect(s90.width, closeTo(custom.width, 0.01));

    final dep = tester.getSize(find.byKey(const ValueKey('route-dep-r1')));
    final arr = tester.getSize(find.byKey(const ValueKey('route-arr-r1')));
    expect(dep.width, arr.width);

    final activityGrid =
        tester.getSize(find.byKey(const ValueKey('activity-grid')));
    final totalsGrid =
        tester.getSize(find.byKey(const ValueKey('totals-grid')));
    expect(activityGrid.width, greaterThan(330));
    expect(totalsGrid.width, greaterThan(330));
  });


  testWidgets('Home v0.8 preserves semantics and stable route geometry',
      (tester) async {
    await tester.pumpWidget(_host(const HomeV08()));

    expect(find.text('LogMate'), findsOneWidget);
    expect(find.text('Add Flight'), findsOneWidget);
    expect(find.text('View Logbook'), findsOneWidget);
    expect(find.textContaining('September'), findsOneWidget);
    expect(find.textContaining('2026'), findsOneWidget);
    expect(find.text('Recent Flights'), findsOneWidget);
    expect(find.text('30D'), findsNothing);
    expect(find.textContaining('Captain'), findsNothing);

    final dep1 = tester.getSize(find.byKey(const ValueKey('route-dep-r1')));
    final arr1 = tester.getSize(find.byKey(const ValueKey('route-arr-r1')));
    final dep2 = tester.getSize(find.byKey(const ValueKey('route-dep-r2')));
    expect(dep1.width, arr1.width);
    expect(dep1.width, dep2.width);

    final depCell0 =
        tester.getSize(find.byKey(const ValueKey('route-dep-r1-char-0')));
    final depCell1 =
        tester.getSize(find.byKey(const ValueKey('route-dep-r1-char-1')));
    final depCell2 =
        tester.getSize(find.byKey(const ValueKey('route-dep-r1-char-2')));
    expect(depCell0.width, depCell1.width);
    expect(depCell1.width, depCell2.width);

    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -700));
    await tester.pumpAndSettle();

    expect(find.text('Activity'), findsOneWidget);
    expect(find.text('28D'), findsOneWidget);
    expect(find.text('Totals'), findsOneWidget);
  });

  testWidgets('Home v0.5 preserves current period and 28D activity contract',
      (tester) async {
    await tester.pumpWidget(_host(const HomeV05()));

    expect(find.text('LogMate'), findsOneWidget);
    expect(find.text('Add Flight'), findsOneWidget);
    expect(find.text('View Logbook'), findsOneWidget);
    expect(find.text('SEP 2026'), findsOneWidget);
    expect(find.text('This month'), findsOneWidget);
    expect(find.text('This year'), findsOneWidget);
    expect(find.text('Landings'), findsNothing);
    expect(find.text('Recent Flights'), findsOneWidget);

    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -700));
    await tester.pumpAndSettle();

    expect(find.text('Activity'), findsOneWidget);
    expect(find.text('28D'), findsOneWidget);
    expect(find.text('30D'), findsNothing);
    expect(find.text('Totals'), findsOneWidget);
    expect(find.textContaining('Captain'), findsNothing);
  });

  testWidgets('Home v0.7.1 preserves Home semantics after type/layout calibration',
      (tester) async {
    await tester.pumpWidget(_host(const HomeV07()));

    expect(find.text('LogMate'), findsOneWidget);
    expect(find.text('Add Flight'), findsOneWidget);
    expect(find.text('View Logbook'), findsOneWidget);
    expect(find.textContaining('September'), findsOneWidget);
    expect(find.textContaining('2026'), findsOneWidget);
    expect(find.text('This month'), findsOneWidget);
    expect(find.text('This year'), findsOneWidget);
    expect(find.text('Recent Flights'), findsOneWidget);
    expect(find.text('30D'), findsNothing);
    expect(find.textContaining('Captain'), findsNothing);

    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -700));
    await tester.pumpAndSettle();

    expect(find.text('Activity'), findsOneWidget);
    expect(find.text('28D'), findsOneWidget);
    expect(find.text('Totals'), findsOneWidget);
  });

  testWidgets('Home v0.6 keeps v0.5 semantics while changing visual language',
      (tester) async {
    await tester.pumpWidget(_host(const HomeV06()));

    expect(find.text('LogMate'), findsOneWidget);
    expect(find.text('Add Flight'), findsOneWidget);
    expect(find.text('View Logbook'), findsOneWidget);
    expect(find.text('SEP'), findsOneWidget);
    expect(find.text('2026'), findsOneWidget);
    expect(find.text('This month'), findsOneWidget);
    expect(find.text('This year'), findsOneWidget);
    expect(find.text('Recent Flights'), findsOneWidget);
    expect(find.text('30D'), findsNothing);
    expect(find.textContaining('Captain'), findsNothing);

    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -700));
    await tester.pumpAndSettle();

    expect(find.text('Activity'), findsOneWidget);
    expect(find.text('28D'), findsOneWidget);
    expect(find.text('Totals'), findsOneWidget);
  });

  testWidgets('Welcome stays minimal and contains no marketing feature tour',
      (tester) async {
    await tester.pumpWidget(_host(const WelcomePreview()));

    expect(find.text('LogMate'), findsOneWidget);
    expect(find.text('Pilot Logbook'), findsOneWidget);
    expect(find.text('Start a new logbook'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);

    expect(find.textContaining('Access anywhere'), findsNothing);
    expect(find.textContaining('private and secure'), findsNothing);
    expect(find.textContaining('Log flights quickly'), findsNothing);
    expect(find.textContaining('Captain'), findsNothing);
  });

  testWidgets('Previous Total uses explicit zero/carry and semantic H+MM rows',
      (tester) async {
    await tester.pumpWidget(_host(const PreviousTotalPreview()));

    expect(find.text('Start from zero'), findsOneWidget);
    expect(find.text('Carry forward totals'), findsOneWidget);

    await tester.tap(find.text('Carry forward totals'));
    await tester.pump();

    expect(find.text('Block'), findsOneWidget);
    expect(find.text('Night'), findsOneWidget);
    expect(find.text('Instrument Flight Time'), findsOneWidget);
    expect(find.text('2,350+25'), findsOneWidget);
    expect(find.text('412+10'), findsOneWidget);
    expect(find.text('1,125+30'), findsOneWidget);

    expect(find.text('Total Flights'), findsNothing);
    expect(find.text('Total Landings'), findsNothing);
    expect(find.text('Total Flight Time'), findsNothing);
  });

  testWidgets('Empty Home contains no fabricated activity or totals',
      (tester) async {
    await tester.pumpWidget(_host(const EmptyHomePreview()));

    expect(find.text('No flights yet.'), findsOneWidget);
    expect(find.text('Add Flight'), findsOneWidget);
    expect(find.text('Import records'), findsOneWidget);
    expect(find.text('Recent'), findsNothing);
    expect(find.text('Activity'), findsNothing);
    expect(find.text('Totals'), findsNothing);
  });
}
