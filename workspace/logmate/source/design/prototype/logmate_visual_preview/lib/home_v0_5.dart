import 'package:flutter/material.dart';
import 'primitives.dart';
import 'tokens.dart';

class HomeV05 extends StatefulWidget {
  const HomeV05({super.key});

  @override
  State<HomeV05> createState() => _HomeV05State();
}

class _HomeV05State extends State<HomeV05> {
  String activity = '28D';

  @override
  Widget build(BuildContext context) => PreviewPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            const SizedBox(height: PreviewSpace.md),
            _actions(),
            const SizedBox(height: PreviewSpace.md),
            const UnderlineSearch(),
            const SizedBox(height: PreviewSpace.lg),
            _period(context),
            const SizedBox(height: PreviewSpace.lg),
            _recent(context),
            const SizedBox(height: PreviewSpace.xl),
            _activity(context),
            const SizedBox(height: PreviewSpace.xl),
            _totals(context),
          ],
        ),
      );

  Widget _header(BuildContext context) => SizedBox(
        height: 40,
        child: Row(
          children: [
            Text('LogMate', style: Theme.of(context).textTheme.headlineMedium),
            const Spacer(),
            IconButton(
              tooltip: 'Settings',
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined, size: 21),
              color: context.previewSecondary,
            ),
          ],
        ),
      );

  Widget _actions() => ResponsiveActionPair(
        primaryLabel: 'Add Flight',
        secondaryLabel: 'View Logbook',
        onSecondary: () {},
      );

  Widget _period(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                tooltip: 'Previous month',
                onPressed: () {},
                icon: const Icon(Icons.chevron_left_rounded),
                color: context.previewSecondary,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'SEP 2026',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Next month',
                onPressed: () {},
                icon: const Icon(Icons.chevron_right_rounded),
                color: context.previewSecondary,
              ),
            ],
          ),
          const SizedBox(height: PreviewSpace.sm),
          _MetricPlane(
            metrics: const [
              _MetricValue(label: 'This month', value: '42+15'),
              _MetricValue(label: 'This year', value: '318+40'),
            ],
          ),
          const SizedBox(height: PreviewSpace.sm),
          const Rule(),
        ],
      );

  Widget _recent(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            'Recent Flights',
            trailing: TextLink('View all', onTap: () {}),
          ),
          const SizedBox(height: PreviewSpace.xs),
          const _FlightRow(
            date: 'SEP 02',
            flight: '7C132',
            route: 'GMP → CJU',
            duration: '1+12',
          ),
          const Rule(),
          const _FlightRow(
            date: 'AUG 31',
            flight: '7C1123',
            route: 'CJU → GMP',
            duration: '1+08',
          ),
          const Rule(),
          const _FlightRow(
            date: 'AUG 29',
            flight: 'KE28',
            route: 'GMP → CJU',
            duration: '1+10',
          ),
          const Rule(),
        ],
      );

  Widget _activity(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            'Activity',
            trailing: TextLink('Details', onTap: () {}),
          ),
          const SizedBox(height: PreviewSpace.sm),
          Wrap(
            spacing: PreviewSpace.md,
            runSpacing: PreviewSpace.xxs,
            children: [
              for (final value in const ['7D', '28D', '90D', 'Custom'])
                _PeriodChoice(
                  value: value,
                  selected: value == activity,
                  onTap: () => setState(() => activity = value),
                ),
            ],
          ),
          const SizedBox(height: PreviewSpace.md),
          const _MetricPlane(
            metrics: [
              _MetricValue(label: 'Legs', value: '24'),
              _MetricValue(label: 'Block', value: '38+45'),
              _MetricValue(label: 'TO/LD', value: '24/24'),
            ],
          ),
          const SizedBox(height: PreviewSpace.sm),
          const Rule(),
        ],
      );

  Widget _totals(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading('Totals'),
          const SizedBox(height: PreviewSpace.sm),
          const _TotalRow(label: 'Block', value: '6,842+35'),
          const Rule(),
          const _TotalRow(label: 'Night', value: '812+20'),
          const Rule(),
          const _TotalRow(
            label: 'Instrument Flight Time',
            value: '428+15',
          ),
          const Rule(),
          const SizedBox(height: PreviewSpace.xs),
          Wrap(
            spacing: PreviewSpace.md,
            runSpacing: PreviewSpace.xxs,
            children: [
              TextLink('Customize', onTap: () {}),
              TextLink('Details', onTap: () {}),
            ],
          ),
        ],
      );
}

class _MetricValue {
  const _MetricValue({required this.label, required this.value});
  final String label;
  final String value;
}

class _MetricPlane extends StatelessWidget {
  const _MetricPlane({required this.metrics});
  final List<_MetricValue> metrics;

  @override
  Widget build(BuildContext context) {
    final scaledBody =
        MediaQuery.textScalerOf(context).scale(15);
    final expanded = scaledBody >= 22;

    if (expanded) {
      return Column(
        children: [
          for (var i = 0; i < metrics.length; i++) ...[
            _MetricRow(metric: metrics[i]),
            if (i != metrics.length - 1) const SizedBox(height: PreviewSpace.xs),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < metrics.length; i++) ...[
          Expanded(
            child: NumericDatum(
              label: metrics[i].label,
              value: metrics[i].value,
              alignEnd: i == metrics.length - 1,
            ),
          ),
          if (i != metrics.length - 1)
            const SizedBox(width: PreviewSpace.md),
        ],
      ],
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.metric});
  final _MetricValue metric;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              metric.label,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: context.previewSecondary),
            ),
          ),
          const SizedBox(width: PreviewSpace.sm),
          Text(
            metric.value,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      );
}

class _FlightRow extends StatelessWidget {
  const _FlightRow({
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PreviewSpace.sm),
      child: largeText
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$date · $flight',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: context.previewSecondary),
                ),
                const SizedBox(height: PreviewSpace.xxs),
                Text(route, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: PreviewSpace.xxs),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    duration,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$date · $flight',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: context.previewSecondary),
                      ),
                      const SizedBox(height: PreviewSpace.xxs),
                      Text(
                        route,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: PreviewSpace.md),
                Text(
                  duration,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                ),
              ],
            ),
    );
  }
}

class _PeriodChoice extends StatelessWidget {
  const _PeriodChoice({
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
          constraints: const BoxConstraints(minHeight: 44),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PreviewSpace.xxs),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: selected
                            ? Theme.of(context).colorScheme.onSurface
                            : context.previewSecondary,
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 5),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  width: selected ? 24 : 0,
                  height: 2,
                  color:
                      selected ? context.previewAction : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      );
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(15) >= 22;

    if (largeText) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: PreviewSpace.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: PreviewSpace.xxs),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 46,
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(width: PreviewSpace.sm),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      ),
    );
  }
}
