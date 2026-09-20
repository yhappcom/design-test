import 'package:flutter/material.dart';
import 'tokens.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    super.key,
    required this.child,
    this.maxWidth = 520,
    this.padding = const EdgeInsets.fromLTRB(24, 20, 24, 40),
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, viewport) {
              final minHeight = viewport.maxHeight > padding.vertical
                  ? viewport.maxHeight - padding.vertical
                  : 0.0;
              return SingleChildScrollView(
                padding: padding,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                      minHeight: minHeight,
                    ),
                    child: child,
                  ),
                ),
              );
            },
          ),
        ),
      );
}

class Rule extends StatelessWidget {
  const Rule({super.key, this.inset = 0});
  final double inset;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: inset),
        child: Container(height: 1, color: context.previewRule),
      );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading(
    this.label, {
    super.key,
    this.trailing,
  });

  final String label;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: PreviewSpace.sm,
            runSpacing: PreviewSpace.xxs,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      );
}

class PrimaryAction extends StatelessWidget {
  const PrimaryAction({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            decoration: BoxDecoration(
              color: context.previewAction,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 44),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PreviewSpace.sm,
                  vertical: PreviewSpace.xs,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 18, color: context.previewOnAction),
                      const SizedBox(width: PreviewSpace.xs),
                    ],
                    Flexible(
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: context.previewOnAction,
                              fontWeight: FontWeight.w700,
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

class SecondaryAction extends StatelessWidget {
  const SecondaryAction({
    super.key,
    required this.label,
    this.icon,
    this.onTap,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: label,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 44),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PreviewSpace.sm,
                vertical: PreviewSpace.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18, color: context.previewSecondary),
                    const SizedBox(width: PreviewSpace.xs),
                  ],
                  Flexible(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: context.previewSecondary,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}


class ResponsiveActionPair extends StatelessWidget {
  const ResponsiveActionPair({
    super.key,
    required this.primaryLabel,
    required this.secondaryLabel,
    this.onPrimary,
    this.onSecondary,
  });

  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback? onPrimary;
  final VoidCallback? onSecondary;

  double _textWidth(BuildContext context, String label) {
    final painter = TextPainter(
      text: TextSpan(
        text: label,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      textDirection: TextDirection.ltr,
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: 1,
    )..layout();
    return painter.width;
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final widest = [
            _textWidth(context, primaryLabel),
            _textWidth(context, secondaryLabel),
          ].reduce((a, b) => a > b ? a : b);
          final requiredForEqualRow =
              (widest * 2) + PreviewSpace.sm + PreviewSpace.xs;
          final horizontal = requiredForEqualRow <= constraints.maxWidth;

          if (!horizontal) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PrimaryAction(label: primaryLabel, onTap: onPrimary),
                const SizedBox(height: PreviewSpace.xs),
                SecondaryAction(label: secondaryLabel, onTap: onSecondary),
              ],
            );
          }

          return Row(
            children: [
              Expanded(
                child: PrimaryAction(label: primaryLabel, onTap: onPrimary),
              ),
              const SizedBox(width: PreviewSpace.sm),
              Expanded(
                child:
                    SecondaryAction(label: secondaryLabel, onTap: onSecondary),
              ),
            ],
          );
        },
      );
}

class TextLink extends StatelessWidget {
  const TextLink(this.label, {super.key, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: PreviewSpace.xs),
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: context.previewAction,
                  ),
            ),
          ),
        ),
      );
}

class UnderlineSearch extends StatefulWidget {
  const UnderlineSearch({super.key, this.hint = 'Search flights, airports, crew'});
  final String hint;

  @override
  State<UnderlineSearch> createState() => _UnderlineSearchState();
}

class _UnderlineSearchState extends State<UnderlineSearch> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_changed);
  }

  void _changed() => setState(() {});

  @override
  void dispose() {
    _focusNode
      ..removeListener(_changed)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = _focusNode.hasFocus;
    return Column(
      children: [
        SizedBox(
          height: 44,
          child: TextField(
            focusNode: _focusNode,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 19,
                color: active ? context.previewFocus : context.previewSecondary,
              ),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 32, minHeight: 44),
              hintText: widget.hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: context.previewSecondary),
              border: InputBorder.none,
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          height: active ? 2 : 1,
          color: active ? context.previewFocus : context.previewRule,
        ),
      ],
    );
  }
}

class NumericDatum extends StatelessWidget {
  const NumericDatum({
    super.key,
    required this.label,
    required this.value,
    this.alignEnd = false,
  });

  final String label;
  final String value;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment:
            alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: context.previewSecondary),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
          ),
        ],
      );
}
