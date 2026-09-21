import 'dart:ui' show FontFeature;
import 'package:flutter/material.dart';

class Candidate14Home extends StatelessWidget {
  const Candidate14Home({super.key});
  static const flights = [
    ('09/21','KE','903','ICN > LHR','14+18'),
    ('09/18','KE','017','ICN > LAX','11+02'),
    ('09/15','KE','121','GMP > CJU','01+07'),
  ];

  @override
  Widget build(BuildContext context) {
    final p = _P(Theme.of(context).brightness == Brightness.dark);
    return Scaffold(
      backgroundColor: p.bg,
      body: SafeArea(
        bottom: false,
        child: Column(children:[
          Expanded(child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20,16,20,22),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children:[
              _Header(p), const SizedBox(height:18),
              _Actions(p), const SizedBox(height:16),
              _Search(p), const SizedBox(height:26),
              _Period(p), const SizedBox(height:27),
              _Recent(p), const SizedBox(height:27),
              _Activity(p), const SizedBox(height:27),
              _Totals(p),
            ]),
          )),
          _Nav(p),
        ]),
      ),
    );
  }
}

class _P {
  _P(this.dark);
  final bool dark;
  Color get bg => dark ? const Color(0xFF0D1014) : const Color(0xFFF7F7F5);
  Color get ink => dark ? const Color(0xFFF4F6F8) : const Color(0xFF101318);
  Color get sub => dark ? const Color(0xFFADB4BE) : const Color(0xFF555D68);
  Color get rule => dark ? const Color(0xFF3A414B) : const Color(0xFFBBC0C6);
  Color get strong => dark ? const Color(0xFF737D89) : const Color(0xFF252A31);
  Color get accent => dark ? const Color(0xFF5C91FF) : const Color(0xFF004ED8);
  Color get onAccent => Colors.white;
  Color get focus => const Color(0xFFFFB000);
  Color get selected => dark ? const Color(0xFF182A4D) : const Color(0xFFDDE7FF);
}

TextStyle _t(_P p,double s,{FontWeight w=FontWeight.w400,double? h}) =>
  TextStyle(fontFamily:'C14Roboto',fontSize:s,fontWeight:w,height:h,color:p.ink);
TextStyle _n(_P p,double s,{FontWeight w=FontWeight.w500}) =>
  TextStyle(fontFamily:'C14Roboto',fontSize:s,fontWeight:w,color:p.ink,
    fontFeatures:const [FontFeature.tabularFigures()]);

class _Header extends StatelessWidget {
  const _Header(this.p); final _P p;
  @override Widget build(BuildContext context)=>Row(children:[
    Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Text('LOGMATE',style:_t(p,12,w:FontWeight.w800).copyWith(letterSpacing:1.5)),
      const SizedBox(height:5),
      Text('Good afternoon',style:_t(p,24,w:FontWeight.w700)),
    ])),
    TextButton(onPressed:(){},style:TextButton.styleFrom(minimumSize:const Size(44,44)),
      child:Text('MENU',style:_t(p,10,w:FontWeight.w800).copyWith(color:p.sub,letterSpacing:.7))),
  ]);
}

class _Actions extends StatelessWidget {
  const _Actions(this.p); final _P p;
  @override Widget build(BuildContext context)=>Row(children:[
    Expanded(child:_Action(p,'ADD FLIGHT',true)),
    const SizedBox(width:8),
    Expanded(child:_Action(p,'VIEW LOGBOOK',false)),
  ]);
}
class _Action extends StatelessWidget {
  const _Action(this.p,this.label,this.primary); final _P p; final String label; final bool primary;
  @override Widget build(BuildContext context)=>OutlinedButton(
    onPressed:(){},
    style:OutlinedButton.styleFrom(
      minimumSize:const Size.fromHeight(48),
      backgroundColor:primary?p.accent:Colors.transparent,
      foregroundColor:primary?p.onAccent:p.ink,
      side:BorderSide(color:primary?p.accent:p.strong,width:1.5),
      shape:const RoundedRectangleBorder(borderRadius:BorderRadius.zero),
      padding:const EdgeInsets.symmetric(horizontal:8)),
    child:Text(label,maxLines:1,overflow:TextOverflow.ellipsis,
      style:_t(p,12,w:FontWeight.w800).copyWith(color:primary?p.onAccent:p.ink,letterSpacing:.45)),
  );
}

