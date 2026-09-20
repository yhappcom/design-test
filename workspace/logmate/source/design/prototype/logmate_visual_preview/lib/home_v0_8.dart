import 'package:flutter/material.dart';

import 'primitives.dart';

abstract final class _V8Colors {
  static const lightCanvas = Color(0xFFF7F8F5);
  static const lightSurface = Color(0xFFEEF1EE);
  static const lightElevated = Color(0xFFFFFFFF);
  static const lightText = Color(0xFF171A19);
  static const lightSecondary = Color(0xFF69706D);
  static const lightTertiary = Color(0xFF8D9490);
  static const lightAccent = Color(0xFF356B6F);
  static const lightPrimary = Color(0xFF1C2929);
  static const lightOnPrimary = Color(0xFFF7FAF8);

  static const darkCanvas = Color(0xFF0E1110);
  static const darkSurface = Color(0xFF181C1A);
  static const darkElevated = Color(0xFF222725);
  static const darkText = Color(0xFFEFF2EF);
  static const darkSecondary = Color(0xFFA7AEA9);
  static const darkTertiary = Color(0xFF747C77);
  static const darkAccent = Color(0xFF8EBFC1);
  static const darkPrimary = Color(0xFF315456);
  static const darkOnPrimary = Color(0xFFF2F6F4);
}

class _V8Theme {
  static ThemeData build(Brightness brightness, {String? fontFamily}) {
    final dark = brightness == Brightness.dark;
    final canvas = dark ? _V8Colors.darkCanvas : _V8Colors.lightCanvas;
    final text = dark ? _V8Colors.darkText : _V8Colors.lightText;
    final accent = dark ? _V8Colors.darkAccent : _V8Colors.lightAccent;

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
        secondary:
            dark ? _V8Colors.darkSecondary : _V8Colors.lightSecondary,
        onSecondary: canvas,
        error: dark ? const Color(0xFFE9A7AC) : const Color(0xFF9C424A),
        onError: canvas,
        surface: canvas,
        onSurface: text,
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 22,
          height: 26 / 22,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.22,
          color: text,
        ),
        titleLarge: TextStyle(
          fontSize: 17,
          height: 21 / 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.08,
          color: text,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          height: 19 / 15,
          fontWeight: FontWeight.w600,
          color: text,
        ),
        bodyLarge: TextStyle(
          fontSize: 13,
          height: 18 / 13,
          fontWeight: FontWeight.w400,
          color: text,
        ),
        bodyMedium: TextStyle(
          fontSize: 10.5,
          height: 16 / 11.5,
          fontWeight: FontWeight.w400,
          color: text,
        ),
        labelLarge: TextStyle(
          fontSize: 13,
          height: 17 / 13,
          fontWeight: FontWeight.w600,
          color: text,
        ),
      ),
    );
  }
}

extension _V8Context on BuildContext {
  bool get v8Dark => Theme.of(this).brightness == Brightness.dark;
  Color get v8Surface =>
      v8Dark ? _V8Colors.darkSurface : _V8Colors.lightSurface;
  Color get v8Elevated =>
      v8Dark ? _V8Colors.darkElevated : _V8Colors.lightElevated;
  Color get v8Text => v8Dark ? _V8Colors.darkText : _V8Colors.lightText;
  Color get v8Secondary =>
      v8Dark ? _V8Colors.darkSecondary : _V8Colors.lightSecondary;
  Color get v8Tertiary =>
      v8Dark ? _V8Colors.darkTertiary : _V8Colors.lightTertiary;
  Color get v8Accent =>
      v8Dark ? _V8Colors.darkAccent : _V8Colors.lightAccent;
  Color get v8Primary =>
      v8Dark ? _V8Colors.darkPrimary : _V8Colors.lightPrimary;
  Color get v8OnPrimary =>
      v8Dark ? _V8Colors.darkOnPrimary : _V8Colors.lightOnPrimary;
}

class HomeV08 extends StatefulWidget {
  const HomeV08({super.key});

  @override
  State<HomeV08> createState() => _HomeV08State();
}

class _HomeV08State extends State<HomeV08> {
  String activity = '28D';

  bool _largeText(BuildContext context) =>
      MediaQuery.textScalerOf(context).scale(13) >= 20;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final fontFamily = Theme.of(context).textTheme.bodyLarge?.fontFamily;

