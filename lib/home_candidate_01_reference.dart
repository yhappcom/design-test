import 'package:flutter/material.dart';

class HomeCandidate01Reference extends StatelessWidget {
  const HomeCandidate01Reference({super.key});

  static const _bg = Color(0xFFFFFBF8);
  static const _ink = Color(0xFF111A21);
  static const _muted = Color(0xFF53616B);
  static const _rule = Color(0xFFD9DDDE);
  static const _search = Color(0xFFF2F2F1);
  static const _accent = Color(0xFF00A693);

  TextStyle _sans(double size,
          {FontWeight weight = FontWeight.w400,
          Color color = _ink,
          double? letterSpacing,
          double height = 1.0}) =>
      TextStyle(
        fontFamily: 'PreviewSans',
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );

  TextStyle _mono(double size,
          {FontWeight weight = FontWeight.w400,
          Color color = _ink,
          double? letterSpacing,
          double height = 1.0}) =>
      TextStyle(
        fontFamily: 'PreviewMono',
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        fontFeatures: const [FontFeature.tabularFigures()],
      );

  Widget _line(double y, {double left = 22, double right = 22}) =>
      Positioned(left: left, right: right, top: y, child: Container(height: 0.7, color: _rule));

  Widget _text(String value, double x, double y, TextStyle style,
          {TextAlign align = TextAlign.left, double? width}) =>
      Positioned(
        left: x,
        top: y,
        width: width,
        child: Text(value, textAlign: align, maxLines: 1, style: style),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SizedBox.expand(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Header
            Positioned(
              left: 108,
              top: 22,
              width: 174,
              height: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('LOG', style: _sans(18.5, weight: FontWeight.w500, letterSpacing: 1.3)),
                  const SizedBox(width: 8),
                  Text('MATE', style: _sans(18.5, weight: FontWeight.w500, color: _accent, letterSpacing: 1.2)),
                ],
              ),
            ),
            const Positioned(
              right: 29,
              top: 24,
              child: Icon(Icons.settings_outlined, size: 22, color: _muted),
            ),
            _line(64),

            // Actions
            const Positioned(left: 47, top: 86, child: Icon(Icons.add, size: 27, color: _muted)),
            _text('Add flight', 81, 89, _sans(13.5, color: _ink)),
            Positioned(left: 189, top: 82, child: Container(width: 0.7, height: 30, color: _rule)),
            const Positioned(left: 224, top: 87, child: Icon(Icons.description_outlined, size: 22, color: _muted)),
            _text('View logbook', 260, 89, _sans(13.5, color: _ink)),