class _Search extends StatefulWidget {
  const _Search(this.p); final _P p;
  @override State<_Search> createState()=>_SearchState();
}
class _SearchState extends State<_Search> {
  final f=FocusNode();
  @override void initState(){super.initState();f.addListener(_x);}
  void _x()=>setState((){});
  @override void dispose(){f.removeListener(_x);f.dispose();super.dispose();}
  @override Widget build(BuildContext context){
    final p=widget.p;
    return TextField(
      focusNode:f,
      style:_t(p,14),
      decoration:InputDecoration(
        hintText:'Search flights, airports, crew',
        hintStyle:_t(p,14).copyWith(color:p.sub),
        suffixText:'SEARCH',
        suffixStyle:_t(p,10,w:FontWeight.w800).copyWith(color:f.hasFocus?p.focus:p.sub,letterSpacing:.6),
        contentPadding:const EdgeInsets.symmetric(vertical:12),
        enabledBorder:UnderlineInputBorder(borderSide:BorderSide(color:p.strong,width:1.5)),
        focusedBorder:UnderlineInputBorder(borderSide:BorderSide(color:p.focus,width:2)),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.p,this.text,{this.trailing}); final _P p; final String text; final Widget? trailing;
  @override Widget build(BuildContext context)=>Row(children:[
    Text(text.toUpperCase(),style:_t(p,11,w:FontWeight.w800).copyWith(letterSpacing:1.15)),
    const SizedBox(width:10),
    Expanded(child:Container(height:1,color:p.rule)),
    if(trailing!=null)...[const SizedBox(width:10),trailing!],
  ]);
}

class _Period extends StatelessWidget {
  const _Period(this.p); final _P p;
  @override Widget build(BuildContext context)=>Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    _Label(p,'Current period',trailing:Text('28 DAYS',style:_t(p,10,w:FontWeight.w700).copyWith(color:p.sub))),
    const SizedBox(height:14),
    Row(crossAxisAlignment:CrossAxisAlignment.end,children:[
      Text('62+41',style:_n(p,34,w:FontWeight.w800)),
      const SizedBox(width:8),
      Padding(padding:const EdgeInsets.only(bottom:5),child:Text('BLOCK',style:_t(p,10,w:FontWeight.w800).copyWith(color:p.sub,letterSpacing:.8))),
      const Spacer(),
      Padding(padding:const EdgeInsets.only(bottom:5),child:Text('18 FLIGHTS',style:_t(p,11,w:FontWeight.w700).copyWith(color:p.sub))),
    ]),
    const SizedBox(height:10),
    Row(children:[
      Expanded(flex:68,child:Container(height:4,color:p.accent)),
      Expanded(flex:32,child:Container(height:4,color:p.rule)),
    ]),
  ]);
}

