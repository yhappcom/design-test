import 'package:flutter/material.dart';

class HomeCandidate21Renderable extends StatefulWidget {
  const HomeCandidate21Renderable({super.key});
  @override
  State<HomeCandidate21Renderable> createState() => _HomeCandidate21RenderableState();
}

class _HomeCandidate21RenderableState extends State<HomeCandidate21Renderable> {
  String period = '28 days';
  late bool dark;
  late Color ink, sub, line, accent, fill;

  TextStyle tx(double size, {FontWeight weight = FontWeight.w500, Color? color}) => TextStyle(fontSize: size, height: 1.18, fontWeight: weight, color: color ?? ink, fontFeatures: const [FontFeature.tabularFigures()]);

  Widget metric(String label, String value) => Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: tx(11, color: sub)), const SizedBox(height: 3), Text(value, style: tx(17, weight: FontWeight.w700))]));

  Widget section(String title, Widget body, {String? action}) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [Row(children: [Text(title, style: tx(14, weight: FontWeight.w700)), const Spacer(), if (action != null) Text(action, style: tx(11, weight: FontWeight.w600, color: accent))]), const SizedBox(height: 8), body]);

  Widget flightIdentity(String carrier, String number) => SizedBox(width: 62, child: Padding(padding: const EdgeInsets.only(right: 4), child: Align(alignment: Alignment.centerLeft, child: FittedBox(fit: BoxFit.scaleDown, alignment: Alignment.centerLeft, child: Row(mainAxisSize: MainAxisSize.min, children: [Text(carrier, style: tx(12, weight: FontWeight.w700)), const SizedBox(width: 3), Text(number, style: tx(12))])))));

  Widget flightRow(List<String> r) => Container(height: 32, decoration: BoxDecoration(border: Border(bottom: BorderSide(color: line))), child: Row(children: [SizedBox(width: 54, child: Text(r[0], style: tx(12, color: sub))), flightIdentity(r[1], r[2]), Expanded(child: Text('${r[3]}  →  ${r[4]}', style: tx(12, weight: FontWeight.w600))), SizedBox(width: 46, child: Text(r[5], textAlign: TextAlign.right, style: tx(12, weight: FontWeight.w700)))]));

  @override
  Widget build(BuildContext context) {
    dark = Theme.of(context).brightness == Brightness.dark;
    final bg = dark ? const Color(0xFF11151A) : const Color(0xFFF7F8FA);
    ink = dark ? const Color(0xFFF1F4F7) : const Color(0xFF17202A);
    sub = dark ? const Color(0xFFAAB3BD) : const Color(0xFF566371);
    line = dark ? const Color(0xFF35404B) : const Color(0xFFD5DBE2);
    accent = dark ? const Color(0xFF78B7E5) : const Color(0xFF176A9E);
    fill = dark ? const Color(0xFF1B222A) : Colors.white;
    const flights = [['Sep 02','7C','132','GMP','CJU','1+12'],['Aug 31','7C','1123','CJU','GMP','1+08'],['Aug 29','KE','28','GMP','CJU','1+10']];

    return ColoredBox(color: bg, child: SafeArea(child: Padding(padding: const EdgeInsets.fromLTRB(22, 8, 22, 14), child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(height: 40, child: Row(children: [Text('LogMate', style: tx(18, weight: FontWeight.w700)), const Spacer(), Semantics(button: true, label: 'Settings', child: InkWell(onTap: () {}, borderRadius: BorderRadius.circular(6), child: SizedBox(width: 40, height: 40, child: Icon(Icons.tune_rounded, size: 20, color: sub))))])),
      SizedBox(height: 40, child: Row(children: [Expanded(child: Align(alignment: Alignment.centerLeft, child: TextButton.icon(onPressed: () {}, icon: Icon(Icons.add_rounded, size: 18, color: accent), label: Text('Add Flight', style: tx(13, weight: FontWeight.w600))))), Expanded(child: Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: Text('View Logbook  ›', style: tx(13, weight: FontWeight.w600)))))])),
      Container(height: 36, decoration: BoxDecoration(color: fill, border: Border.all(color: line), borderRadius: BorderRadius.circular(6)), child: TextField(decoration: InputDecoration(border: InputBorder.none, isDense: true, prefixIcon: Icon(Icons.search_rounded, size: 17, color: sub), prefixIconConstraints: const BoxConstraints(minWidth: 34), hintText: 'Search logbook', hintStyle: tx(12, color: sub), contentPadding: const EdgeInsets.symmetric(vertical: 9)))),
      const SizedBox(height: 11), Row(children: [SizedBox(width: 40, height: 40, child: IconButton(onPressed: () {}, icon: Text('‹', style: tx(24, color: sub)))), Expanded(child: Text('September  2026', textAlign: TextAlign.center, style: tx(18, weight: FontWeight.w700))), SizedBox(width: 40, height: 40, child: IconButton(onPressed: () {}, icon: Text('›', style: tx(24, color: sub))))]),
      const SizedBox(height: 5), Row(children: [metric('This month','42+15'), Container(width: 1, height: 34, color: line), const SizedBox(width: 16), metric('This year','318+40')]),
      const SizedBox(height: 16), section('Recent Flights', Column(children: [Row(children: [SizedBox(width: 54, child: Text('DATE', style: tx(10, weight: FontWeight.w700, color: sub))), SizedBox(width: 62, child: Text('FLIGHT', style: tx(10, weight: FontWeight.w700, color: sub))), Expanded(child: Text('ROUTE', style: tx(10, weight: FontWeight.w700, color: sub))), SizedBox(width: 46, child: Text('BLOCK', textAlign: TextAlign.right, style: tx(10, weight: FontWeight.w700, color: sub)))]), for (final r in flights) flightRow(r)]), action: 'View all ›'),
      const SizedBox(height: 15), section('Activity', Column(children: [Container(height: 36, decoration: BoxDecoration(border: Border.all(color: line), borderRadius: BorderRadius.circular(6)), child: Row(children: [for (final p in const ['7 days','28 days','90 days','Custom']) Expanded(child: InkWell(onTap: () => setState(() => period = p), child: Container(alignment: Alignment.center, decoration: BoxDecoration(color: period == p ? accent.withOpacity(dark ? 0.22 : 0.10) : Colors.transparent, border: period == p ? Border(bottom: BorderSide(color: accent, width: 2)) : null), child: Text(p, style: tx(11, weight: period == p ? FontWeight.w700 : FontWeight.w500, color: period == p ? accent : sub)))))])), const SizedBox(height: 9), Row(children: [metric('Legs','24'), metric('Block','38+45'), metric('TO / LD','24 / 24')])]), action: 'Details ›'),
      const SizedBox(height: 15), section('Totals', Row(children: [metric('Block','99,999+59'), metric('Night','99,999+59'), metric('Inst','99,999+59')]))
    ]))));
  }
}
