import 'package:flutter/material.dart';

import 'primitives.dart';

abstract final class _ModernColors {
  static const lightCanvas = Color(0xFFF7F8F6);
  static const lightSurface = Color(0xFFEEF1EE);
  static const lightElevated = Color(0xFFFFFFFF);
  static const lightText = Color(0xFF151817);
  static const lightSecondary = Color(0xFF69706D);
  static const lightTertiary = Color(0xFF929895);
  static const lightAccent = Color(0xFF2D6D70);
  static const lightPrimary = Color(0xFF1D2B2B);
  static const lightOnPrimary = Color(0xFFF7FAF8);

  static const darkCanvas = Color(0xFF0E1110);
  static const darkSurface = Color(0xFF171B19);
  static const darkElevated = Color(0xFF202522);
  static const darkText = Color(0xFFF1F4F1);
  static const darkSecondary = Color(0xFFA5ACA8);
  static const darkTertiary = Color(0xFF777E7A);
  static const darkAccent = Color(0xFF91C7C7);
  static const darkPrimary = Color(0xFF315456);
  static const darkOnPrimary = Color(0xFFF0F5F3);
}

class _ModernTheme {
  static ThemeData forBrightness(
    Brightness brightness, {
    String? fontFamily,
  }) {
    final dark = brightness == Brightness.dark;
    final canvas =
        dark ? _ModernColors.darkCanvas : _ModernColors.lightCanvas;
    final text = dark ? _ModernColors.darkText : _ModernColors.lightText;
    final secondary =
        dark ? _ModernColors.darkSecondary : _ModernColors.lightSecondary;
    final accent =
        dark ? _ModernColors.darkAccent : _ModernColors.lightAccent;

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
          fontSize: 24,
          height: 28 / 24,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.35,
          color: text,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          height: 22 / 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.15,
          color: text,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          height: 20 / 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.05,
          color: text,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w400,
          color: text,
        ),
        bodyMedium: TextStyle(
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w400,
          color: text,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          height: 18 / 14,
          fontWeight: FontWeight.w600,
          color: text,
        ),
      ),
    );
  }
}

extension _ModernContext on BuildContext {
  bool get modernDark => Theme.of(this).brightness == Brightness.dark;
  Color get modernSurface =>
      modernDark ? _ModernColors.darkSurface : _ModernColors.lightSurface;
  Color get modernElevated =>
      modernDark ? _ModernColors.darkElevated : _ModernColors.lightElevated;
  Color get modernText =>
      modernDark ? _ModernColors.darkText : _ModernColors.lightText;
  Color get modernSecondary => modernDark
      ? _ModernColors.darkSecondary
      : _ModernColors.lightSecondary;
  Color get modernTertiary =>
      modernDark ? _ModernColors.darkTertiary : _ModernColors.lightTertiary;
  Color get modernAccent =>
      modernDark ? _ModernColors.darkAccent : _ModernColors.lightAccent;
  Color get modernPrimary =>
      modernDark ? _ModernColors.darkPrimary : _ModernColors.lightPrimary;
  Color get modernOnPrimary => modernDark
      ? _ModernColors.darkOnPrimary
      : _ModernColors.lightOnPrimary;
}

class HomeV07 extends StatefulWidget {
  const HomeV07({super.key});

  @override
  State<HomeV07> createState() => _HomeV07State();
}

class _HomeV07State extends State<HomeV07> {
  String activity = '28D';

  bool _largeText(BuildContext context) =>
      MediaQuery.textScalerOf(context).scale(15) >= 22;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final inheritedFontFamily =
        Theme.of(context).textTheme.bodyLarge?.fontFamily;

