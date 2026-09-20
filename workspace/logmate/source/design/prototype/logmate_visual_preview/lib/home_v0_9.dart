import 'package:flutter/material.dart';

import 'primitives.dart';

const _dataReviewFamily = 'PreviewData';

abstract final class _V9Colors {
  static const lightCanvas = Color(0xFFF9FAF7);
  static const lightSurface = Color(0xFFF0F2EF);
  static const lightElevated = Color(0xFFFFFFFF);
  static const lightText = Color(0xFF151817);
  static const lightSecondary = Color(0xFF68706C);
  static const lightTertiary = Color(0xFF7D8580);
  static const lightAccent = Color(0xFF356C70);
  static const lightPrimary = Color(0xFF1C2928);
  static const lightOnPrimary = Color(0xFFF7FAF8);

  static const darkCanvas = Color(0xFF101311);
  static const darkSurface = Color(0xFF1A1F1C);
  static const darkElevated = Color(0xFF222824);
  static const darkText = Color(0xFFF0F2EF);
  static const darkSecondary = Color(0xFFA7AEA9);
  static const darkTertiary = Color(0xFF848C87);
  static const darkAccent = Color(0xFF8EBFC1);
  static const darkPrimary = Color(0xFF315456);
  static const darkOnPrimary = Color(0xFFF1F5F3);
}

class _V9Theme {
  static ThemeData build(Brightness brightness, {String? fontFamily}) {
    final dark = brightness == Brightness.dark;
    final canvas = dark ? _V9Colors.darkCanvas : _V9Colors.lightCanvas;
    final text = dark ? _V9Colors.darkText : _V9Colors.lightText;
    final secondary =
        dark ? _V9Colors.darkSecondary : _V9Colors.lightSecondary;
    final accent = dark ? _V9Colors.darkAccent : _V9Colors.lightAccent;

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
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 22,
          height: 26 / 22,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          color: text,
        ),
        titleLarge: TextStyle(
          fontSize: 17,
          height: 21 / 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.06,
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
          fontSize: 11.5,
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

extension _V9Context on BuildContext {
  bool get v9Dark => Theme.of(this).brightness == Brightness.dark;
  Color get v9Surface =>
      v9Dark ? _V9Colors.darkSurface : _V9Colors.lightSurface;
  Color get v9Elevated =>
      v9Dark ? _V9Colors.darkElevated : _V9Colors.lightElevated;
  Color get v9Text => v9Dark ? _V9Colors.darkText : _V9Colors.lightText;
  Color get v9Secondary =>
      v9Dark ? _V9Colors.darkSecondary : _V9Colors.lightSecondary;
  Color get v9Tertiary =>
      v9Dark ? _V9Colors.darkTertiary : _V9Colors.lightTertiary;
  Color get v9Accent =>
      v9Dark ? _V9Colors.darkAccent : _V9Colors.lightAccent;
  Color get v9Primary =>
      v9Dark ? _V9Colors.darkPrimary : _V9Colors.lightPrimary;
  Color get v9OnPrimary =>
      v9Dark ? _V9Colors.darkOnPrimary : _V9Colors.lightOnPrimary;
}

class HomeV09 extends StatefulWidget {
  const HomeV09({super.key});

  @override
  State<HomeV09> createState() => _HomeV09State();
}

class _HomeV09State extends State<HomeV09> {
  String activity = '28D';

  bool _largeText(BuildContext context) =>
      MediaQuery.textScalerOf(context).scale(13) >= 20;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final fontFamily = Theme.of(context).textTheme.bodyLarge?.fontFamily;

    return Theme(
      data: _V9Theme.build(brightness, fontFamily: fontFamily),
      child: PreviewPage(
        padding: const EdgeInsets.fromLTRB(24, 14, 24, 36),
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _V9Header(),
              const SizedBox(height: 8),
              const _V9Actions(),
              const SizedBox(height: 8),
              const _V9Search(),
              const SizedBox(height: 23),
              _currentPeriod(context),
              const SizedBox(height: 22),
              const _V9SectionHeader(
                title: 'Recent Flights',
                action: 'View all',
              ),
              const SizedBox(height: 1),
              const _V9FlightRow(
                rowId: 'r1',
                date: 'Sep 02',
                flight: '7C132',
                dep: 'GMP',
                arr: 'CJU',
                duration: '1+12',
              ),
              const _V9FlightRow(
                rowId: 'r2',
                date: 'Aug 31',
                flight: '7C1123',
                dep: 'CJU',
                arr: 'GMP',
                duration: '1+08',
              ),
              const _V9FlightRow(
                rowId: 'r3',
                date: 'Aug 29',
                flight: 'KE28',
                dep: 'GMP',
                arr: 'CJU',
                duration: '1+10',
              ),
              const SizedBox(height: 22),
              _activity(context),
              const SizedBox(height: 22),
              const _V9Totals(),
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
                  color: context.v9Secondary,
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
        _V9IconButton(
          icon: Icons.chevron_left_rounded,
          semanticLabel: 'Previous month',
        ),
        _V9IconButton(
          icon: Icons.chevron_right_rounded,
          semanticLabel: 'Next month',
        ),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_largeText(context))
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(height: 3),
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
        const SizedBox(height: 11),
        const _V9MetricGrid(
          key: ValueKey('current-grid'),
          metrics: [
            _V9Metric(label: 'This month', value: '42+15'),
            _V9Metric(label: 'This year', value: '318+40'),
          ],
          valueSize: 20,
        ),
      ],
    );
  }

