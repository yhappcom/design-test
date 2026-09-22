// Candidate 17 — Split Signal
// Derived only from frozen structural baseline 79fd5c43...; layout/data/semantics are preserved.
// Visual references are principle-only; no external app layout, assets, or branded motifs are copied.
import 'package:flutter/material.dart';

import 'primitives.dart';

abstract final class _V11Colors {
  static const lightCanvas = Color(0xFFF8F9FC);
  static const lightSurface = Color(0xFFE3E6ED);
  static const lightText = Color(0xFF0B1020);
  static const lightSecondary = Color(0xFF4C566B);
  static const lightTertiary = Color(0xFF6E7789);
  static const lightAccent = Color(0xFF2557D6);
  static const lightSignal = Color(0xFF6D8E00);

  static const darkCanvas = Color(0xFF090C13);
  static const darkSurface = Color(0xFF171D2B);
  static const darkText = Color(0xFFF8FAFF);
  static const darkSecondary = Color(0xFFADB7CA);
  static const darkTertiary = Color(0xFF7A8498);
  static const darkAccent = Color(0xFF83A4FF);
  static const darkSignal = Color(0xFFD8FF52);
}

class _V11Theme {
  static ThemeData build(Brightness brightness, {String? fontFamily}) {
    final dark = brightness == Brightness.dark;
    final canvas = dark ? _V11Colors.darkCanvas : _V11Colors.lightCanvas;
    final text = dark ? _V11Colors.darkText : _V11Colors.lightText;
    final secondary =
        dark ? _V11Colors.darkSecondary : _V11Colors.lightSecondary;
    final accent = dark ? _V11Colors.darkAccent : _V11Colors.lightAccent;

    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      scaffoldBackgroundColor: canvas,
      fontFamily: fontFamily,
      splashFactory: InkSparkle.splashFactory,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: accent,
        onPrimary: canvas,
        secondary: secondary,
        onSecondary: canvas,
        error: dark ? const Color(0xFFE9A7AC) : const Color(0xFF9C424A),
        onError: canvas,
        surface: canvas,
        onSurface: text,
      ),
    );
  }
}

extension _V11Context on BuildContext {
  bool get v11Dark => Theme.of(this).brightness == Brightness.dark;
  Color get v11Surface =>
      v11Dark ? _V11Colors.darkSurface : _V11Colors.lightSurface;
  Color get v11Text => v11Dark ? _V11Colors.darkText : _V11Colors.lightText;
  Color get v11Secondary =>
      v11Dark ? _V11Colors.darkSecondary : _V11Colors.lightSecondary;
  Color get v11Tertiary =>
      v11Dark ? _V11Colors.darkTertiary : _V11Colors.lightTertiary;
  Color get v11Accent =>
      v11Dark ? _V11Colors.darkAccent : _V11Colors.lightAccent;
  Color get v11Signal =>
      v11Dark ? _V11Colors.darkSignal : _V11Colors.lightSignal;

  TextStyle get v11Identity => TextStyle(
        fontSize: 17,
        height: 21 / 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.05,
        color: v11Text,
      );

  TextStyle get v11Context => TextStyle(
        fontSize: 19,
        height: 23 / 19,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.18,
        color: v11Text,
      );

  TextStyle get v11Section => TextStyle(
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w600,
        color: v11Text,
      );

  TextStyle get v11DataLabel => TextStyle(
        fontSize: 11.5,
        height: 15 / 11.5,
        fontWeight: FontWeight.w600,
        color: v11Secondary,
      );

  TextStyle get v11PrimaryData => TextStyle(
        fontSize: 17,
        height: 21 / 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.04,
        color: v11Accent,
        fontFeatures: const [FontFeature.tabularFigures()],
      );

  TextStyle get v11SummaryData => TextStyle(
        fontSize: 15.5,
        height: 19 / 15.5,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.02,
        color: v11Text,
        fontFeatures: const [FontFeature.tabularFigures()],
      );

  TextStyle get v11OperationalData => TextStyle(
        fontSize: 13.5,
        height: 17 / 13.5,
        fontWeight: FontWeight.w600,
        color: v11Text,
      );

  TextStyle get v11Metadata => TextStyle(
        fontSize: 13.5,
        height: 17 / 13.5,
        fontWeight: FontWeight.w600,
        color: v11Secondary,
      );

