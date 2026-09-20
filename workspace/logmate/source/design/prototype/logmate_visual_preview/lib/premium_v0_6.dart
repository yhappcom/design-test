import 'package:flutter/material.dart';

import 'primitives.dart';

abstract final class _PremiumColors {
  static const lightCanvas = Color(0xFFF2F1ED);
  static const lightText = Color(0xFF181B1C);
  static const lightSecondary = Color(0xFF666968);
  static const lightQuiet = Color(0xFF8A8C89);
  static const lightRule = Color(0xFFC9C8C2);
  static const lightStrongRule = Color(0xFF9C9D98);
  static const lightAction = Color(0xFF202729);
  static const lightOnAction = Color(0xFFF7F6F2);
  static const lightAccent = Color(0xFF3F666B);

  static const darkCanvas = Color(0xFF121516);
  static const darkText = Color(0xFFECEDE8);
  static const darkSecondary = Color(0xFFB1B4B1);
  static const darkQuiet = Color(0xFF818783);
  static const darkRule = Color(0xFF3D4241);
  static const darkStrongRule = Color(0xFF666D69);
  static const darkAction = Color(0xFF263033);
  static const darkOnAction = Color(0xFFF0F1ED);
  static const darkAccent = Color(0xFF85ABB0);
}

class _PremiumTheme {
  static ThemeData forBrightness(
    Brightness brightness, {
    String? fontFamily,
  }) {
    final dark = brightness == Brightness.dark;
    final text = dark ? _PremiumColors.darkText : _PremiumColors.lightText;
    final secondary =
        dark ? _PremiumColors.darkSecondary : _PremiumColors.lightSecondary;
    final canvas =
        dark ? _PremiumColors.darkCanvas : _PremiumColors.lightCanvas;
    final accent =
        dark ? _PremiumColors.darkAccent : _PremiumColors.lightAccent;

    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      scaffoldBackgroundColor: canvas,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: accent,
        onPrimary: canvas,
        secondary: secondary,
        onSecondary: canvas,
        error: dark ? const Color(0xFFE0A5A9) : const Color(0xFF8F3F46),
        onError: canvas,
        surface: canvas,
        onSurface: text,
        outline: dark ? _PremiumColors.darkRule : _PremiumColors.lightRule,
        outlineVariant:
            dark ? _PremiumColors.darkRule : _PremiumColors.lightRule,
      ),
      fontFamily: fontFamily,
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 22,
          height: 1.08,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.35,
          color: text,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          height: 1.2,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.12,
          color: text,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          height: 1.42,
          fontWeight: FontWeight.w400,
          color: text,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
          fontWeight: FontWeight.w400,
          color: text,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          height: 1.2,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: text,
        ),
      ),
    );
  }
}

extension _PremiumContext on BuildContext {
  bool get _dark => Theme.of(this).brightness == Brightness.dark;
  Color get pText =>
      _dark ? _PremiumColors.darkText : _PremiumColors.lightText;
  Color get pSecondary =>
      _dark ? _PremiumColors.darkSecondary : _PremiumColors.lightSecondary;
  Color get pQuiet =>
      _dark ? _PremiumColors.darkQuiet : _PremiumColors.lightQuiet;
  Color get pRule =>
      _dark ? _PremiumColors.darkRule : _PremiumColors.lightRule;
  Color get pStrongRule =>
      _dark ? _PremiumColors.darkStrongRule : _PremiumColors.lightStrongRule;
  Color get pAction =>
      _dark ? _PremiumColors.darkAction : _PremiumColors.lightAction;
  Color get pOnAction =>
      _dark ? _PremiumColors.darkOnAction : _PremiumColors.lightOnAction;
  Color get pAccent =>
      _dark ? _PremiumColors.darkAccent : _PremiumColors.lightAccent;
}

class HomeV06 extends StatefulWidget {
  const HomeV06({super.key});

  @override
  State<HomeV06> createState() => _HomeV06State();
}

class _HomeV06State extends State<HomeV06> {
  String activity = '28D';

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final inheritedFontFamily =
        Theme.of(context).textTheme.bodyLarge?.fontFamily;
    return Theme(
      data: _PremiumTheme.forBrightness(
        brightness,
        fontFamily: inheritedFontFamily,
      ),
      child: PreviewPage(
        padding: const EdgeInsets.fromLTRB(26, 22, 26, 44),
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              const SizedBox(height: 24),
              const _PremiumActionPair(),
              const SizedBox(height: 22),
              const _PremiumSearch(),
              const SizedBox(height: 34),
              _calendar(context),
              const SizedBox(height: 34),
              const _PremiumSectionLabel('Recent Flights', trailing: 'View all'),
              const SizedBox(height: 6),
              const _PremiumFlightRow(
                date: 'SEP 02',
                flight: '7C132',
                route: 'GMP → CJU',
                duration: '1+12',
              ),
              const _PremiumFlightRow(
                date: 'AUG 31',
                flight: '7C1123',
                route: 'CJU → GMP',
                duration: '1+08',
              ),
              const _PremiumFlightRow(
                date: 'AUG 29',
                flight: 'KE28',
                route: 'GMP → CJU',
                duration: '1+10',
              ),
              const SizedBox(height: 38),
              _activity(context),
              const SizedBox(height: 38),
              _totals(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
    if (largeText) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('LogMate', style: Theme.of(context).textTheme.headlineMedium),
          const Align(
            alignment: Alignment.centerRight,
            child: _QuietTextButton(label: 'Settings'),
          ),
        ],
      );
    }

