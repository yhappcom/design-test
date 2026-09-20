import 'package:flutter/material.dart';

import 'primitives.dart';

abstract final class _V10Colors {
  static const lightCanvas = Color(0xFFFAFBF8);
  static const lightSurface = Color(0xFFF1F3F0);
  static const lightText = Color(0xFF151817);
  static const lightSecondary = Color(0xFF606864);
  static const lightTertiary = Color(0xFF7A827E);
  static const lightAccent = Color(0xFF326A6D);
  static const lightPrimary = Color(0xFF1C2928);
  static const lightOnPrimary = Color(0xFFF8FAF8);
  static const lightLine = Color(0xFFDCE1DD);

  static const darkCanvas = Color(0xFF101311);
  static const darkSurface = Color(0xFF1A1F1C);
  static const darkText = Color(0xFFF1F3F0);
  static const darkSecondary = Color(0xFFA9B0AB);
  static const darkTertiary = Color(0xFF8B938E);
  static const darkAccent = Color(0xFF8EBFC1);
  static const darkPrimary = Color(0xFF33585A);
  static const darkOnPrimary = Color(0xFFF3F6F4);
  static const darkLine = Color(0xFF2A302C);
}

class _V10Theme {
  static ThemeData build(Brightness brightness, {String? fontFamily}) {
    final dark = brightness == Brightness.dark;
    final canvas = dark ? _V10Colors.darkCanvas : _V10Colors.lightCanvas;
    final text = dark ? _V10Colors.darkText : _V10Colors.lightText;
    final secondary =
        dark ? _V10Colors.darkSecondary : _V10Colors.lightSecondary;
    final accent = dark ? _V10Colors.darkAccent : _V10Colors.lightAccent;

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
          letterSpacing: -0.18,
          color: text,
        ),
        titleLarge: TextStyle(
          fontSize: 17,
          height: 21 / 17,
          fontWeight: FontWeight.w600,
          color: text,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          height: 20 / 16,
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
          fontSize: 12,
          height: 16 / 12,
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

extension _V10Context on BuildContext {
  bool get v10Dark => Theme.of(this).brightness == Brightness.dark;
  Color get v10Surface =>
      v10Dark ? _V10Colors.darkSurface : _V10Colors.lightSurface;
  Color get v10Text => v10Dark ? _V10Colors.darkText : _V10Colors.lightText;
  Color get v10Secondary =>
      v10Dark ? _V10Colors.darkSecondary : _V10Colors.lightSecondary;
  Color get v10Tertiary =>
      v10Dark ? _V10Colors.darkTertiary : _V10Colors.lightTertiary;
  Color get v10Accent =>
      v10Dark ? _V10Colors.darkAccent : _V10Colors.lightAccent;
  Color get v10Primary =>
      v10Dark ? _V10Colors.darkPrimary : _V10Colors.lightPrimary;
  Color get v10OnPrimary =>
      v10Dark ? _V10Colors.darkOnPrimary : _V10Colors.lightOnPrimary;
  Color get v10Line => v10Dark ? _V10Colors.darkLine : _V10Colors.lightLine;
}

class HomeV010 extends StatefulWidget {
  const HomeV010({super.key});

  @override
  State<HomeV010> createState() => _HomeV010State();
}

class _HomeV010State extends State<HomeV010> {
  String activity = '28 days';

  bool _largeText(BuildContext context) =>
      MediaQuery.textScalerOf(context).scale(13) >= 20;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final fontFamily = Theme.of(context).textTheme.bodyLarge?.fontFamily;

    return Theme(
      data: _V10Theme.build(brightness, fontFamily: fontFamily),
      child: PreviewPage(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 34),
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _V10Header(),
              const SizedBox(height: 5),
              const _V10Actions(),
              const SizedBox(height: 6),
              const _V10Search(),
              const SizedBox(height: 20),
              _currentPeriod(context),
              const SizedBox(height: 22),
              const _V10SectionHeader(title: 'Recent Flights', action: 'View all'),
              const SizedBox(height: 3),
              const _V10FlightColumns(),
              const _V10FlightRow(
                rowId: 'r1',
                date: 'Sep 02',
                flight: '7C132',
                dep: 'GMP',
                arr: 'CJU',
                block: '1+12',
              ),
              const _V10FlightRow(
                rowId: 'r2',
                date: 'Aug 31',
                flight: '7C1123',
                dep: 'CJU',
                arr: 'GMP',
                block: '1+08',
              ),
              const _V10FlightRow(
                rowId: 'r3',
                date: 'Aug 29',
                flight: 'KE28',
                dep: 'GMP',
                arr: 'CJU',
                block: '1+10',
              ),
              const SizedBox(height: 22),
              _activity(context),
              const SizedBox(height: 22),
              const _V10Totals(),
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
              const _V10MonthButton(
                icon: Icons.chevron_left_rounded,
                semanticLabel: 'Previous month',
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'September',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      TextSpan(
                        text: '  2026',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: context.v10Secondary,
                              fontFeatures: const [FontFeature.tabularFigures()],
                            ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
              const _V10MonthButton(
                icon: Icons.chevron_right_rounded,
                semanticLabel: 'Next month',
              ),
            ],
          ),
          const SizedBox(height: 10),
          const _V10MetricGrid(
            key: ValueKey('current-grid-v10'),
            metrics: [
              _V10Metric(label: 'This month', value: '42+15'),
              _V10Metric(label: 'This year', value: '318+40'),
            ],
            valueSize: 20,
            centered: false,
          ),
        ],
      );

  Widget _activity(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _V10SectionHeader(title: 'Activity', action: 'Details'),
          const SizedBox(height: 6),
          _V10PeriodSelector(
            selected: activity,
            onChanged: (value) => setState(() => activity = value),
          ),
          const SizedBox(height: 11),
          const _V10MetricGrid(
            key: ValueKey('activity-grid-v10'),
            metrics: [
              _V10Metric(label: 'Legs', value: '24'),
              _V10Metric(label: 'Block', value: '38+45'),
              _V10Metric(label: 'TO / LD', value: '24 / 24'),
            ],
            valueSize: 18,
            centered: true,
          ),
        ],
      );
}

