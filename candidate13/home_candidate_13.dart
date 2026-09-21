import 'dart:ui' show FontFeature;
import 'package:flutter/material.dart';

class Candidate13Home extends StatelessWidget {
  const Candidate13Home({super.key});

  static const _recent = [
    ('09/21', 'KE', '903', 'ICN → LHR', '14+18'),
    ('09/18', 'KE', '017', 'ICN → LAX', '11+02'),
    ('09/15', 'KE', '121', 'GMP → CJU', '01+07'),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final c = _C13Colors(dark);
    return Scaffold(
      backgroundColor: c.canvas,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Header(c: c),
                    const SizedBox(height: 18),
                    _Actions(c: c),
                    const SizedBox(height: 18),
                    _Search(c: c),
                    const SizedBox(height: 24),
                    _CurrentPeriod(c: c),
                    const SizedBox(height: 24),
                    _Recent(c: c),
                    const SizedBox(height: 24),
                    _Activity(c: c),
                    const SizedBox(height: 24),
                    _Totals(c: c),
                  ],
                ),
              ),
            ),
            _BottomNav(c: c),
          ],
        ),
      ),
    );
  }
}

class _C13Colors {
  _C13Colors(this.dark);
  final bool dark;
  Color get canvas => dark ? const Color(0xFF111617) : const Color(0xFFF8FAF9);
  Color get text => dark ? const Color(0xFFF1F4F3) : const Color(0xFF18201F);
  Color get secondary => dark ? const Color(0xFFAAB5B2) : const Color(0xFF5A6663);
  Color get faint => dark ? const Color(0xFF202827) : const Color(0xFFEEF2F0);
  Color get rule => dark ? const Color(0xFF34403D) : const Color(0xFFD8E0DD);
  Color get signal => dark ? const Color(0xFF83D5C6) : const Color(0xFF176B60);
  Color get onSignal => dark ? const Color(0xFF0E2824) : const Color(0xFFFFFFFF);
  Color get focus => dark ? const Color(0xFFE0B5FF) : const Color(0xFF68408B);
}

TextStyle _ui(_C13Colors c, double size,
        {FontWeight weight = FontWeight.w400, double? height}) =>
    TextStyle(color: c.text, fontSize: size, fontWeight: weight, height: height);

TextStyle _op(_C13Colors c, double size,
        {FontWeight weight = FontWeight.w500}) =>
    TextStyle(
      color: c.text,
      fontSize: size,
      fontWeight: weight,
      fontFamily: 'Roboto Mono',
      fontFamilyFallback: const ['Roboto', 'Arial'],
      fontFeatures: const [FontFeature.tabularFigures()],
      letterSpacing: .1,
    );

class _Header extends StatelessWidget {
  const _Header({required this.c});
  final _C13Colors c;
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('LOGMATE',
                  style: _ui(c, 12, weight: FontWeight.w700)
                      .copyWith(letterSpacing: 1.7, color: c.signal)),
              const SizedBox(height: 4),
              Text('Good afternoon', style: _ui(c, 22, weight: FontWeight.w650)),
            ]),
          ),
          IconButton(onPressed: () {}, tooltip: 'Settings', icon: Icon(Icons.tune_rounded, color: c.secondary, size: 21)),
        ],
      );
}

class _Actions extends StatelessWidget {
  const _Actions({required this.c});
  final _C13Colors c;
  @override
  Widget build(BuildContext context) => Row(children: [
        Expanded(
          child: _SignalButton(
              c: c, label: 'Add flight', icon: Icons.add_rounded, primary: true),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SignalButton(
              c: c, label: 'View logbook', icon: Icons.list_alt_rounded),
        ),
      ]);
}

class _SignalButton extends StatelessWidget {
  const _SignalButton(
      {required this.c,
      required this.label,
      required this.icon,
      this.primary = false});
  final _C13Colors c;
  final String label;
  final IconData icon;
  final bool primary;
  @override
  Widget build(BuildContext context) => InkWell(\n        onTap: () {},\n        borderRadius: BorderRadius.circular(10),\n        child: Container(
          constraints: const BoxConstraints(minHeight: 48),
          decoration: BoxDecoration(
            color: primary ? c.signal : Colors.transparent,
            border: primary ? null : Border.all(color: c.rule),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon,
                size: 18, color: primary ? c.onSignal : c.text),
            const SizedBox(width: 7),
            Text(label,
                style: _ui(c, 14, weight: FontWeight.w650).copyWith(
                    color: primary ? c.onSignal : c.text)),
          ]),
        ),
      );
}

class _Search extends StatefulWidget {
  const _Search({required this.c});
  final _C13Colors c;
  @override State<_Search> createState() => _SearchState();
}
class _SearchState extends State<_Search> {
  final focus = FocusNode();
  @override void initState(){ super.initState(); focus.addListener(_changed); }
  void _changed()=>setState((){});
  @override void dispose(){ focus.removeListener(_changed); focus.dispose(); super.dispose(); }
  @override Widget build(BuildContext context) {
    final c=widget.c; final active=focus.hasFocus;
    return TextField(
      focusNode: focus,
      decoration: InputDecoration(
        hintText: 'Search flights, airports, crew',
        prefixIcon: Icon(Icons.search_rounded, size:20, color: active?c.focus:c.secondary),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:c.rule)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:c.focus,width:2)),
        contentPadding: const EdgeInsets.symmetric(vertical:12),
      ),
      style:_ui(c,14),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text, {required this.c, this.trailing});
  final String text;
  final _C13Colors c;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) => Row(children: [
        Container(width: 3, height: 13, decoration: BoxDecoration(
          color: c.signal, borderRadius: BorderRadius.circular(2))),
        const SizedBox(width: 8),
        Expanded(child: Text(text.toUpperCase(),
            style: _ui(c, 11, weight: FontWeight.w700)
                .copyWith(letterSpacing: 1.1, color: c.secondary))),
        if (trailing != null) trailing!,
      ]);
}