    return SizedBox(
      height: 42,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('LogMate', style: Theme.of(context).textTheme.headlineMedium),
          const Spacer(),
          const _QuietTextButton(label: 'Settings'),
        ],
      ),
    );
  }

  Widget _calendar(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
    final month = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SEP',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 30,
                height: 1,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.7,
              ),
        ),
        const SizedBox(width: 7),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            '2026',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.pSecondary,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.6,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ),
      ],
    );

    final navigation = Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _MonthControl(label: '‹', semantics: 'Previous month'),
        SizedBox(width: 2),
        _MonthControl(label: '›', semantics: 'Next month'),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (largeText)
          Wrap(
            spacing: 20,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [month, navigation],
          )
        else
          Row(children: [month, const Spacer(), navigation]),
        const SizedBox(height: 18),
        const _PremiumMetricPlane(
          metrics: [
            _MetricValue(label: 'This month', value: '42+15'),
            _MetricValue(label: 'This year', value: '318+40'),
          ],
        ),
        const SizedBox(height: 16),
        const _PremiumRule(strong: true),
      ],
    );
  }

  Widget _activity(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _PremiumSectionLabel('Activity', trailing: 'Details'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 20,
            runSpacing: 4,
            children: [
              for (final value in const ['7D', '28D', '90D', 'Custom'])
                _PremiumPeriodChoice(
                  value: value,
                  selected: activity == value,
                  onTap: () => setState(() => activity = value),
                ),
            ],
          ),
          const SizedBox(height: 20),
          const _PremiumMetricPlane(
            metrics: [
              _MetricValue(label: 'Legs', value: '24'),
              _MetricValue(label: 'Block', value: '38+45'),
              _MetricValue(label: 'TO/LD', value: '24/24'),
            ],
          ),
          const SizedBox(height: 16),
          const _PremiumRule(strong: true),
        ],
      );

  Widget _totals(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PremiumSectionLabel('Totals'),
          SizedBox(height: 8),
          _PremiumTotalRow(label: 'Block', value: '6,842+35'),
          _PremiumTotalRow(label: 'Night', value: '812+20'),
          _PremiumTotalRow(
            label: 'Instrument Flight Time',
            value: '428+15',
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 24,
            runSpacing: 0,
            children: [
              _QuietTextButton(label: 'Customize', accent: true),
              _QuietTextButton(label: 'Details', accent: true),
            ],
          ),
        ],
      );
}

class _PremiumActionPair extends StatelessWidget {
  const _PremiumActionPair();

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (largeText || constraints.maxWidth < 330) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _PrimaryInstrumentAction(label: 'Add Flight'),
              SizedBox(height: 8),
              _SecondaryInstrumentAction(label: 'View Logbook'),
            ],
          );
        }
        return const Row(
          children: [
            Expanded(child: _PrimaryInstrumentAction(label: 'Add Flight')),
            SizedBox(width: 12),
            Expanded(child: _SecondaryInstrumentAction(label: 'View Logbook')),
          ],
        );
      },
    );
  }
}

class _PrimaryInstrumentAction extends StatelessWidget {
  const _PrimaryInstrumentAction({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(2),
            child: Ink(
              decoration: BoxDecoration(
                color: context.pAction,
                borderRadius: BorderRadius.circular(2),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48),
                child: Row(
                  children: [
                    Container(width: 3, height: 48, color: context.pAccent),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: context.pOnAction,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Text(
                        '+',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: context.pOnAction,
                              fontWeight: FontWeight.w400,
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

class _SecondaryInstrumentAction extends StatelessWidget {
  const _SecondaryInstrumentAction({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: context.pStrongRule, width: 1),
                  bottom: BorderSide(color: context.pRule, width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    Text(
                      '›',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: context.pSecondary,
                            fontWeight: FontWeight.w400,
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

class _PremiumSearch extends StatefulWidget {
  const _PremiumSearch();

  @override
  State<_PremiumSearch> createState() => _PremiumSearchState();
}

class _PremiumSearchState extends State<_PremiumSearch> {
  final node = FocusNode();

  @override
  void initState() {
    super.initState();
    node.addListener(_changed);
  }

  void _changed() => setState(() {});

  @override
  void dispose() {
    node
      ..removeListener(_changed)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = node.hasFocus;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SEARCH',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 10,
                height: 1.1,
                color: active ? context.pAccent : context.pQuiet,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.35,
              ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 42),
          child: TextField(
            focusNode: node,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: 'Flights, airports, crew',
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: context.pSecondary,
                  ),
              contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 8),
              border: InputBorder.none,
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          height: active ? 2 : 1,
          color: active ? context.pAccent : context.pStrongRule,
        ),
      ],
    );
  }
}

class _PremiumSectionLabel extends StatelessWidget {
  const _PremiumSectionLabel(this.label, {this.trailing});
  final String label;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
    final title = Text(
      label,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontSize: 16,
            letterSpacing: -0.08,
          ),
    );

    if (trailing == null) {
      return title;
    }

    if (largeText) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          _InlineTextButton(label: trailing!),
        ],
      );
    }

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          title,
          const Spacer(),
          _InlineTextButton(label: trailing!),
        ],
      ),
    );
  }
}

