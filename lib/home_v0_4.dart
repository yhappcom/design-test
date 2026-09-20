import 'package:flutter/material.dart';
import 'primitives.dart';
import 'tokens.dart';

class HomeV04 extends StatefulWidget {
  const HomeV04({super.key});

  @override
  State<HomeV04> createState() => _HomeV04State();
}

class _HomeV04State extends State<HomeV04> {
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
            _currentPeriod(context),
            const SizedBox(height: PreviewSpace.lg),
            _recent(context),
            const SizedBox(height: PreviewSpace.lg),
            _activity(context),
            const SizedBox(height: PreviewSpace.lg),
            _totals(context),
          ],
        ),
      );

  Widget _header(BuildContext context) => SizedBox(
        height: 40,
        child: Row(
          children: [
            Text(
              'LogMate',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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

  Widget _currentPeriod(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading('Current Period'),
          const SizedBox(height: PreviewSpace.sm),
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
                    '2026.09',
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
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: NumericDatum(label: 'This month', value: '42+15')),
              Expanded(
                child: NumericDatum(
                  label: 'This year',
                  value: '318+40',
                  alignEnd: true,
                ),
              ),
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
            'Recent',
            trailing: TextLink('View all', onTap: () {}),
          ),
          const SizedBox(height: PreviewSpace.xs),
          const _FlightRow(
            date: 'SEP 02',
            flight: '7C 132',
            route: 'GMP  →  CJU',
            duration: '1+12',
          ),
          const Rule(),
          const _FlightRow(
            date: 'AUG 31',
            flight: '7C 1123',
            route: 'CJU  →  GMP',
            duration: '1+08',
          ),
          const Rule(),
          const _FlightRow(
            date: 'AUG 29',
            flight: 'KE 28',
            route: 'GMP  →  CJU',
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
            runSpacing: PreviewSpace.xs,
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
          const Row(
            children: [
              Expanded(child: NumericDatum(label: 'Legs', value: '24')),
              Expanded(child: NumericDatum(label: 'Block', value: '38+45')),
              Expanded(
                child: NumericDatum(
                  label: 'TO/LD',
                  value: '24/24',
                  alignEnd: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: PreviewSpace.sm),
          const Rule(),
        ],
      );

  Widget _totals(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            'Totals',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextLink('Customize', onTap: () {}),
                const SizedBox(width: PreviewSpace.sm),
                TextLink('Details', onTap: () {}),
              ],
            ),
          ),
          const SizedBox(height: PreviewSpace.sm),
          const _TotalRow(label: 'Block', value: '6,842+35'),
          const Rule(),
          const _TotalRow(label: 'Night', value: '812+20'),
          const Rule(),
          const _TotalRow(label: 'Instrument Flight Time', value: '428+15'),
          const Rule(),
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
  Widget build(BuildContext context) => SizedBox(
        height: 50,
        child: Row(
          children: [
            SizedBox(
              width: 62,
              child: Text(
                date,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: context.previewSecondary),
              ),
            ),
            SizedBox(
              width: 78,
              child: Text(
                flight,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: Text(
                route,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Text(
              duration,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFeatures: const [FontFeature.tabularFigures()],
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      );
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
                color: selected ? context.previewAction : Colors.transparent,
              ),
            ],
          ),
        ),
      );
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 46,
        child: Row(
          children: [
            Expanded(
              child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
            ),
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
