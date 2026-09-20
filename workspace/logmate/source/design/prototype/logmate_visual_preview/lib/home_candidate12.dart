import 'package:flutter/material.dart';

import 'home_v0_11.dart';

/// Candidate 12 — Night Flight Paper
///
/// Independent visual concept from structural checkpoint f992d62a.
/// The canonical Home widget tree, fixtures, actions and operational geometry
/// remain owned by HomeV011. This wrapper changes only visual atmosphere at
/// the theme boundary: restrained aviation-paper canvas, ink hierarchy and a
/// cool navigation accent. It deliberately does not consume Candidate 01 or
/// rejected Candidates 07–11.
class HomeCandidate12 extends StatelessWidget {
  const HomeCandidate12({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final scheme = ColorScheme(
      brightness: dark ? Brightness.dark : Brightness.light,
      primary: dark ? const Color(0xFF9EC7D7) : const Color(0xFF315F73),
      onPrimary: dark ? const Color(0xFF101619) : const Color(0xFFF8F7F2),
      secondary: dark ? const Color(0xFFA9B3B7) : const Color(0xFF596469),
      onSecondary: dark ? const Color(0xFF101619) : const Color(0xFFF8F7F2),
      error: dark ? const Color(0xFFF0A6A6) : const Color(0xFF9B3F43),
      onError: dark ? const Color(0xFF101619) : const Color(0xFFF8F7F2),
      surface: dark ? const Color(0xFF101619) : const Color(0xFFF8F7F2),
      onSurface: dark ? const Color(0xFFE9EEF0) : const Color(0xFF182126),
    );

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        brightness: scheme.brightness,
        colorScheme: scheme,
        scaffoldBackgroundColor: scheme.surface,
        splashFactory: InkRipple.splashFactory,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: scheme.onSurface,
              displayColor: scheme.onSurface,
            ),
      ),
      child: const HomeV011(),
    );
  }
}