class _Recent extends StatelessWidget {
  const _Recent(this.p); final _P p;
  TextStyle cap()=>_t(p,9,w:FontWeight.w800).copyWith(color:p.sub,letterSpacing:.65);
  @override Widget build(BuildContext context)=>Column(children:[
    _Label(p,'Recent flights',trailing:Text('SEE ALL',style:_t(p,10,w:FontWeight.w800).copyWith(color:p.accent))),
    const SizedBox(height:12),
    Row(children:[
      SizedBox(width:46,child:Text('DATE',style:cap())),
      SizedBox(width:70,child:Text('FLIGHT',style:cap())),
      Expanded(child:Text('ROUTE',style:cap())),
      SizedBox(width:48,child:Text('BLOCK',textAlign:TextAlign.end,style:cap())),
    ]),
    const SizedBox(height:3),
    for(final r in Candidate14Home.flights) _Flight(p,r),
  ]);
}
class _Flight extends StatelessWidget {
  const _Flight(this.p,this.r); final _P p; final (String,String,String,String,String) r;
  @override Widget build(BuildContext context)=>Container(
    height:40,decoration:BoxDecoration(border:Border(bottom:BorderSide(color:p.rule))),
    child:Row(children:[
      SizedBox(width:46,child:Text(r.$1,style:_n(p,11))),
      SizedBox(width:70,child:Row(children:[
        SizedBox(width:23,child:Text(r.$2,style:_n(p,11,w:FontWeight.w800))),
        Text(r.$3,style:_n(p,11)),
      ])),
      Expanded(child:Text(r.$4,style:_n(p,11))),
      SizedBox(width:48,child:Text(r.$5,textAlign:TextAlign.end,style:_n(p,11,w:FontWeight.w700))),
    ]),
  );
}

class _Activity extends StatelessWidget {
  const _Activity(this.p); final _P p;
  @override Widget build(BuildContext context)=>Column(children:[
    _Label(p,'Activity'), const SizedBox(height:12),
    Row(children:[
      for(final x in ['7 DAYS','28 DAYS','90 DAYS','CUSTOM'])
        Expanded(child:Container(
          height:38,alignment:Alignment.center,
          decoration:BoxDecoration(
            color:x=='28 DAYS'?p.selected:Colors.transparent,
            border:Border(
              top:BorderSide(color:x=='28 DAYS'?p.accent:p.rule,width:x=='28 DAYS'?3:1),
              bottom:BorderSide(color:p.rule))),
          child:Text(x,style:_t(p,10,w:x=='28 DAYS'?FontWeight.w800:FontWeight.w600)
            .copyWith(color:x=='28 DAYS'?p.ink:p.sub)),
        )),
    ]),
  ]);
}

class _Totals extends StatelessWidget {
  const _Totals(this.p); final _P p;
  @override Widget build(BuildContext context)=>Column(children:[
    _Label(p,'Totals'), const SizedBox(height:14),
    Row(children:[_m('BLOCK','4,862+37'),_m('NIGHT','1,104+22'),_m('INST','682+14')]),
  ]);
  Widget _m(String l,String v)=>Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Text(l,style:_t(p,9,w:FontWeight.w800).copyWith(color:p.sub,letterSpacing:.75)),
    const SizedBox(height:4),
    Text(v,style:_n(p,15,w:FontWeight.w800)),
  ]));
}

class _Nav extends StatelessWidget {
  const _Nav(this.p); final _P p;
  @override Widget build(BuildContext context)=>Container(
    decoration:BoxDecoration(color:p.bg,border:Border(top:BorderSide(color:p.strong,width:1.5))),
    padding:const EdgeInsets.fromLTRB(12,4,12,8),
    child:SafeArea(top:false,child:Row(children:[
      _i('HOME',true),_i('LOGBOOK',false),_i('ACTIVITY',false),_i('MORE',false)
    ])),
  );
  Widget _i(String l,bool selected)=>Expanded(child:TextButton(
    onPressed:(){},
    style:TextButton.styleFrom(minimumSize:const Size(44,48),shape:const RoundedRectangleBorder(borderRadius:BorderRadius.zero)),
    child:Column(mainAxisSize:MainAxisSize.min,children:[
      Container(width:selected?18:4,height:3,color:selected?p.accent:p.rule),
      const SizedBox(height:5),
      Text(l,style:_t(p,9,w:selected?FontWeight.w800:FontWeight.w600).copyWith(color:selected?p.ink:p.sub,letterSpacing:.35)),
    ]),
  ));
}