class _V10Header extends StatelessWidget {
  const _V10Header();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: Row(
          children: [
            Text('LogMate', style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            const _V10IconTarget(
              icon: Icons.settings_outlined,
              semanticLabel: 'Settings',
            ),
          ],
        ),
      );
}

class _V10IconTarget extends StatelessWidget {
  const _V10IconTarget({
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
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(icon, size: 18, color: context.v10Secondary),
          ),
        ),
      );
}

class _V10Actions extends StatelessWidget {
  const _V10Actions();

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(13) >= 20;

    if (largeText) {
      return Column(
        children: [
          _V10ActionCell(primary: true, label: 'Add Flight'),
          _V10ActionCell(primary: false, label: 'View Logbook'),
        ],
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.v10Line)),
      ),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            const Expanded(
              child: _V10ActionCell(primary: true, label: 'Add Flight'),
            ),
            SizedBox(
              height: 40,
              child: VerticalDivider(
                width: 1,
                thickness: 1,
                color: context.v10Line,
              ),
            ),
            const Expanded(
              child: _V10ActionCell(primary: false, label: 'View Logbook'),
            ),
          ],
        ),
      ),
    );
  }
}

class _V10ActionCell extends StatelessWidget {
  const _V10ActionCell({
    required this.primary,
    required this.label,
  });

  final bool primary;
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(6),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (primary) ...[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.v10Primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: Icon(
                        Icons.add_rounded,
                        size: 14,
                        color: context.v10OnPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                ],
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: primary
                              ? context.v10Text
                              : context.v10Secondary,
                          fontWeight:
                              primary ? FontWeight.w600 : FontWeight.w500,
                        ),
                  ),
                ),
                if (!primary) ...[
                  const SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: context.v10Secondary,
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}

