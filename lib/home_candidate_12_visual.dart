import 'package:flutter/material.dart';
import 'primitives.dart';

abstract final class C12Palette {
  static const lightCanvas=Color(0xFFF7F8F4), lightSurface=Color(0xFFE9EEEA),
      lightText=Color(0xFF1B211E), lightSub=Color(0xFF626B65),
      lightTertiary=Color(0xFF858D87), lightAccent=Color(0xFF356C6A),
      lightRule=Color(0xFFD7DDD8);
  static const darkCanvas=Color(0xFF111512), darkSurface=Color(0xFF1B241F),
      darkText=Color(0xFFE9EDE9), darkSub=Color(0xFFAAB2AC),
      darkTertiary=Color(0xFF7F8982), darkAccent=Color(0xFF8BC4C0),
      darkRule=Color(0xFF334039);
}

class HomeCandidate12Visual extends StatefulWidget {
  const HomeCandidate12Visual({super.key});
  @override State<HomeCandidate12Visual> createState()=>_HomeCandidate12VisualState();
}

class _HomeCandidate12VisualState extends State<HomeCandidate12Visual> {
  String period='28 days';
  final searchFocus=FocusNode();

  @override void dispose(){ searchFocus.dispose(); super.dispose(); }

  @override Widget build(BuildContext context){
    final dark=Theme.of(context).brightness==Brightness.dark;
    final canvas=dark?C12Palette.darkCanvas:C12Palette.lightCanvas;
    final ink=dark?C12Palette.darkText:C12Palette.lightText;
    final accent=dark?C12Palette.darkAccent:C12Palette.lightAccent;
    final family=Theme.of(context).textTheme.bodyLarge?.fontFamily;
    final tt=TextTheme(
      titleLarge:TextStyle(fontSize:18,height:1.15,fontWeight:FontWeight.w600,color:ink),
      titleMedium:TextStyle(fontSize:16,height:1.2,fontWeight:FontWeight.w600,color:ink),
      titleSmall:TextStyle(fontSize:13,height:1.2,fontWeight:FontWeight.w500,color:ink),
      bodyLarge:TextStyle(fontSize:13.5,height:1.25,fontWeight:FontWeight.w400,color:ink),
      bodyMedium:TextStyle(fontSize:12.5,height:1.25,fontWeight:FontWeight.w400,color:ink),
      labelLarge:TextStyle(fontSize:13,height:1.2,fontWeight:FontWeight.w500,color:ink),
    ).apply(fontFamily:family);
    final theme=ThemeData(
      brightness:dark?Brightness.dark:Brightness.light,
      useMaterial3:true,
      scaffoldBackgroundColor:canvas,
      fontFamily:family,
      textTheme:tt,
      colorScheme:ColorScheme.fromSeed(
        brightness:dark?Brightness.dark:Brightness.light,
        seedColor:accent,
        surface:canvas,
        onSurface:ink,
      ),
    );
    return Theme(data:theme,child:PreviewPage(
      padding:const EdgeInsets.fromLTRB(24,12,24,34),
      child:Builder(builder:(context)=>Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:[
          _header(context),const SizedBox(height:2),
          _actions(context),const SizedBox(height:4),
          _search(context),const SizedBox(height:10),
          _current(context),const SizedBox(height:21),
          _section(context,'Recent Flights','View all ›'),const SizedBox(height:5),
          _flightHeader(context),const SizedBox(height:2),
          _row(context,'Sep 02','7C','132','GMP','CJU','1+12'),
          _row(context,'Aug 31','7C','1123','CJU','GMP','1+08'),
          _row(context,'Aug 29','KE','28','GMP','CJU','1+10'),
          const SizedBox(height:21),_activity(context),
          const SizedBox(height:21),_totals(context),
        ],
      )),
    ));
  }

  bool dark(BuildContext c)=>Theme.of(c).brightness==Brightness.dark;
  Color surface(BuildContext c)=>dark(c)?C12Palette.darkSurface:C12Palette.lightSurface;
  Color sub(BuildContext c)=>dark(c)?C12Palette.darkSub:C12Palette.lightSub;
  Color tertiary(BuildContext c)=>dark(c)?C12Palette.darkTertiary:C12Palette.lightTertiary;
  Color accent(BuildContext c)=>dark(c)?C12Palette.darkAccent:C12Palette.lightAccent;
  Color rule(BuildContext c)=>dark(c)?C12Palette.darkRule:C12Palette.lightRule;

  TextStyle mono(BuildContext c)=>Theme.of(c).textTheme.bodyLarge!.copyWith(
    fontFamily:'monospace',fontSize:13.5,fontWeight:FontWeight.w400,
    fontFeatures:const[FontFeature.tabularFigures()]);
  TextStyle datum(BuildContext c,double size)=>Theme.of(c).textTheme.bodyLarge!.copyWith(
    fontSize:size,fontWeight:FontWeight.w500,
    fontFeatures:const[FontFeature.tabularFigures()]);

  Widget _header(BuildContext c)=>SizedBox(height:44,child:Row(children:[
    Text('LogMate',style:Theme.of(c).textTheme.titleMedium?.copyWith(fontSize:17,letterSpacing:-.1)),
    const Spacer(),
    Semantics(button:true,label:'Settings',child:InkWell(
      onTap:(){},borderRadius:BorderRadius.circular(7),
      child:SizedBox(width:44,height:44,child:Align(alignment:Alignment.centerRight,
        child:Icon(Icons.settings_outlined,size:18,color:sub(c))))),
  ]));

  Widget _actions(BuildContext c)=>SizedBox(height:44,child:Row(children:[
    Expanded(child:_action(c,'＋  Add Flight',Alignment.centerLeft,'Add Flight')),
    Expanded(child:_action(c,'View Logbook  ›',Alignment.centerRight,'View Logbook')),
  ]));
  Widget _action(BuildContext c,String text,Alignment align,String semantics)=>Semantics(
    button:true,label:semantics,child:InkWell(onTap:(){},borderRadius:BorderRadius.circular(7),
      child:SizedBox(height:44,child:Align(alignment:align,
        child:Text(text,style:Theme.of(c).textTheme.labelLarge)))));

  Widget _search(BuildContext c)=>GestureDetector(
    behavior:HitTestBehavior.translucent,onTap:searchFocus.requestFocus,
    child:SizedBox(height:44,child:Center(child:SizedBox(height:36,child:TextField(
      focusNode:searchFocus,style:Theme.of(c).textTheme.bodyMedium,
      decoration:InputDecoration(
        isDense:true,filled:true,fillColor:surface(c),hintText:'Search logbook',
        hintStyle:Theme.of(c).textTheme.bodyMedium?.copyWith(color:sub(c)),
        prefixIcon:Icon(Icons.search_rounded,size:16,color:sub(c)),
        prefixIconConstraints:const BoxConstraints(minWidth:36,minHeight:36),
        contentPadding:const EdgeInsets.only(right:10),
        border:OutlineInputBorder(borderRadius:BorderRadius.circular(7),borderSide:BorderSide(color:rule(c))),
        enabledBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(7),borderSide:BorderSide(color:rule(c))),
        focusedBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(7),borderSide:BorderSide(color:accent(c),width:1.5)),
      ),
    )))));

  Widget _current(BuildContext c)=>Column(children:[
    SizedBox(height:44,child:Row(children:[
      _month(c,Icons.chevron_left_rounded),
      Expanded(child:Text.rich(TextSpan(children:[
        TextSpan(text:'September',style:Theme.of(c).textTheme.titleLarge),
        TextSpan(text:'  2026',style:Theme.of(c).textTheme.bodyMedium?.copyWith(
          color:sub(c),fontFeatures:const[FontFeature.tabularFigures()])),
      ]),textAlign:TextAlign.center,maxLines:1)),
      _month(c,Icons.chevron_right_rounded),
    ])),
    const SizedBox(height:8),
    Container(color:surface(c),padding:const EdgeInsets.symmetric(vertical:10),
      child:Row(children:[
        Expanded(child:_metric(c,'This month','42+15',true)),
        Container(width:1,height:34,color:rule(c)),
        Expanded(child:_metric(c,'This year','318+40',true)),
      ])),
  ]);
  Widget _month(BuildContext c,IconData i)=>Semantics(button:true,child:InkWell(
    onTap:(){},borderRadius:BorderRadius.circular(7),
    child:SizedBox(width:44,height:44,child:Icon(i,size:20,color:sub(c)))));

  Widget _section(BuildContext c,String title,String action)=>SizedBox(height:44,child:Row(children:[
    Text(title,style:Theme.of(c).textTheme.titleMedium),const Spacer(),
    Semantics(button:true,label:action.replaceAll(' ›',''),child:InkWell(
      onTap:(){},borderRadius:BorderRadius.circular(7),
      child:SizedBox(height:44,child:Align(alignment:Alignment.centerRight,
        child:Text(action,style:Theme.of(c).textTheme.bodyMedium?.copyWith(color:sub(c),fontWeight:FontWeight.w500))))),
  ]));

  TextStyle _head(BuildContext c)=>Theme.of(c).textTheme.bodyMedium!.copyWith(
    fontSize:11.5,color:sub(c),fontWeight:FontWeight.w500);
  Widget _flightHeader(BuildContext c)=>_grid(
    Text('Date',textAlign:TextAlign.center,style:_head(c)),
    Text('Flight',textAlign:TextAlign.center,style:_head(c)),
    Text('Route',textAlign:TextAlign.center,style:_head(c)),
    Text('Block',textAlign:TextAlign.center,style:_head(c)));

  Widget _row(BuildContext c,String date,String carrier,String number,String dep,String arr,String block)=>
    SizedBox(height:31,child:_grid(
      Center(child:Text(date,style:mono(c))),
      Center(child:Row(mainAxisSize:MainAxisSize.min,children:[
        SizedBox(width:19,child:Text(carrier,style:Theme.of(c).textTheme.bodyLarge?.copyWith(fontSize:13.5,fontWeight:FontWeight.w500))),
        const SizedBox(width:2),
        SizedBox(width:42,child:Text(number,style:Theme.of(c).textTheme.bodyLarge?.copyWith(
          fontSize:13.5,fontWeight:FontWeight.w500,fontFeatures:const[FontFeature.tabularFigures()]))),
      ])),
      Center(child:Row(mainAxisSize:MainAxisSize.min,children:[
        SizedBox(width:36,child:Text(dep,textAlign:TextAlign.center,style:mono(c))),
        SizedBox(width:18,child:Text('→',textAlign:TextAlign.center,
          style:Theme.of(c).textTheme.bodyMedium?.copyWith(color:tertiary(c)))),
        SizedBox(width:36,child:Text(arr,textAlign:TextAlign.center,style:mono(c))),
      ])),
      Center(child:Text(block,textAlign:TextAlign.center,style:datum(c,13.5))),
    ));
  Widget _grid(Widget a,Widget b,Widget c,Widget d)=>Row(children:[
    Expanded(flex:23,child:a),Expanded(flex:25,child:b),
    Expanded(flex:30,child:c),Expanded(flex:22,child:d),
  ]);

  Widget _activity(BuildContext c)=>Column(children:[
    _section(c,'Activity','Details ›'),const SizedBox(height:6),
    Row(children:[for(final p in const['7 days','28 days','90 days','Custom'])
      Expanded(child:Semantics(selected:period==p,button:true,label:p,
        child:InkWell(onTap:()=>setState(()=>period=p),borderRadius:BorderRadius.circular(7),
          child:Container(height:44,margin:const EdgeInsets.symmetric(horizontal:2),
            alignment:Alignment.center,
            decoration:BoxDecoration(color:period==p?surface(c):Colors.transparent,borderRadius:BorderRadius.circular(7)),
            child:Text(p,style:Theme.of(c).textTheme.bodyMedium?.copyWith(
              color:period==p?Theme.of(c).colorScheme.onSurface:sub(c),
              fontWeight:period==p?FontWeight.w600:FontWeight.w400))))))]),
    const SizedBox(height:10),
    Row(children:[
      Expanded(child:_metric(c,'Legs','24',false)),
      Expanded(child:_metric(c,'Block','38+45',false)),
      Expanded(child:_metric(c,'TO / LD','24 / 24',false)),
    ]),
  ]);

  Widget _totals(BuildContext c)=>Column(children:[
    _section(c,'Totals','Details ›'),const SizedBox(height:8),
    Row(children:[
      Expanded(child:_metric(c,'Block','99,999+59',false)),
      Expanded(child:_metric(c,'Night','99,999+59',false)),
      Expanded(child:_metric(c,'Inst','99,999+59',false)),
    ]),
  ]);

  Widget _metric(BuildContext c,String label,String value,bool prominent)=>Column(children:[
    Text(label,textAlign:TextAlign.center,style:Theme.of(c).textTheme.bodyMedium?.copyWith(
      fontSize:11.5,color:sub(c),fontWeight:FontWeight.w500)),
    const SizedBox(height:2),
    Text(value,textAlign:TextAlign.center,maxLines:1,
      style:datum(c,prominent?17:15.5).copyWith(fontWeight:prominent?FontWeight.w600:FontWeight.w500)),
  ]);
}