  TextStyle get v11Action => TextStyle(
        fontSize: 13,
        height: 17 / 13,
        fontWeight: FontWeight.w600,
        color: v11Text,
      );

  TextStyle get v11Utility => TextStyle(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w500,
        color: v11Secondary,
      );
}

class HomeCandidate17 extends StatefulWidget {
  const HomeCandidate17({super.key});

  @override
  State<HomeCandidate17> createState() => _HomeCandidate17State();
}

class _HomeCandidate17State extends State<HomeCandidate17> {
  String activity = '28 days';

  bool _largeText(BuildContext context) =>
      MediaQuery.textScalerOf(context).scale(13) >= 20;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    const fontFamily = 'C17Sans';

    return Theme(
      data: _V11Theme.build(brightness, fontFamily: fontFamily),
      child: PreviewPage(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 34),
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _V11Header(),
              const SizedBox(height: 2),
              const _V11Actions(),
              const SizedBox(height: 4),
              const _V11Search(),
              const SizedBox(height: 10),
              _currentPeriod(context),
              const SizedBox(height: 21),
              const _V11SectionHeader(
                title: 'Recent Flights',
                actions: ['View all ›'],
              ),
              const SizedBox(height: 5),
              const _V11FlightHeader(),
              const SizedBox(height: 2),
              const _V11FlightRow(
                rowId: 'r1',
                date: 'Sep 02',
                carrier: '7C',
                numberSuffix: '132',
                dep: 'GMP',
                arr: 'CJU',
                block: '1+12',
              ),
              const _V11FlightRow(
                rowId: 'r2',
                date: 'Aug 31',
                carrier: '7C',
                numberSuffix: '1123',
                dep: 'CJU',
                arr: 'GMP',
                block: '1+08',
              ),
              const _V11FlightRow(
                rowId: 'r3',
                date: 'Aug 29',
                carrier: 'KE',
                numberSuffix: '28',
                dep: 'GMP',
                arr: 'CJU',
                block: '1+10',
              ),
              const SizedBox(height: 21),
              _activity(context),
              const SizedBox(height: 21),
              const _V11Totals(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentPeriod(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const _V11MonthControl(
                label: 'Previous month',
                glyph: '‹',
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'September', style: context.v11Context),
                      TextSpan(
                        text: '  2026',
                        style: context.v11Metadata.copyWith(
                          fontSize: 12.5,
                          color: context.v11Secondary,
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ),
              const _V11MonthControl(
                label: 'Next month',
                glyph: '›',
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Current Period values represent Block Time. Values are mock only;
          // aggregation policy remains outside this visual prototype.
          const _V11MetricRow(
            key: ValueKey('current-grid-v11'),
            metrics: [
              _V11Metric(label: 'This month', value: '42+15'),
              _V11Metric(label: 'This year', value: '318+40'),
            ],
            flexes: [1, 1],
            prominent: true,
          ),
        ],
      );

  Widget _activity(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _V11SectionHeader(
            title: 'Activity',
            actions: ['Details ›'],
          ),
          const SizedBox(height: 6),
          _V11PeriodSelector(
            selected: activity,
            onChanged: (value) => setState(() => activity = value),
          ),
          const SizedBox(height: 10),
          const _V11MetricRow(
            key: ValueKey('activity-grid-v11'),
            metrics: [
              _V11Metric(label: 'Legs', value: '24'),
              _V11Metric(label: 'Block', value: '38+45'),
              _V11Metric(label: 'TO / LD', value: '24 / 24'),
            ],
            flexes: [1, 1, 1],
          ),
        ],
      );
}

class _V11Header extends StatelessWidget {
  const _V11Header();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: Row(
          children: [
            Text('LogMate', style: context.v11Identity),
            const Spacer(),
            Semantics(
              button: true,
              label: 'Settings',
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: _SettingsGlyph(
                        color: context.v11Secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class _V11Search extends StatefulWidget {
  const _V11Search();

  @override
  State<_V11Search> createState() => _V11SearchState();
}

class _V11SearchState extends State<_V11Search> {
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_changed);
  }

  void _changed() => setState(() {});

  @override
  void dispose() {
    focusNode
      ..removeListener(_changed)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = focusNode.hasFocus;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: focusNode.requestFocus,
      child: SizedBox(
        height: 40,
        child: Center(
          child: SizedBox(
            height: 34,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.v11Surface,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: active ? context.v11Accent : context.v11Tertiary,
                  width: active ? 1.4 : 0.8,
                ),
              ),
              child: TextField(
                focusNode: focusNode,
                style: context.v11Metadata.copyWith(
                  fontSize: 12.5,
                  color: context.v11Text,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  prefixIcon: _SearchGlyph(
                    color:
                        active ? context.v11Signal : context.v11Secondary,
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 34, minHeight: 34),
                  hintText: 'Search logbook',
                  hintStyle: context.v11Metadata.copyWith(
                    fontSize: 12.5,
                    color: context.v11Secondary,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(0, 7, 10, 7),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _V11MonthControl extends StatelessWidget {
  const _V11MonthControl({
    required this.label,
    required this.glyph,
  });

  final String label;
  final String glyph;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Text(
                glyph,
                style: TextStyle(
                  fontSize: 24,
                  height: 1,
                  fontWeight: FontWeight.w400,
                  color: context.v11Accent,
                ),
              ),
            ),
          ),
        ),
      );
}

class _V11Actions extends StatelessWidget {
  const _V11Actions();

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return const Column(
        children: [
          _V11ActionItem(
            label: 'Add Flight',
            leading: '＋',
            alignment: MainAxisAlignment.start,
          ),
          _V11ActionItem(
            label: 'View Logbook',
            trailing: '›',
            alignment: MainAxisAlignment.end,
          ),
        ],
      );
    }

    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _V11ActionItem(
          label: 'Add Flight',
          leading: '＋',
          alignment: MainAxisAlignment.start,
        ),
        _V11ActionItem(
          label: 'View Logbook',
          trailing: '›',
          alignment: MainAxisAlignment.end,
        ),
      ],
    );
  }
}

class _V11ActionItem extends StatelessWidget {
  const _V11ActionItem({
    required this.label,
    this.leading,
    this.trailing,
    this.alignment = MainAxisAlignment.center,
  });

  final String label;
  final String? leading;
  final String? trailing;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(3),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 40),
            child: Row(
              mainAxisAlignment: alignment,
              children: [
                if (leading != null) ...[
                  Text(
                    leading!,
                    style: context.v11Action.copyWith(
                      color: context.v11Signal,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 6),
                ],
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: context.v11Action.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: 6),
                  Text(
                    trailing!,
                    style: context.v11Action.copyWith(
                      color: context.v11Accent,
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}

class _V11SectionHeader extends StatelessWidget {
  const _V11SectionHeader({
    required this.title,
    this.actions = const [],
  });

  final String title;
  final List<String> actions;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText && actions.length > 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.v11Section),
          const SizedBox(height: 2),
          Wrap(
            spacing: 12,
            children: [
              for (final action in actions) _V11TextAction(label: action),
            ],
          ),
        ],
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 30),
      child: Row(
        children: [
          Expanded(child: Text(title, style: context.v11Section)),
          for (var i = 0; i < actions.length; i++) ...[
            if (i > 0) const SizedBox(width: 12),
            _V11TextAction(label: actions[i]),
          ],
        ],
      ),
    );
  }
}

class _V11TextAction extends StatelessWidget {
  const _V11TextAction({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            child: Text(
              label,
              style: context.v11Utility.copyWith(
                color: context.v11Accent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
}

class _V11FlightHeader extends StatelessWidget {
  const _V11FlightHeader();

  @override
  Widget build(BuildContext context) => const _V11FlightGrid(
        date: Text('Date', textAlign: TextAlign.center),
        flight: Text('Flight', textAlign: TextAlign.center),
        route: Text('Route', textAlign: TextAlign.center),
        block: Text('Block', textAlign: TextAlign.center),
        isHeader: true,
      );
}

class _V11FlightRow extends StatelessWidget {
  const _V11FlightRow({
    required this.rowId,
    required this.date,
    required this.carrier,
    required this.numberSuffix,
    required this.dep,
    required this.arr,
    required this.block,
  });

  final String rowId;
  final String date;
  final String carrier;
  final String numberSuffix;
  final String dep;
  final String arr;
  final String block;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    date,
                    style: context.v11Metadata.copyWith(
                      color: context.v11Text,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ),
                Text(
                  '$carrier\u2009$numberSuffix',
                  style: context.v11Metadata.copyWith(
                    color: context.v11Text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                _V11Route(rowId: rowId, dep: dep, arr: arr),
                const Spacer(),
                Text(
                  block,
                  style: context.v11OperationalData.copyWith(
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(3),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: _V11FlightGrid(
          date: Center(
            child: Text(
              date,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: context.v11Metadata.copyWith(
                color: context.v11Text,
                fontFamily: 'C17Mono',
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
          flight: Center(
            child: _V11FlightIdentifier(
              rowId: rowId,
              carrier: carrier,
              numberSuffix: numberSuffix,
            ),
          ),
          route: Center(
            child: _V11Route(rowId: rowId, dep: dep, arr: arr),
          ),
          block: Center(
            child: _V11BlockValue(
              rowId: rowId,
              value: block,
            ),
          ),
        ),
      ),
    );
  }
}

class _V11FlightIdentifier extends StatelessWidget {
  const _V11FlightIdentifier({
    required this.rowId,
    required this.carrier,
    required this.numberSuffix,
  });

  final String rowId;
  final String carrier;
  final String numberSuffix;

  @override
  Widget build(BuildContext context) => Row(
        key: ValueKey('v11-flight-$rowId'),
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 19,
            child: Text(
              carrier,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: context.v11Metadata.copyWith(color: context.v11Text),
            ),
          ),
          const SizedBox(width: 2),
          SizedBox(
            width: 42,
            child: Text(
              numberSuffix,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: context.v11Metadata.copyWith(
                color: context.v11Text,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
        ],
      );
}

class _V11BlockValue extends StatelessWidget {
  const _V11BlockValue({
    required this.rowId,
    required this.value,
  });

  final String rowId;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(13.5) / 13.5;
    return SizedBox(
      key: ValueKey('v11-block-$rowId'),
      width: 52 * scale,
      child: Text(
        value,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.clip,
        style: context.v11OperationalData.copyWith(
          color: context.v11Accent,
          fontWeight: FontWeight.w700,
          fontFeatures: const [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

class _V11FlightGrid extends StatelessWidget {
  const _V11FlightGrid({
    required this.date,
    required this.flight,
    required this.route,
    required this.block,
    this.isHeader = false,
  });

  final Widget date;
  final Widget flight;
  final Widget route;
  final Widget block;
  final bool isHeader;

  @override
  Widget build(BuildContext context) {
    Widget styleHeader(Widget child) => SizedBox(
          width: double.infinity,
          child: DefaultTextStyle(
            style: context.v11DataLabel.copyWith(fontFamily: 'C17Sans'),
            maxLines: 1,
            overflow: TextOverflow.clip,
            child: child,
          ),
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 23, child: isHeader ? styleHeader(date) : date),
        Expanded(flex: 25, child: isHeader ? styleHeader(flight) : flight),
        Expanded(flex: 30, child: isHeader ? styleHeader(route) : route),
        Expanded(flex: 22, child: isHeader ? styleHeader(block) : block),
      ],
    );
  }
}

class _V11Route extends StatelessWidget {
  const _V11Route({
    required this.rowId,
    required this.dep,
    required this.arr,
  });

  final String rowId;
  final String dep;
  final String arr;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(13.5) / 13.5;
    final codeStyle = context.v11OperationalData.copyWith(
      fontFamily: 'C17Mono',
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          key: ValueKey('v11-dep-$rowId'),
          width: 42 * scale,
          child: Text(
            dep,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: codeStyle,
          ),
        ),
        SizedBox(
          width: 18 * scale,
          child: Center(
            child: Text(
              '→',
              style: context.v11Metadata.copyWith(
                color: context.v11Tertiary,
              ),
            ),
          ),
        ),
        SizedBox(
          key: ValueKey('v11-arr-$rowId'),
          width: 42 * scale,
          child: Text(
            arr,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: codeStyle,
          ),
        ),
      ],
    );
  }
}

class _V11Metric {
  const _V11Metric({required this.label, required this.value});

  final String label;
  final String value;
}

class _V11MetricRow extends StatelessWidget {
  const _V11MetricRow({
    super.key,
    required this.metrics,
    required this.flexes,
    this.prominent = false,
  });

  final List<_V11Metric> metrics;
  final List<int> flexes;
  final bool prominent;

  @override
  Widget build(BuildContext context) {
    assert(metrics.length == flexes.length);
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return Column(
        children: [
          for (var i = 0; i < metrics.length; i++) ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    metrics[i].label,
                    style: context.v11DataLabel,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  metrics[i].value,
                  style: prominent
                      ? context.v11PrimaryData
                      : context.v11SummaryData,
                ),
              ],
            ),
            if (i != metrics.length - 1) const SizedBox(height: 8),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < metrics.length; i++)
          Expanded(
            flex: flexes[i],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  metrics[i].label,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: context.v11DataLabel,
                ),
                const SizedBox(height: 2),
                Text(
                  metrics[i].value,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: prominent
                      ? context.v11PrimaryData
                      : context.v11SummaryData,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _V11PeriodSelector extends StatelessWidget {
  const _V11PeriodSelector({
    required this.selected,
    required this.onChanged,
  });

  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    const values = ['7 days', '28 days', '90 days', 'Custom'];
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 6,
        children: [
          for (final value in values)
            _V11PeriodCell(
              value: value,
              selected: selected == value,
              onTap: () => onChanged(value),
            ),
        ],
      );
    }

    return Row(
      key: const ValueKey('activity-selector-v11'),
      children: [
        for (final value in values)
          Expanded(
            child: _V11PeriodCell(
              value: value,
              selected: selected == value,
              onTap: () => onChanged(value),
            ),
          ),
      ],
    );
  }
}

class _V11PeriodCell extends StatelessWidget {
  const _V11PeriodCell({
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final String value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        selected: selected,
        label: value,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(3),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 38),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 5,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? context.v11Accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: context.v11Metadata.copyWith(
                    fontSize: 12.5,
                    color: selected
                        ? Theme.of(context).colorScheme.onPrimary
                        : context.v11Secondary,
                    fontWeight:
                        selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _V11Totals extends StatelessWidget {
  const _V11Totals();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _V11SectionHeader(
            title: 'Totals',
            actions: ['Details ›'],
          ),
          SizedBox(height: 8),
          _V11MetricRow(
            key: ValueKey('totals-grid-v11'),
            metrics: [
              _V11Metric(label: 'Block', value: '99,999+59'),
              _V11Metric(label: 'Night', value: '99,999+59'),
              _V11Metric(
                label: 'Inst',
                value: '99,999+59',
              ),
            ],
            flexes: [1, 1, 1],
          ),
        ],
      );
}


class _SearchGlyph extends StatelessWidget {
  const _SearchGlyph({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 16,
        height: 16,
        child: CustomPaint(painter: _SearchGlyphPainter(color)),
      );
}

class _SearchGlyphPainter extends CustomPainter {
  const _SearchGlyphPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(const Offset(6.2, 6.2), 3.9, p);
    canvas.drawLine(const Offset(9.1, 9.1), const Offset(13.5, 13.5), p);
  }

  @override
  bool shouldRepaint(covariant _SearchGlyphPainter oldDelegate) =>
      oldDelegate.color != color;
}

class _SettingsGlyph extends StatelessWidget {
  const _SettingsGlyph({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 18,
        height: 18,
        child: CustomPaint(painter: _SettingsGlyphPainter(color)),
      );
}

class _SettingsGlyphPainter extends CustomPainter {
  const _SettingsGlyphPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(2, 4), const Offset(16, 4), p);
    canvas.drawLine(const Offset(2, 9), const Offset(16, 9), p);
    canvas.drawLine(const Offset(2, 14), const Offset(16, 14), p);
    final knob = Paint()..color = color;
    canvas.drawCircle(const Offset(11.5, 4), 1.8, knob);
    canvas.drawCircle(const Offset(6.5, 9), 1.8, knob);
    canvas.drawCircle(const Offset(12.5, 14), 1.8, knob);
  }

  @override
  bool shouldRepaint(covariant _SettingsGlyphPainter oldDelegate) =>
      oldDelegate.color != color;
}