class _InlineTextButton extends StatelessWidget {
  const _InlineTextButton({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 40),
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: context.pAccent,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                    ),
              ),
            ),
          ),
        ),
      );
}

class _QuietTextButton extends StatelessWidget {
  const _QuietTextButton({required this.label, this.accent = false});
  final String label;
  final bool accent;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: accent ? context.pAccent : context.pSecondary,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                    ),
              ),
            ),
          ),
        ),
      );
}

class _MonthControl extends StatelessWidget {
  const _MonthControl({required this.label, required this.semantics});
  final String label;
  final String semantics;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: semantics,
        child: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 42,
            height: 42,
            child: Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 24,
                      color: context.pSecondary,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
          ),
        ),
      );
}

class _MetricValue {
  const _MetricValue({required this.label, required this.value});
  final String label;
  final String value;
}

class _PremiumMetricPlane extends StatelessWidget {
  const _PremiumMetricPlane({required this.metrics});
  final List<_MetricValue> metrics;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
    if (largeText) {
      return Column(
        children: [
          for (var i = 0; i < metrics.length; i++) ...[
            _PremiumMetricRow(metric: metrics[i]),
            if (i != metrics.length - 1) const SizedBox(height: 8),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < metrics.length; i++) ...[
          Expanded(child: _PremiumMetricDatum(metric: metrics[i])),
          if (i != metrics.length - 1)
            Container(
              width: 1,
              height: 38,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              color: context.pRule,
            ),
        ],
      ],
    );
  }
}

class _PremiumMetricDatum extends StatelessWidget {
  const _PremiumMetricDatum({required this.metric});
  final _MetricValue metric;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            metric.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 11,
                  color: context.pSecondary,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.35,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            metric.value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 19,
                  letterSpacing: -0.15,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      );
}

class _PremiumMetricRow extends StatelessWidget {
  const _PremiumMetricRow({required this.metric});
  final _MetricValue metric;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              metric.label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: context.pSecondary,
                  ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            metric.value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      );
}

class _PremiumFlightRow extends StatelessWidget {
  const _PremiumFlightRow({
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
    if (largeText) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _MetaText('$date · $flight'),
            const SizedBox(height: 5),
            Text(route, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: _DataValue(duration),
            ),
            const SizedBox(height: 12),
            const _PremiumRule(),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 92, child: _MetaText('$date\n$flight')),
              Expanded(
                child: Text(
                  route,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                        letterSpacing: -0.2,
                      ),
                ),
              ),
              const SizedBox(width: 14),
              _DataValue(duration),
            ],
          ),
          const SizedBox(height: 13),
          const Padding(
            padding: EdgeInsets.only(left: 92),
            child: _PremiumRule(),
          ),
        ],
      ),
    );
  }
}

class _MetaText extends StatelessWidget {
  const _MetaText(this.value);
  final String value;

  @override
  Widget build(BuildContext context) => Text(
        value,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 10.5,
              height: 1.35,
              color: context.pQuiet,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.7,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
      );
}

class _DataValue extends StatelessWidget {
  const _DataValue(this.value);
  final String value;

  @override
  Widget build(BuildContext context) => Text(
        value,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18,
              letterSpacing: -0.15,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
      );
}

class _PremiumPeriodChoice extends StatelessWidget {
  const _PremiumPeriodChoice({
    required this.value,
    required this.selected,
    required this.onTap,
  });

  final String value;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 40),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 140),
                width: selected ? 8 : 0,
                height: 2,
                color: selected ? context.pAccent : Colors.transparent,
              ),
              if (selected) const SizedBox(width: 7),
              Text(
                value,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: selected ? context.pText : context.pSecondary,
                      fontWeight:
                          selected ? FontWeight.w600 : FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      );
}

class _PremiumTotalRow extends StatelessWidget {
  const _PremiumTotalRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9),
            child: largeText
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _DataValue(value),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(width: 14),
                      _DataValue(value),
                    ],
                  ),
          ),
        ),
        const _PremiumRule(),
      ],
    );
  }
}

class _PremiumRule extends StatelessWidget {
  const _PremiumRule({this.strong = false});
  final bool strong;

  @override
  Widget build(BuildContext context) => Container(
        height: 1,
        color: strong ? context.pStrongRule : context.pRule,
      );
}
