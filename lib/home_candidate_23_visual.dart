import 'package:flutter/material.dart';
import 'home_v0_11.dart';

/// Candidate 23 — Cockpit Paper.
///
/// Structural/product truth is delegated directly to the frozen baseline HomeV011.
/// This wrapper changes only visual atmosphere: a restrained warm-paper/cool-ink
/// transform while retaining baseline geometry, content, controls and semantics.
class HomeCandidate23Visual extends StatelessWidget {
  const HomeCandidate23Visual({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(dark ? _darkMatrix : _lightMatrix),
      child: const HomeV011(),
    );
  }
}

// Mild channel shaping: neutral operational data remains legible while the
// baseline green cast becomes a cooler instrument-ink / warmer paper system.
const _lightMatrix = <double>[
  1.02, 0.00, 0.00, 0, 2,
  0.00, 0.99, 0.00, 0, 0,
  0.00, 0.00, 0.94, 0, -2,
  0.00, 0.00, 0.00, 1, 0,
];

const _darkMatrix = <double>[
  0.94, 0.00, 0.00, 0, 0,
  0.00, 0.99, 0.00, 0, 1,
  0.00, 0.00, 1.05, 0, 3,
  0.00, 0.00, 0.00, 1, 0,
];