    return Theme(
      data: _ModernTheme.forBrightness(
        brightness,
        fontFamily: inheritedFontFamily,
      ),
      child: PreviewPage(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 44),
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              const SizedBox(height: 14),
              const _ModernActionRow(),
              const SizedBox(height: 10),
              const _ModernSearch(),
              const SizedBox(height: 28),
              _currentPeriod(context),
              const SizedBox(height: 30),
              const _ModernSectionHeader(
                title: 'Recent Flights',
                action: 'View all',
              ),
              const SizedBox(height: 4),
              const _ModernFlightRow(
                date: 'Sep 02',
                flight: '7C132',
                route: 'GMP → CJU',
                duration: '1+12',
              ),
              const _ModernFlightRow(
                date: 'Aug 31',
                flight: '7C1123',
                route: 'CJU → GMP',
                duration: '1+08',
              ),
              const _ModernFlightRow(
                date: 'Aug 29',
                flight: 'KE28',
                route: 'GMP → CJU',
                duration: '1+10',
              ),
              const SizedBox(height: 26),
              _activity(context),
              const SizedBox(height: 30),
              const _ModernTotals(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final title = Text(
      'LogMate',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 18,
            letterSpacing: -0.15,
          ),
    );

    if (_largeText(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title,
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,
            child: _ModernIconButton(
              icon: Icons.settings_rounded,
              semanticLabel: 'Settings',
            ),
          ),
        ],
      );
    }

    return SizedBox(
      height: 44,
      child: Row(
        children: [
          title,
          const Spacer(),
          const _ModernIconButton(
            icon: Icons.settings_rounded,
            semanticLabel: 'Settings',
          ),
        ],
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
                  color: context.modernSecondary,
                  fontWeight: FontWeight.w400,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      ),
      softWrap: true,
    );

    const navigation = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ModernIconButton(
          icon: Icons.chevron_left_rounded,
          semanticLabel: 'Previous month',
          small: true,
        ),
        SizedBox(width: 6),
        _ModernIconButton(
          icon: Icons.chevron_right_rounded,
          semanticLabel: 'Next month',
          small: true,
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
              const SizedBox(height: 8),
              navigation,
            ],
          )
        else
          Row(
            children: [
              Expanded(child: title),
              const SizedBox(width: 12),
              navigation,
            ],
          ),
        const SizedBox(height: 16),
        const _ModernMetricGroup(
          metrics: [
            _Metric(label: 'This month', value: '42+15'),
            _Metric(label: 'This year', value: '318+40'),
          ],
          valueSize: 22,
        ),
      ],
    );
  }

  Widget _activity(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ModernSectionHeader(title: 'Activity', action: 'Details'),
          const SizedBox(height: 10),
          _ModernPeriodSelector(
            selected: activity,
            onChanged: (value) => setState(() => activity = value),
          ),
          const SizedBox(height: 16),
          const _ModernMetricGroup(
            metrics: [
              _Metric(label: 'Legs', value: '24'),
              _Metric(label: 'Block', value: '38+45'),
              _Metric(label: 'TO/LD', value: '24/24'),
            ],
            valueSize: 18,
          ),
        ],
      );
}

class _ModernIconButton extends StatelessWidget {
  const _ModernIconButton({
    required this.icon,
    required this.semanticLabel,
    this.small = false,
  });

  final IconData icon;
  final String semanticLabel;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final visualSize = small ? 34.0 : 40.0;
    return Semantics(
      button: true,
      label: semanticLabel,
      child: SizedBox(
        width: 44,
        height: 44,
        child: Center(
          child: Material(
            color: context.modernSurface,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: SizedBox(
                width: visualSize,
                height: visualSize,
                child: Icon(
                  icon,
                  size: small ? 18 : 19,
                  color: context.modernSecondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ModernActionRow extends StatelessWidget {
  const _ModernActionRow();

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (largeText || constraints.maxWidth < 330) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _ModernPrimaryAction(),
              SizedBox(height: 8),
              _ModernSecondaryAction(),
            ],
          );
        }

        return const Row(
          children: [
            Expanded(child: _ModernPrimaryAction()),
            SizedBox(width: 10),
            Expanded(child: _ModernSecondaryAction()),
          ],
        );
      },
    );
  }
}

class _ModernPrimaryAction extends StatelessWidget {
  const _ModernPrimaryAction();

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: 'Add Flight',
        child: Material(
          color: context.modernPrimary,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(14),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_rounded,
                      size: 20,
                      color: context.modernOnPrimary,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Add Flight',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: context.modernOnPrimary,
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

class _ModernSecondaryAction extends StatelessWidget {
  const _ModernSecondaryAction();

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: 'View Logbook',
        child: Material(
          color: context.modernSurface,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(14),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    const SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                      color: context.modernSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _ModernSearch extends StatefulWidget {
  const _ModernSearch();

  @override
  State<_ModernSearch> createState() => _ModernSearchState();
}

class _ModernSearchState extends State<_ModernSearch> {
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
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        color: active ? context.modernElevated : context.modernSurface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: active
            ? [
                BoxShadow(
                  color: context.modernAccent.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 5),
                ),
              ]
            : const [],
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48),
        child: TextField(
          focusNode: focusNode,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 20,
              color:
                  active ? context.modernAccent : context.modernSecondary,
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 42, minHeight: 48),
            hintText: 'Flights, airports, crew',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.modernSecondary,
                ),
            contentPadding: const EdgeInsets.fromLTRB(0, 13, 14, 13),
          ),
        ),
      ),
    );
  }
}

class _ModernSectionHeader extends StatelessWidget {
  const _ModernSectionHeader({
    required this.title,
    this.action,
  });

  final String title;
  final String? action;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
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
          _ModernTextAction(label: action!),
        ],
      );
    }

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(child: heading),
          const SizedBox(width: 12),
          _ModernTextAction(label: action!),
        ],
      ),
    );
  }
}

