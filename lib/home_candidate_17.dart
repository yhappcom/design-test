import 'package:flutter/material.dart';
import 'home_v0_11.dart';

/// Candidate 17 keeps HomeV011's exact composition/fixtures/operational geometry.
/// Only the inherited visual system is transformed by an outer Theme.
class HomeCandidate17 extends StatelessWidget {
  const HomeCandidate17({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final ink = dark ? const Color(0xFFF4F7FF) : const Color(0xFF07162D);
    final canvas = dark ? const Color(0xFF07111F) : const Color(0xFFF7F9FC);
    final cobalt = dark ? const Color(0xFF5E8DFF) : const Color(0xFF1747C7);
    final secondary = dark ? const Color(0xFFB3C0D5) : const Color(0xFF53627A);

    return Theme(
      data: ThemeData(
        brightness: dark ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: canvas,
        fontFamily: 'sans-serif',
        colorScheme: ColorScheme(
          brightness: dark ? Brightness.dark : Brightness.light,
          primary: cobalt,
          onPrimary: dark ? const Color(0xFF07111F) : Colors.white,
          secondary: secondary,
          onSecondary: canvas,
          error: dark ? const Color(0xFFFF9C9C) : const Color(0xFFB3261E),
          onError: canvas,
          surface: canvas,
          onSurface: ink,
        ),
      ),
      child: const _SignalFrame(child: HomeV011()),
    );
  }
}

/// Purely visual edge signal: it does not participate in Home layout or hit testing.
class _SignalFrame extends StatelessWidget {
  const _SignalFrame({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final signal = dark ? const Color(0xFFC8FF3D) : const Color(0xFF5A7D00);
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        IgnorePointer(
          child: Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              bottom: false,
              child: Container(width: 3, height: 40, color: signal),
            ),
          ),
        ),
      ],
    );
  }
}