    return Theme(
      data: _V8Theme.build(brightness, fontFamily: fontFamily),
      child: PreviewPage(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 44),
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _V8Header(),
              const SizedBox(height: 10),
              const _V8Actions(),
              const SizedBox(height: 8),
              const _V8Search(),
              const SizedBox(height: 26),
              _currentPeriod(context),
              const SizedBox(height: 27),
              const _V8SectionHeader(
                title: 'Recent Flights',
                action: 'View all',
              ),
              const SizedBox(height: 2),
              const _V8FlightRow(
                rowId: 'r1',
                date: 'Sep 02',
                flight: '7C132',
                dep: 'GMP',
                arr: 'CJU',
                duration: '1+12',
              ),
              const _V8FlightRow(
                rowId: 'r2',
                date: 'Aug 31',
                flight: '7C1123',
                dep: 'CJU',
                arr: 'GMP',
                duration: '1+08',
              ),
              const _V8FlightRow(
                rowId: 'r3',
                date: 'Aug 29',
                flight: 'KE28',
                dep: 'GMP',
                arr: 'CJU',
                duration: '1+10',
              ),
              const SizedBox(height: 23),
              _activity(context),
              const SizedBox(height: 27),
              const _V8Totals(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentPeriod(BuildContext context) {
    final title = Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'September',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextSpan(
            text: '  2026',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.v8Secondary,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      ),
      softWrap: true,
    );

    const nav = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _V8BareIcon(
          icon: Icons.chevron_left_rounded,
          semanticLabel: 'Previous month',
        ),
        _V8BareIcon(
          icon: Icons.chevron_right_rounded,
          semanticLabel: 'Next month',
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_largeText(context))
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(height: 4),
              nav,
            ],
          )
        else
          Row(
            children: [
              Expanded(child: title),
              nav,
            ],
          ),
        const SizedBox(height: 13),
        const _V8MetricGroup(
          metrics: [
            _V8Metric(label: 'This month', value: '42+15'),
            _V8Metric(label: 'This year', value: '318+40'),
          ],
          valueSize: 20,
        ),
      ],
    );
  }

  Widget _activity(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _V8SectionHeader(title: 'Activity', action: 'Details'),
          const SizedBox(height: 7),
          _V8PeriodSelector(
            selected: activity,
            onChanged: (value) => setState(() => activity = value),
          ),
          const SizedBox(height: 13),
          const _V8MetricGroup(
            metrics: [
              _V8Metric(label: 'Legs', value: '24'),
              _V8Metric(label: 'Block', value: '38+45'),
              _V8Metric(label: 'TO/LD', value: '24/24'),
            ],
            valueSize: 17,
          ),
        ],
      );
}

class _V8Header extends StatelessWidget {
  const _V8Header();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 44,
        child: Row(
          children: [
            Text(
              'LogMate',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            const _V8BareIcon(
              icon: Icons.settings_outlined,
              semanticLabel: 'Settings',
            ),
          ],
        ),
      );
}

class _V8BareIcon extends StatelessWidget {
  const _V8BareIcon({
    required this.icon,
    required this.semanticLabel,
  });

  final IconData icon;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: semanticLabel,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 44,
            height: 44,
            child: Icon(
              icon,
              size: 19,
              color: context.v8Secondary,
            ),
          ),
        ),
      );
}

class _V8Actions extends StatelessWidget {
  const _V8Actions();

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _V8PrimaryAction(),
          SizedBox(height: 6),
          _V8SecondaryAction(),
        ],
      );
    }

    return const Row(
      children: [
        Expanded(flex: 11, child: _V8PrimaryAction()),
        SizedBox(width: 8),
        Expanded(flex: 9, child: _V8SecondaryAction()),
      ],
    );
  }
}