class _ModernTextAction extends StatelessWidget {
  const _ModernTextAction({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Center(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.modernAccent,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
          ),
        ),
      );
}

class _Metric {
  const _Metric({required this.label, required this.value});
  final String label;
  final String value;
}

class _ModernMetricGroup extends StatelessWidget {
  const _ModernMetricGroup({
    required this.metrics,
    required this.valueSize,
  });

  final List<_Metric> metrics;
  final double valueSize;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;

    if (largeText) {
      return Column(
        children: [
          for (var i = 0; i < metrics.length; i++) ...[
            _ModernMetricRow(
              metric: metrics[i],
              valueSize: valueSize,
            ),
            if (i != metrics.length - 1) const SizedBox(height: 12),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < metrics.length; i++) ...[
          Expanded(
            child: _ModernMetricDatum(
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

class _ModernMetricDatum extends StatelessWidget {
  const _ModernMetricDatum({
    required this.metric,
    required this.valueSize,
  });

  final _Metric metric;
  final double valueSize;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            metric.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.modernSecondary,
                ),
          ),
          const SizedBox(height: 3),
          Text(
            metric.value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: valueSize,
                  letterSpacing: -0.35,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      );
}

class _ModernMetricRow extends StatelessWidget {
  const _ModernMetricRow({
    required this.metric,
    required this.valueSize,
  });

  final _Metric metric;
  final double valueSize;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              metric.label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: context.modernSecondary,
                  ),
            ),
          ),
          const SizedBox(width: 14),
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

class _ModernFlightRow extends StatelessWidget {
  const _ModernFlightRow({
    required this.date,
    required this.flight,
    required this.route,
    required this.duration,
  });

  final String date;
  final String flight;
  final String route;
  final String duration;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FlightMeta(date: date, flight: flight),
            const SizedBox(height: 3),
            if (largeText) ...[
              Text(
                route,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 17,
                    ),
              ),
              const SizedBox(height: 3),
              Align(
                alignment: Alignment.centerRight,
                child: _FlightDuration(duration),
              ),
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text(
                      route,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 17,
                          ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  _FlightDuration(duration),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _FlightMeta extends StatelessWidget {
  const _FlightMeta({required this.date, required this.flight});
  final String date;
  final String flight;

  @override
  Widget build(BuildContext context) => Text(
        '$date · $flight',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: context.modernTertiary,
              fontWeight: FontWeight.w400,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
      );
}

class _FlightDuration extends StatelessWidget {
  const _FlightDuration(this.value);
  final String value;

  @override
  Widget build(BuildContext context) => Text(
        value,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 17,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
      );
}

class _ModernPeriodSelector extends StatelessWidget {
  const _ModernPeriodSelector({
    required this.selected,
    required this.onChanged,
  });

  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
    const values = ['7D', '28D', '90D', 'Custom'];

    if (largeText) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final value in values)
            _ModernPeriodCell(
              value: value,
              selected: selected == value,
              onTap: () => onChanged(value),
              standalone: true,
            ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.modernSurface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          for (final value in values)
            Expanded(
              child: _ModernPeriodCell(
                value: value,
                selected: selected == value,
                onTap: () => onChanged(value),
              ),
            ),
        ],
      ),
    );
  }
}

class _ModernPeriodCell extends StatelessWidget {
  const _ModernPeriodCell({
    required this.value,
    required this.selected,
    required this.onTap,
    this.standalone = false,
  });

  final String value;
  final bool selected;
  final VoidCallback onTap;
  final bool standalone;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        selected: selected,
        label: value,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              constraints: const BoxConstraints(minHeight: 40),
              padding: EdgeInsets.symmetric(
                horizontal: standalone ? 16 : 8,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? (context.modernDark
                        ? context.modernElevated
                        : context.modernElevated)
                    : (standalone ? context.modernSurface : Colors.transparent),
                borderRadius: BorderRadius.circular(14),
                boxShadow: selected && !context.modernDark
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : const [],
              ),
              child: Center(
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: selected
                            ? context.modernText
                            : context.modernSecondary,
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

class _ModernTotals extends StatelessWidget {
  const _ModernTotals();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ModernSectionHeader(title: 'Totals'),
          SizedBox(height: 10),
          _ModernMetricGroup(
            metrics: [
              _Metric(label: 'Block', value: '6,842+35'),
              _Metric(label: 'Night', value: '812+20'),
            ],
            valueSize: 18,
          ),
          SizedBox(height: 16),
          _ModernMetricGroup(
            metrics: [
              _Metric(
                label: 'Instrument Flight Time',
                value: '428+15',
              ),
            ],
            valueSize: 18,
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 18,
            runSpacing: 0,
            children: [
              _ModernTextAction(label: 'Customize'),
              _ModernTextAction(label: 'Details'),
            ],
          ),
        ],
      );
}