class _CurrentPeriod extends StatelessWidget {
  const _CurrentPeriod({required this.c});
  final _C13Colors c;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SectionLabel('Current period', c: c,
          trailing: Text('28 days', style: _ui(c, 12).copyWith(color: c.secondary))),
      const SizedBox(height: 12),
      Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text('62+41', style: _op(c, 31, weight: FontWeight.w650)),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text('BLOCK', style: _ui(c, 10, weight: FontWeight.w700)
              .copyWith(letterSpacing: 1, color: c.secondary)),
        ),
        const Spacer(),
        Text('18 flights', style: _ui(c, 13).copyWith(color: c.secondary)),
      ]),
      const SizedBox(height: 10),
      Container(height: 2, color: c.faint,
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(widthFactor: .68,
          child: Container(color: c.signal))),
    ],
  );
}

class _Recent extends StatelessWidget {
  const _Recent({required this.c});
  final _C13Colors c;
  @override
  Widget build(BuildContext context) => Column(children: [
    _SectionLabel('Recent flights', c: c,
      trailing: Text('See all', style: _ui(c, 12, weight: FontWeight.w600)
          .copyWith(color: c.signal))),
    const SizedBox(height: 10),
    Row(children: [
      SizedBox(width: 46, child: Text('DATE', style: _cap(c))),
      SizedBox(width: 70, child: Text('FLIGHT', style: _cap(c))),
      Expanded(child: Text('ROUTE', style: _cap(c))),
      SizedBox(width: 48, child: Text('BLOCK', textAlign: TextAlign.end, style: _cap(c))),
    ]),
    const SizedBox(height: 4),
    for (final r in Candidate13Home._recent) _FlightRow(c: c, data: r),
  ]);
  TextStyle _cap(_C13Colors c) => _ui(c, 9, weight: FontWeight.w700)
      .copyWith(letterSpacing: .7, color: c.secondary);
}

class _FlightRow extends StatelessWidget {
  const _FlightRow({required this.c, required this.data});
  final _C13Colors c;
  final (String,String,String,String,String) data;
  @override
  Widget build(BuildContext context) => Container(
    height: 39,
    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: c.rule.withValues(alpha: .65)))),
    child: Row(children: [
      SizedBox(width: 46, child: Text(data.$1, style: _op(c, 11))),
      SizedBox(width: 70, child: Row(children: [
        SizedBox(width: 22, child: Text(data.$2, style: _op(c, 11, weight: FontWeight.w700))),
        Text(data.$3, style: _op(c, 11)),
      ])),
      Expanded(child: Text(data.$4, style: _op(c, 11))),
      SizedBox(width: 48, child: Text(data.$5, textAlign: TextAlign.end, style: _op(c, 11, weight: FontWeight.w650))),
    ]),
  );
}

class _Activity extends StatelessWidget {
  const _Activity({required this.c});
  final _C13Colors c;
  @override
  Widget build(BuildContext context) => Column(children: [
    _SectionLabel('Activity', c: c),
    const SizedBox(height: 11),
    Row(children: [
      for (final p in ['7 days','28 days','90 days','Custom'])
        Expanded(child: Container(
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: p == '28 days' ? c.faint : Colors.transparent,
            border: Border(bottom: BorderSide(
              color: p == '28 days' ? c.signal : c.rule,
              width: p == '28 days' ? 2 : 1))),
          child: Text(p, style: _ui(c, 11, weight: p == '28 days' ? FontWeight.w700 : FontWeight.w500)
              .copyWith(color: p == '28 days' ? c.text : c.secondary)),
        )),
    ]),
  ]);
}

class _Totals extends StatelessWidget {
  const _Totals({required this.c});
  final _C13Colors c;
  @override
  Widget build(BuildContext context) => Column(children: [
    _SectionLabel('Totals', c: c),
    const SizedBox(height: 12),
    Row(children: [
      _metric('BLOCK','4,862+37'),
      _metric('NIGHT','1,104+22'),
      _metric('INST','682+14'),
    ]),
  ]);
  Widget _metric(String label, String value) => Expanded(child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: _ui(c, 9, weight: FontWeight.w700)
          .copyWith(letterSpacing: .8, color: c.secondary)),
      const SizedBox(height: 4),
      Text(value, style: _op(c, 15, weight: FontWeight.w650)),
    ],
  ));
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.c});
  final _C13Colors c;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: c.canvas,
      border: Border(top: BorderSide(color: c.rule))),
    padding: const EdgeInsets.fromLTRB(12, 5, 12, 8),
    child: SafeArea(top: false, child: Row(children: [
      _item(Icons.home_rounded, 'Home', true),
      _item(Icons.menu_book_outlined, 'Logbook', false),
      _item(Icons.insights_outlined, 'Activity', false),
      _item(Icons.more_horiz_rounded, 'More', false),
    ])),
  );
  Widget _item(IconData icon, String label, bool selected) => Expanded(
    child: Semantics(
      button: true,
      selected: selected,
      label: label,
      child: SizedBox(height: 48, child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: selected ? c.signal : c.secondary),
          const SizedBox(height: 2),
          Text(label, style: _ui(c, 10, weight: selected ? FontWeight.w700 : FontWeight.w500)
              .copyWith(color: selected ? c.signal : c.secondary)),
        ],
      )),
    ),
  );
}