  Widget _activity(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _V9SectionHeader(title: 'Activity', action: 'Details'),
          const SizedBox(height: 6),
          _V9PeriodSelector(
            selected: activity,
            onChanged: (value) => setState(() => activity = value),
          ),
          const SizedBox(height: 11),
          const _V9MetricGrid(
            key: ValueKey('activity-grid'),
            metrics: [
              _V9Metric(label: 'Legs', value: '24'),
              _V9Metric(label: 'Block', value: '38+45'),
              _V9Metric(label: 'TO/LD', value: '24/24'),
            ],
            valueSize: 17,
          ),
        ],
      );
}

class _V9Header extends StatelessWidget {
  const _V9Header();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 44,
        child: Row(
          children: [
            Text('LogMate', style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            const _V9IconButton(
              icon: Icons.settings_outlined,
              semanticLabel: 'Settings',
            ),
          ],
        ),
      );
}

class _V9IconButton extends StatelessWidget {
  const _V9IconButton({
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
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(
              icon,
              size: 18,
              color: context.v9Secondary,
            ),
          ),
        ),
      );
}

class _V9Actions extends StatelessWidget {
  const _V9Actions();

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _V9PrimaryAction(),
          SizedBox(height: 6),
          _V9SecondaryAction(),
        ],
      );
    }

    return const Row(
      children: [
        Expanded(child: _V9PrimaryAction()),
        SizedBox(width: 8),
        Expanded(child: _V9SecondaryAction()),
      ],
    );
  }
}

class _V9PrimaryAction extends StatelessWidget {
  const _V9PrimaryAction();

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: 'Add Flight',
        child: Material(
          color: context.v9Primary,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_rounded,
                      size: 18,
                      color: context.v9OnPrimary,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Add Flight',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: context.v9OnPrimary,
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

class _V9SecondaryAction extends StatelessWidget {
  const _V9SecondaryAction();

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: 'View Logbook',
        child: Material(
          color: context.v9Surface,
          borderRadius: BorderRadius.circular(12),
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
                      color: context.v9Secondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _V9Search extends StatefulWidget {
  const _V9Search();

  @override
  State<_V9Search> createState() => _V9SearchState();
}

class _V9SearchState extends State<_V9Search> {
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
        color: active ? context.v9Elevated : context.v9Surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: active
            ? [
                BoxShadow(
                  color: context.v9Accent.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ]
            : const [],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 44),
        child: TextField(
          focusNode: focusNode,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 18,
              color: active ? context.v9Accent : context.v9Secondary,
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 40, minHeight: 44),
            hintText: 'Flights, airports, crew',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.v9Secondary,
                ),
            contentPadding: const EdgeInsets.fromLTRB(0, 11, 12, 11),
          ),
        ),
      ),
    );
  }
}