class _V10Search extends StatefulWidget {
  const _V10Search();

  @override
  State<_V10Search> createState() => _V10SearchState();
}

class _V10SearchState extends State<_V10Search> {
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
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 40),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.v10Surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active ? context.v10Accent : Colors.transparent,
            width: 1,
          ),
        ),
        child: TextField(
          focusNode: focusNode,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 17,
              color: active ? context.v10Accent : context.v10Secondary,
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 36, minHeight: 40),
            hintText: 'Flights, airports, crew',
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.v10Secondary,
                ),
            contentPadding: const EdgeInsets.fromLTRB(0, 9, 10, 9),
          ),
        ),
      ),
    );
  }
}

class _V10MonthButton extends StatelessWidget {
  const _V10MonthButton({
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
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 44,
            height: 44,
            child: Icon(icon, size: 20, color: context.v10Secondary),
          ),
        ),
      );
}

class _V10SectionHeader extends StatelessWidget {
  const _V10SectionHeader({
    required this.title,
    this.action,
  });

  final String title;
  final String? action;

  @override
  Widget build(BuildContext context) => SizedBox(
        minHeight: 30,
        child: Row(
          children: [
            Expanded(
              child: Text(title, style: Theme.of(context).textTheme.titleMedium),
            ),
            if (action != null) _V10TextAction(label: action!),
          ],
        ),
      );
}

class _V10TextAction extends StatelessWidget {
  const _V10TextAction({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: context.v10Accent,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      );
}

class _V10FlightColumns extends StatelessWidget {
  const _V10FlightColumns();

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: context.v10Line)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Row(
            children: [
              const SizedBox(width: 50, child: _V10ColumnLabel('Date')),
              const SizedBox(width: 62, child: _V10ColumnLabel('Flight')),
              const Expanded(child: _V10ColumnLabel('Route', center: true)),
              const SizedBox(
                width: 50,
                child: _V10ColumnLabel('Block', alignEnd: true),
              ),
            ],
          ),
        ),
      );
}

class _V10ColumnLabel extends StatelessWidget {
  const _V10ColumnLabel(
    this.label, {
    this.center = false,
    this.alignEnd = false,
  });

  final String label;
  final bool center;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) => Text(
        label,
        textAlign: center
            ? TextAlign.center
            : alignEnd
                ? TextAlign.right
                : TextAlign.left,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 11,
              color: context.v10Secondary,
              fontWeight: FontWeight.w600,
            ),
      );
}

class _V10FlightRow extends StatelessWidget {
  const _V10FlightRow({
    required this.rowId,
    required this.date,
    required this.flight,
    required this.dep,
    required this.arr,
    required this.block,
  });

  final String rowId;
  final String date;
  final String flight;
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
                Expanded(child: _V10MetaText(date, tabular: true)),
                _V10MetaText(flight, strong: true),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                _V10Route(rowId: rowId, dep: dep, arr: arr),
                const Spacer(),
                _V10Block(block),
              ],
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            SizedBox(width: 50, child: _V10MetaText(date, tabular: true)),
            SizedBox(width: 62, child: _V10MetaText(flight, strong: true)),
            Expanded(
              child: Center(
                child: _V10Route(rowId: rowId, dep: dep, arr: arr),
              ),
            ),
            SizedBox(width: 50, child: _V10Block(block)),
          ],
        ),
      ),
    );
  }
}

class _V10MetaText extends StatelessWidget {
  const _V10MetaText(
    this.value, {
    this.tabular = false,
    this.strong = false,
  });

  final String value;
  final bool tabular;
  final bool strong;

  @override
  Widget build(BuildContext context) => Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.clip,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 12.5,
              color: strong ? context.v10Secondary : context.v10Tertiary,
              fontWeight: strong ? FontWeight.w600 : FontWeight.w500,
              fontFeatures:
                  tabular ? const [FontFeature.tabularFigures()] : null,
            ),
      );
}

