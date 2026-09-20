import 'package:flutter/material.dart';
import 'primitives.dart';
import 'tokens.dart';

class WelcomePreview extends StatelessWidget {
  const WelcomePreview({super.key});

  @override
  Widget build(BuildContext context) => PreviewPage(
        child: SizedBox(
          height: 720,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 3),
              Text(
                'LogMate',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: PreviewSpace.xs),
              Text(
                'Pilot Logbook',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: context.previewSecondary,
                    ),
              ),
              const Spacer(flex: 4),
              const PrimaryAction(label: 'Start a new logbook'),
              const SizedBox(height: PreviewSpace.xs),
              const Center(child: TextLink('Sign in')),
              const Spacer(),
            ],
          ),
        ),
      );
}

enum PreviousTotalChoice { none, zero, carry }

class PreviousTotalPreview extends StatefulWidget {
  const PreviousTotalPreview({super.key});

  @override
  State<PreviousTotalPreview> createState() => _PreviousTotalPreviewState();
}

class _PreviousTotalPreviewState extends State<PreviousTotalPreview> {
  PreviousTotalChoice choice = PreviousTotalChoice.none;

  @override
  Widget build(BuildContext context) => PreviewPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Previous Total', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: PreviewSpace.xs),
            Text(
              'Set the totals carried forward before your first LogMate record.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: context.previewSecondary),
            ),
            const SizedBox(height: PreviewSpace.lg),
            _ChoiceRow(
              title: 'Start from zero',
              detail: 'Begin without carried-forward totals.',
              selected: choice == PreviousTotalChoice.zero,
              onTap: () => setState(() => choice = PreviousTotalChoice.zero),
            ),
            const Rule(),
            _ChoiceRow(
              title: 'Carry forward totals',
              detail: 'Enter totals from your previous logbook.',
              selected: choice == PreviousTotalChoice.carry,
              onTap: () => setState(() => choice = PreviousTotalChoice.carry),
            ),
            const Rule(),
            if (choice == PreviousTotalChoice.carry) ...[
              const SizedBox(height: PreviewSpace.lg),
              const _DurationEntry(label: 'Block', value: '2,350+25'),
              const Rule(),
              const _DurationEntry(label: 'Night', value: '412+10'),
              const Rule(),
              const _DurationEntry(
                label: 'Instrument Flight Time',
                value: '1,125+30',
              ),
              const Rule(),
              const SizedBox(height: PreviewSpace.sm),
              const TextLink('Add previous total'),
            ],
            const SizedBox(height: PreviewSpace.xl),
            Opacity(
              opacity: choice == PreviousTotalChoice.none ? 0.45 : 1,
              child: IgnorePointer(
                ignoring: choice == PreviousTotalChoice.none,
                child: const PrimaryAction(label: 'Continue'),
              ),
            ),
          ],
        ),
      );
}

class EmptyHomePreview extends StatelessWidget {
  const EmptyHomePreview({super.key});

  @override
  Widget build(BuildContext context) => PreviewPage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
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
            ),
            const SizedBox(height: PreviewSpace.md),
            const ResponsiveActionPair(
              primaryLabel: 'Add Flight',
              secondaryLabel: 'View Logbook',
            ),
            const SizedBox(height: PreviewSpace.md),
            const UnderlineSearch(),
            const SizedBox(height: PreviewSpace.xl),
            Text('No flights yet.', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: PreviewSpace.xs),
            Text(
              'Add your first flight or import existing records.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: context.previewSecondary),
            ),
            const SizedBox(height: PreviewSpace.md),
            const TextLink('Import records'),
            const SizedBox(height: PreviewSpace.xl),
            const SectionHeading('Previous Total'),
            const SizedBox(height: PreviewSpace.xs),
            const _BaselineStatus(label: 'Status', value: 'Set'),
            const Rule(),
          ],
        ),
      );
}

class _ChoiceRow extends StatelessWidget {
  const _ChoiceRow({
    required this.title,
    required this.detail,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String detail;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 72),
          child: Row(
            children: [
              SizedBox(
                width: 28,
                child: Icon(
                  selected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  size: 20,
                  color: selected
                      ? context.previewAction
                      : context.previewSecondary,
                ),
              ),
              const SizedBox(width: PreviewSpace.xs),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: PreviewSpace.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 2),
                      Text(
                        detail,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: context.previewSecondary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class _DurationEntry extends StatelessWidget {
  const _DurationEntry({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 58,
        child: Row(
          children: [
            Expanded(
              child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
            ),
            SizedBox(
              width: 112,
              child: TextFormField(
                initialValue: value,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                decoration: const InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      );
}

class _BaselineStatus extends StatelessWidget {
  const _BaselineStatus({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 46,
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: context.previewSecondary),
              ),
            ),
            Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      );
}