class _V9SectionHeader extends StatelessWidget {
  const _V9SectionHeader({
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
          _V9TextAction(label: action!),
        ],
      );
    }

    return SizedBox(
      height: 34,
      child: Row(
        children: [
          Expanded(child: heading),
          _V9TextAction(label: action!),
        ],
      ),
    );
  }
}

class _V9TextAction extends StatelessWidget {
  const _V9TextAction({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 34),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Center(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.v9Accent,
                      ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _V9FlightRow extends StatelessWidget {
  const _V9FlightRow({
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
      borderRadius: BorderRadius.circular(9),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _V9FlightMeta(
              rowId: rowId,
              date: date,
              flight: flight,
            ),
            const SizedBox(height: 2),
            if (largeText)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _V9StableRoute(rowId: rowId, dep: dep, arr: arr),
                  const SizedBox(height: 1),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _V9Duration(duration),
                  ),
                ],
              )
            else
              Row(
                children: [
                  _V9StableRoute(rowId: rowId, dep: dep, arr: arr),
                  const Spacer(),
                  _V9Duration(duration),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _V9FlightMeta extends StatelessWidget {
  const _V9FlightMeta({
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
      children: [
        SizedBox(
          width: 46 * scale,
          child: Text(
            date,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.v9Tertiary,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ),
        SizedBox(width: 6 * scale),
        SizedBox(
          key: ValueKey('flight-slot-$rowId'),
          width: 58 * scale,
          child: Text(
            flight,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontFamily: _dataReviewFamily,
              fontFamilyFallback: const ['Roboto Mono', 'monospace'],
              fontSize: 11.5,
              height: 16 / 11.5,
              fontWeight: FontWeight.w400,
              color: context.v9Tertiary,
            ),
          ),
        ),
      ],
    );
  }
}

class _V9StableRoute extends StatelessWidget {
  const _V9StableRoute({
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
    final style = TextStyle(
      fontFamily: _dataReviewFamily,
      fontFamilyFallback: const ['Roboto Mono', 'monospace'],
      fontSize: 15.5,
      height: 19 / 15.5,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: context.v9Text,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          key: ValueKey('route-dep-$rowId'),
          width: 42 * scale,
          child: Text(dep, textAlign: TextAlign.center, style: style),
        ),
        SizedBox(
          key: ValueKey('route-arrow-$rowId'),
          width: 22 * scale,
          child: Center(
            child: Text(
              '→',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 13,
                    color: context.v9Secondary,
                  ),
            ),
          ),
        ),
        SizedBox(
          key: ValueKey('route-arr-$rowId'),
          width: 42 * scale,
          child: Text(arr, textAlign: TextAlign.center, style: style),
        ),
      ],
    );
  }
}

class _V9Duration extends StatelessWidget {
  const _V9Duration(this.value);
  final String value;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(15.5) / 15.5;

    return SizedBox(
      width: 48 * scale,
      child: Text(
        value,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 15.5,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
      ),
    );
  }
}

class _V9Metric {
  const _V9Metric({required this.label, required this.value});
  final String label;
  final String value;
}

class _V9MetricGrid extends StatelessWidget {
  const _V9MetricGrid({
    super.key,
    required this.metrics,
    required this.valueSize,
    this.fixedLabelHeight = false,
  });

  final List<_V9Metric> metrics;
  final double valueSize;
  final bool fixedLabelHeight;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return Column(
        children: [
          for (var i = 0; i < metrics.length; i++) ...[
            _V9MetricRow(metric: metrics[i], valueSize: valueSize),
            if (i != metrics.length - 1) const SizedBox(height: 8),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < metrics.length; i++) ...[
          Expanded(
            child: _V9MetricDatum(
              key: ValueKey('metric-${metrics[i].label}'),
              metric: metrics[i],
              valueSize: valueSize,
              fixedLabelHeight: fixedLabelHeight,
            ),
          ),
          if (i != metrics.length - 1) const SizedBox(width: 12),
        ],
      ],
    );
  }
}

class _V9MetricDatum extends StatelessWidget {
  const _V9MetricDatum({
    super.key,
    required this.metric,
    required this.valueSize,
    required this.fixedLabelHeight,
  });