class _V10Route extends StatelessWidget {
  const _V10Route({
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
    final style = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 15.5,
          fontWeight: FontWeight.w600,
        );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          key: ValueKey('v10-dep-$rowId'),
          width: 38 * scale,
          child: Text(dep, textAlign: TextAlign.center, style: style),
        ),
        SizedBox(
          width: 18 * scale,
          child: Center(
            child: Text(
              '→',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 12.5,
                    color: context.v10Tertiary,
                  ),
            ),
          ),
        ),
        SizedBox(
          key: ValueKey('v10-arr-$rowId'),
          width: 38 * scale,
          child: Text(arr, textAlign: TextAlign.center, style: style),
        ),
      ],
    );
  }
}

class _V10Block extends StatelessWidget {
  const _V10Block(this.value);

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

class _V10Metric {
  const _V10Metric({required this.label, required this.value});
  final String label;
  final String value;
}

class _V10MetricGrid extends StatelessWidget {
  const _V10MetricGrid({
    super.key,
    required this.metrics,
    required this.valueSize,
    required this.centered,
    this.fixedLabelHeight = false,
  });

  final List<_V10Metric> metrics;
  final double valueSize;
  final bool centered;
  final bool fixedLabelHeight;

  @override
  Widget build(BuildContext context) {
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: context.v10Secondary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  metrics[i].value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: valueSize,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
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
        for (var i = 0; i < metrics.length; i++) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: centered
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                if (fixedLabelHeight)
                  SizedBox(
                    height: 30,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        metrics[i].label,
                        textAlign: centered ? TextAlign.center : TextAlign.left,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: context.v10Secondary,
                              fontWeight: FontWeight.w600,
                              height: 14 / 12,
                            ),
                      ),
                    ),
                  )
                else
                  Text(
                    metrics[i].label,
                    textAlign: centered ? TextAlign.center : TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: context.v10Secondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                const SizedBox(height: 2),
                Text(
                  metrics[i].value,
                  textAlign: centered ? TextAlign.center : TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: valueSize,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                ),
              ],
            ),
          ),
          if (i != metrics.length - 1) const SizedBox(width: 10),
        ],
      ],
    );
  }
}

class _V10PeriodSelector extends StatelessWidget {
  const _V10PeriodSelector({
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
        spacing: 6,
        runSpacing: 4,
        alignment: WrapAlignment.center,
        children: [
          for (final value in values)
            _V10PeriodCell(
              value: value,
              selected: selected == value,
              onTap: () => onChanged(value),
              largeText: true,
            ),
        ],
      );
    }

    return Row(
      key: const ValueKey('activity-selector-v10'),
      children: [
        for (var i = 0; i < values.length; i++)
          Expanded(
            child: _V10PeriodCell(
              value: values[i],
              selected: selected == values[i],
              onTap: () => onChanged(values[i]),
            ),
          ),
      ],
    );
  }
}

class _V10PeriodCell extends StatelessWidget {
  const _V10PeriodCell({
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
          borderRadius: BorderRadius.circular(6),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 38,
              minWidth: largeText ? 84 : 0,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: largeText ? 10 : 2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        value,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: selected
                                  ? context.v10Text
                                  : context.v10Secondary,
                              fontWeight: selected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    height: 2,
                    width: selected ? 26 : 0,
                    decoration: BoxDecoration(
                      color: context.v10Accent,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _V10Totals extends StatelessWidget {
  const _V10Totals();

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _V10SectionHeader(title: 'Totals'),
          SizedBox(height: 7),
          _V10MetricGrid(
            key: ValueKey('totals-grid-v10'),
            metrics: [
              _V10Metric(label: 'Block', value: '6,842+35'),
              _V10Metric(label: 'Night', value: '812+20'),
              _V10Metric(
                label: 'Instrument\nFlight Time',
                value: '428+15',
              ),
            ],
            valueSize: 17,
            centered: true,
            fixedLabelHeight: true,
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _V10TextAction(label: 'Customize'),
              SizedBox(width: 16),
              _V10TextAction(label: 'Details'),
            ],
          ),
        ],
      );
}