class _V8PrimaryAction extends StatelessWidget {
  const _V8PrimaryAction();

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: 'Add Flight',
        child: Material(
          color: context.v8Primary,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_rounded,
                      size: 18,
                      color: context.v8OnPrimary,
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        'Add Flight',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: context.v8OnPrimary,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _V8SecondaryAction extends StatelessWidget {
  const _V8SecondaryAction();

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: 'View Logbook',
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'View Logbook',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 16,
                    color: context.v8Secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _V8Search extends StatefulWidget {
  const _V8Search();

  @override
  State<_V8Search> createState() => _V8SearchState();
}

class _V8SearchState extends State<_V8Search> {
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 140),
      decoration: BoxDecoration(
        color: active ? context.v8Elevated : context.v8Surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: active
            ? [
                BoxShadow(
                  color: context.v8Accent.withValues(alpha: 0.07),
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                ),
              ]
            : const [],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 46),
        child: TextField(
          focusNode: focusNode,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 18,
              color: active ? context.v8Accent : context.v8Secondary,
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 40, minHeight: 46),
            hintText: 'Flights, airports, crew',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.v8Secondary,
                ),
            contentPadding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
          ),
        ),
      ),
    );
  }
}

class _V8SectionHeader extends StatelessWidget {
  const _V8SectionHeader({
    required this.title,
    this.action,
  });

  final String title;
  final String? action;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;
    final heading = Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );

    if (action == null) return heading;

    if (largeText) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading,
          _V8TextAction(label: action!),
        ],
      );
    }

    return SizedBox(
      height: 36,
      child: Row(
        children: [
          Expanded(child: heading),
          _V8TextAction(label: action!),
        ],
      ),
    );
  }
}