  final _V9Metric metric;
  final double valueSize;
  final bool fixedLabelHeight;

  @override
  Widget build(BuildContext context) {
    final label = Text(
      metric.label,
      maxLines: fixedLabelHeight ? 2 : 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: context.v9Secondary,
          ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fixedLabelHeight)
          SizedBox(
            height: 32,
            child: Align(
              alignment: Alignment.topLeft,
              child: label,
            ),
          )
        else
          label,
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
}

class _V9MetricRow extends StatelessWidget {
  const _V9MetricRow({
    required this.metric,
    required this.valueSize,
  });

  final _V9Metric metric;
  final double valueSize;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(
              metric.label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: context.v9Secondary,
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

class _V9PeriodSelector extends StatelessWidget {
  const _V9PeriodSelector({
    required this.selected,
    required this.onChanged,
  });

  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    const values = ['7D', '28D', '90D', 'Custom'];
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return Wrap(
        key: const ValueKey('activity-selector'),
        spacing: 6,
        runSpacing: 6,
        children: [
          for (final value in values)
            _V9PeriodCell(
              key: ValueKey('activity-segment-$value'),
              value: value,
              selected: selected == value,
              onTap: () => onChanged(value),
              largeText: true,
            ),
        ],
      );
    }

    return SizedBox(
      key: const ValueKey('activity-selector'),
      height: 42,
      child: Row(
        children: [
          for (var i = 0; i < values.length; i++) ...[
            Expanded(
              child: _V9PeriodCell(
                key: ValueKey('activity-segment-${values[i]}'),
                value: values[i],
                selected: selected == values[i],
                onTap: () => onChanged(values[i]),
              ),
            ),
            if (i != values.length - 1) const SizedBox(width: 4),
          ],
        ],
      ),
    );
  }
}

class _V9PeriodCell extends StatelessWidget {
  const _V9PeriodCell({
    super.key,
    required this.value,
    required this.selected,
    required this.onTap,
    this.largeText = false,
  });

  final String value;
  final bool selected;
  final VoidCallback onTap;
  final bool largeText;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        selected: selected,
        label: value,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 130),
            constraints: BoxConstraints(
              minHeight: 42,
              minWidth: largeText ? 72 : 0,
            ),
            padding: largeText
                ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: selected ? context.v9Surface : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color:
                          selected ? context.v9Text : context.v9Secondary,
                      fontWeight:
                          selected ? FontWeight.w600 : FontWeight.w400,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
              ),
            ),
          ),
        ),
      );
}

class _V9Totals extends StatelessWidget {
  const _V9Totals();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _V9SectionHeader(title: 'Totals'),
          SizedBox(height: 6),
          _V9MetricGrid(
            key: ValueKey('totals-grid'),
            fixedLabelHeight: true,
            metrics: [
              _V9Metric(label: 'Block', value: '6,842+35'),
              _V9Metric(label: 'Night', value: '812+20'),
              _V9Metric(label: 'Instrument Flight Time', value: '428+15'),
            ],
            valueSize: 16.5,
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _V9TextAction(label: 'Customize'),
              SizedBox(width: 12),
              _V9TextAction(label: 'Details'),
            ],
          ),
        ],
      );
}