            // Search
            Positioned(
              left: 22,
              right: 22,
              top: 130,
              height: 37,
              child: DecoratedBox(
                decoration: BoxDecoration(color: _search, borderRadius: BorderRadius.circular(11)),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    const Icon(Icons.search_rounded, size: 23, color: _muted),
                    const SizedBox(width: 15),
                    Text('Search logbook', style: _sans(13.5, color: Color(0xFF65727C))),
                  ],
                ),
              ),
            ),

            // Current period
            _text('Current Period', 23, 198, _sans(17.0, weight: FontWeight.w600)),
            const Positioned(left: 255, top: 198, child: Icon(Icons.chevron_left_rounded, size: 24, color: _muted)),
            _text('SEP 2026', 283, 201, _sans(12.5, color: _muted, letterSpacing: .2)),
            const Positioned(right: 21, top: 198, child: Icon(Icons.chevron_right_rounded, size: 24, color: Color(0xFFB7BEC2))),
            _line(226),
            _text('Block Time', 25, 238, _mono(11.8, color: Color(0xFF66737D), letterSpacing: .3)),
            _text('This month', 25, 263, _sans(12.3, color: _muted)),
            _text('42+15', 25, 283, _mono(22.7, weight: FontWeight.w500)),
            Positioned(left: 189, top: 258, child: Container(width: 0.7, height: 47, color: _rule)),
            _text('This year', 219, 263, _sans(12.3, color: _muted)),
            _text('318+40', 219, 283, _mono(22.7, weight: FontWeight.w500)),

            // Recent Flights
            _text('Recent Flights', 23, 344, _sans(17.0, weight: FontWeight.w600)),
            _text('View All', 304, 347, _sans(12.2, color: _muted)),
            const Positioned(right: 20, top: 344, child: Icon(Icons.chevron_right_rounded, size: 22, color: _muted)),
            _line(371),
            _text('DATE', 24, 384, _mono(8.8, color: _muted, letterSpacing: 1.4)),
            _text('FLIGHT', 96, 384, _mono(8.8, color: _muted, letterSpacing: 1.4)),
            _text('ROUTE', 195, 384, _mono(8.8, color: _muted, letterSpacing: 1.4)),
            _text('BLOCK', 311, 384, _mono(8.8, color: _muted, letterSpacing: 1.4)),
            _line(398),

            _text('09.02', 25, 410, _mono(12.5)),
            Positioned(left: 95, top: 405, child: SizedBox(width: 82, child: RichText(text: TextSpan(children: [
              TextSpan(text: '7C', style: _mono(12.7, weight: FontWeight.w700)),
              TextSpan(text: '  132', style: _mono(12.7)),
            ])))),
            Positioned(left: 82, top: 405, child: Container(width: .7, height: 17, color: _rule)),
            Positioned(left: 180, top: 405, child: Container(width: .7, height: 17, color: _rule)),
            _text('GMP  →  CJU', 195, 410, _mono(12.5)),
            Positioned(left: 291, top: 405, child: Container(width: .7, height: 17, color: _rule)),
            _text('1+12', 311, 410, _mono(12.5)),
            _line(430),

            _text('08.31', 25, 442, _mono(12.5)),
            Positioned(left: 95, top: 437, child: SizedBox(width: 88, child: RichText(text: TextSpan(children: [
              TextSpan(text: '7C', style: _mono(12.7, weight: FontWeight.w700)),
              TextSpan(text: '  1123', style: _mono(12.7)),
            ])))),
            Positioned(left: 82, top: 437, child: Container(width: .7, height: 17, color: _rule)),
            Positioned(left: 180, top: 437, child: Container(width: .7, height: 17, color: _rule)),
            _text('CJU  →  GMP', 195, 442, _mono(12.5)),
            Positioned(left: 291, top: 437, child: Container(width: .7, height: 17, color: _rule)),
            _text('1+08', 311, 442, _mono(12.5)),
            _line(462),

            _text('08.29', 25, 474, _mono(12.5)),
            Positioned(left: 95, top: 469, child: SizedBox(width: 82, child: RichText(text: TextSpan(children: [
              TextSpan(text: 'KE', style: _mono(12.7, weight: FontWeight.w700)),
              TextSpan(text: '  28', style: _mono(12.7)),
            ])))),
            Positioned(left: 82, top: 469, child: Container(width: .7, height: 17, color: _rule)),
            Positioned(left: 180, top: 469, child: Container(width: .7, height: 17, color: _rule)),
            _text('GMP  →  CJU', 195, 474, _mono(12.5)),
            Positioned(left: 291, top: 469, child: Container(width: .7, height: 17, color: _rule)),
            _text('1+10', 311, 474, _mono(12.5)),
            _line(494),

            // Activity
            _text('Activity', 23, 526, _sans(17.0, weight: FontWeight.w600)),
            _text('7 days', 43, 562, _sans(11.8, weight: FontWeight.w600, color: _accent), width: 55, align: TextAlign.center),
            _text('28 days', 118, 562, _sans(11.8, color: _muted), width: 55, align: TextAlign.center),
            _text('90 days', 205, 562, _sans(11.8, color: _muted), width: 55, align: TextAlign.center),
            _text('Custom', 300, 562, _sans(11.8, color: _muted), width: 55, align: TextAlign.center),
            Positioned(left: 25, right: 22, top: 578, child: Container(height: .7, color: _rule)),
            Positioned(left: 25, top: 577, child: Container(width: 72, height: 1.8, color: _accent)),

            _text('Legs', 25, 603, _sans(11.5, color: _muted)),
            _text('4', 25, 622, _mono(20.5, weight: FontWeight.w500)),
            Positioned(left: 132, top: 600, child: Container(width: .7, height: 40, color: _rule)),
            _text('Block', 154, 603, _sans(11.5, color: _muted)),
            _text('6+48', 154, 622, _mono(20.5, weight: FontWeight.w500)),
            Positioned(left: 252, top: 600, child: Container(width: .7, height: 40, color: _rule)),
            _text('TO / LD', 270, 603, _sans(11.5, color: _muted)),
            _text('3 / 3', 270, 622, _mono(20.5, weight: FontWeight.w500)),

            // Totals
            _text('Totals', 23, 684, _sans(17.0, weight: FontWeight.w600)),
            _line(708),
            _text('Total', 25, 723, _sans(11.5, color: _muted)),
            _text('1,284+35', 25, 742, _mono(19.5, weight: FontWeight.w500)),
            Positioned(left: 132, top: 721, child: Container(width: .7, height: 42, color: _rule)),
            _text('B737', 153, 723, _sans(11.5, color: _muted)),
            _text('842+10', 153, 742, _mono(19.5, weight: FontWeight.w500)),
            Positioned(left: 252, top: 721, child: Container(width: .7, height: 42, color: _rule)),
            _text('SIC', 270, 723, _sans(11.5, color: _muted)),
            _text('1,163+55', 270, 742, _mono(19.5, weight: FontWeight.w500)),

            Positioned(left: 124, top: 807, child: Container(width: 133, height: 1.2, color: Color(0xFFC7CBCC))),
          ],
        ),
      ),
    );
  }
}