class _V8TextAction extends StatelessWidget {
  const _V8TextAction({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 36),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Center(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.v8Accent,
                      ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _V8FlightRow extends StatelessWidget {
  const _V8FlightRow({
    required this.rowId,
    required this.date,
    required this.flight,
    required this.dep,
    required this.arr,
    required this.duration,
  });

  final String rowId;
  final String date;
  final String flight;
  final String dep;
  final String arr;
  final String duration;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _V8FlightMeta(
              rowId: rowId,
              date: date,
              flight: flight,
            ),
            const SizedBox(height: 2),
            if (largeText) ...[
              _V8StableRoute(
                rowId: rowId,
                dep: dep,
                arr: arr,
              ),
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerRight,
                child: _V8Duration(duration),
              ),
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _V8StableRoute(
                    rowId: rowId,
                    dep: dep,
                    arr: arr,
                  ),
                  const Spacer(),
                  _V8Duration(duration),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _V8FlightMeta extends StatelessWidget {
  const _V8FlightMeta({
    required this.rowId,
    required this.date,
    required this.flight,
  });

  final String rowId;
  final String date;
  final String flight;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(11.5) / 11.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 42 * scale,
          child: Text(
            date,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.v8Tertiary,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ),
        const SizedBox(width: 6),
        _V8GlyphRun(
          value: flight,
          keyPrefix: 'flight-$rowId',
          fontSize: 11.5,
          baseCellWidth: 7.4,
          color: context.v8Tertiary,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}

class _V8StableRoute extends StatelessWidget {
  const _V8StableRoute({
    required this.rowId,
    required this.dep,
    required this.arr,
  });

  final String rowId;
  final String dep;
  final String arr;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(15.5) / 15.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          key: ValueKey('route-dep-$rowId'),
          width: 42 * scale,
          child: Center(
            child: _V8GlyphRun(
              value: dep,
              keyPrefix: 'route-dep-$rowId-char',
              fontSize: 15.5,
              baseCellWidth: 13,
              color: context.v8Text,
              weight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          key: ValueKey('route-arrow-$rowId'),
          width: 22 * scale,
          child: Center(
            child: Text(
              '→',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: context.v8Secondary,
                  ),
            ),
          ),
        ),
        SizedBox(
          key: ValueKey('route-arr-$rowId'),
          width: 42 * scale,
          child: Center(
            child: _V8GlyphRun(
              value: arr,
              keyPrefix: 'route-arr-$rowId-char',
              fontSize: 15.5,
              baseCellWidth: 13,
              color: context.v8Text,
              weight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _V8GlyphRun extends StatelessWidget {
  const _V8GlyphRun({
    required this.value,
    required this.keyPrefix,
    required this.fontSize,
    required this.baseCellWidth,
    required this.color,
    required this.weight,
  });

  final String value;
  final String keyPrefix;
  final double fontSize;
  final double baseCellWidth;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(fontSize) / fontSize;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < value.length; i++)
          SizedBox(
            key: ValueKey('$keyPrefix-$i'),
            width: baseCellWidth * scale,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  height: 1.15,
                  fontWeight: weight,
                  color: color,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _V8Duration extends StatelessWidget {
  const _V8Duration(this.value);
  final String value;

  @override
  Widget build(BuildContext context) => Text(
        value,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 15.5,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
      );
}

class _V8Metric {
  const _V8Metric({required this.label, required this.value});
  final String label;
  final String value;
}

class _V8MetricGroup extends StatelessWidget {
  const _V8MetricGroup({
    required this.metrics,
    required this.valueSize,
  });

  final List<_V8Metric> metrics;
  final double valueSize;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return Column(
        children: [
          for (var i = 0; i < metrics.length; i++) ...[
            _V8MetricRow(metric: metrics[i], valueSize: valueSize),
            if (i != metrics.length - 1) const SizedBox(height: 9),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < metrics.length; i++) ...[
          Expanded(
            child: _V8MetricDatum(
              metric: metrics[i],
              valueSize: valueSize,
            ),
          ),
          if (i != metrics.length - 1) const SizedBox(width: 20),
        ],
      ],
    );
  }
}

class _V8MetricDatum extends StatelessWidget {
  const _V8MetricDatum({
    required this.metric,
    required this.valueSize,
  });

  final _V8Metric metric;
  final double valueSize;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            metric.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.v8Secondary,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            metric.value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: valueSize,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      );
}

class _V8MetricRow extends StatelessWidget {
  const _V8MetricRow({
    required this.metric,
    required this.valueSize,
  });

  final _V8Metric metric;
  final double valueSize;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(
              metric.label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: context.v8Secondary,
                  ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            metric.value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: valueSize,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      );
}

class _V8PeriodSelector extends StatelessWidget {
  const _V8PeriodSelector({
    required this.selected,
    required this.onChanged,
  });

  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;
    const values = ['7D', '28D', '90D', 'Custom'];

    if (largeText) {
      return Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          for (final value in values)
            _V8PeriodCell(
              value: value,
              selected: selected == value,
              onTap: () => onChanged(value),
            ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _V8PeriodCell(
          value: '7D',
          width: 52,
          selected: selected == '7D',
          onTap: () => onChanged('7D'),
        ),
        const SizedBox(width: 4),
        _V8PeriodCell(
          value: '28D',
          width: 56,
          selected: selected == '28D',
          onTap: () => onChanged('28D'),
        ),
        const SizedBox(width: 4),
        _V8PeriodCell(
          value: '90D',
          width: 56,
          selected: selected == '90D',
          onTap: () => onChanged('90D'),
        ),
        const SizedBox(width: 4),
        _V8PeriodCell(
          value: 'Custom',
          width: 72,
          selected: selected == 'Custom',
          onTap: () => onChanged('Custom'),
        ),
      ],
    );
  }
}

class _V8PeriodCell extends StatelessWidget {
  const _V8PeriodCell({
    required this.value,
    required this.selected,
    required this.onTap,
    this.width,
  });

  final String value;
  final bool selected;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final content = Semantics(
      button: true,
      selected: selected,
      label: value,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 130),
          constraints: const BoxConstraints(minHeight: 40, minWidth: 48),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? context.v8Surface : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: selected ? context.v8Text : context.v8Secondary,
                    fontWeight:
                        selected ? FontWeight.w600 : FontWeight.w400,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
            ),
          ),
        ),
      ),
    );

    if (width == null) return content;
    return SizedBox(width: width, child: content);
  }
}

class _V8Totals extends StatelessWidget {
  const _V8Totals();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _V8SectionHeader(title: 'Totals'),
          SizedBox(height: 7),
          _V8MetricGroup(
            metrics: [
              _V8Metric(label: 'Block', value: '6,842+35'),
              _V8Metric(label: 'Night', value: '812+20'),
            ],
            valueSize: 17,
          ),
          SizedBox(height: 13),
          _V8MetricGroup(
            metrics: [
              _V8Metric(
                label: 'Instrument Flight Time',
                value: '428+15',
              ),
            ],
            valueSize: 17,
          ),
          SizedBox(height: 7),
          Wrap(
            spacing: 14,
            children: [
              _V8TextAction(label: 'Customize'),
              _V8TextAction(label: 'Details'),
            ],
          ),
        ],
      );
}
