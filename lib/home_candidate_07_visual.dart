import 'package:flutter/material.dart';
import 'primitives.dart';

class HomeCandidate07Visual extends StatefulWidget {
  const HomeCandidate07Visual({super.key});
  @override State<HomeCandidate07Visual> createState()=>_S();
}
class _S extends State<HomeCandidate07Visual>{
 String period='7 days';
 @override Widget build(BuildContext context){
  final dark=Theme.of(context).brightness==Brightness.dark;
  final ink=dark?const Color(0xFFE8EBE7):const Color(0xFF20251F);
  final sub=dark?const Color(0xFFAAB1A9):const Color(0xFF596158);
  final rule=dark?const Color(0xFF39413A):const Color(0xFFCCD3CB);
  final accent=dark?const Color(0xFF9ED5A8):const Color(0xFF2E7040);
  final canvas=dark?const Color(0xFF141814):const Color(0xFFF3F5EF);
  TextStyle tx(double s,{FontWeight w=FontWeight.w500,Color? c})=>TextStyle(fontSize:s,height:1.1,fontWeight:w,color:c??ink);
  Widget heading(String s,{Widget? trailing})=>SizedBox(height:42,child:Row(children:[Expanded(child:Text(s,style:tx(15,w:FontWeight.w700),maxLines:1)),if(trailing!=null)...[const SizedBox(width:8),Flexible(child:Align(alignment:Alignment.centerRight,child:trailing))]]));
  Widget link(String s)=>ConstrainedBox(constraints:const BoxConstraints(minHeight:44),child:Center(child:Text(s,style:tx(10.5,w:FontWeight.w600,c:sub))));
  Widget metric(String label,String value)=>Expanded(child:Padding(padding:const EdgeInsets.symmetric(vertical:11),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(label,style:tx(10.5,w:FontWeight.w600,c:sub)),const SizedBox(height:6),Text(value,style:tx(19,w:FontWeight.w600))])));
  Widget summary(List<(String,String)> xs)=>Container(decoration:BoxDecoration(border:Border(top:BorderSide(color:rule),bottom:BorderSide(color:rule))),child:Row(children:[for(var i=0;i<xs.length;i++)...[Expanded(child:Padding(padding:const EdgeInsets.symmetric(vertical:10),child:Column(children:[Text(xs[i].$1,style:tx(10.5,w:FontWeight.w600,c:sub)),const SizedBox(height:6),Text(xs[i].$2,style:tx(13.5,w:FontWeight.w600))]))),if(i<xs.length-1)Container(width:1,height:28,color:rule)]]));
  Widget action(IconData icon,String label)=>Expanded(child:InkWell(onTap:(){},child:SizedBox(height:44,child:Row(mainAxisAlignment:MainAxisAlignment.center,children:[Icon(icon,size:16,color:sub),const SizedBox(width:6),Flexible(child:Text(label,textAlign:TextAlign.center,maxLines:1,style:tx(13,w:FontWeight.w600))) ]))));
  Widget flight(String date,String carrier,String no,String dep,String arr,String block)=>SizedBox(height:38,child:Row(children:[SizedBox(width:52,child:Text(date,style:tx(11.5,c:sub))),SizedBox(width:76,child:Text('$carrier  $no',style:tx(12.5))),Expanded(child:Text('$dep  →  $arr',style:tx(12.5))),SizedBox(width:48,child:Text(block,textAlign:TextAlign.end,style:tx(12,c:sub)))]));
  return Theme(data:ThemeData(brightness:dark?Brightness.dark:Brightness.light,useMaterial3:true,scaffoldBackgroundColor:canvas,colorScheme:ColorScheme.fromSeed(seedColor:accent,brightness:dark?Brightness.dark:Brightness.light,surface:canvas)),child:PreviewPage(padding:const EdgeInsets.fromLTRB(20,8,20,24),child:Builder(builder:(context)=>Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
   SizedBox(height:44,child:Stack(alignment:Alignment.center,children:[Text('LOGMATE',style:tx(17,w:FontWeight.w800).copyWith(letterSpacing:1.2)),Align(alignment:Alignment.centerRight,child:IconButton(onPressed:(){},tooltip:'Settings',icon:Icon(Icons.settings_outlined,size:18,color:sub)))])),
   Container(decoration:BoxDecoration(border:Border(top:BorderSide(color:rule),bottom:BorderSide(color:rule))),child:Row(children:[action(Icons.add_rounded,'Add Flight'),Container(width:1,height:18,color:rule),action(Icons.menu_book_outlined,'View Logbook')])),
   const SizedBox(height:4),UnderlineSearch(hint:'Search logbook'),const SizedBox(height:12),
   heading('Current Period',trailing:Row(children:[IconButton(onPressed:(){},tooltip:'Previous month',icon:Icon(Icons.chevron_left,size:17,color:sub)),Text('09/2026',style:tx(10.5,w:FontWeight.w700)),IconButton(onPressed:(){},tooltip:'Next month',icon:Icon(Icons.chevron_right,size:17,color:sub))])),
   Container(decoration:BoxDecoration(border:Border(top:BorderSide(color:rule),bottom:BorderSide(color:rule))),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Padding(padding:const EdgeInsets.only(top:9),child:Text('Block Time',style:tx(10.5,w:FontWeight.w600,c:sub))),Row(children:[metric('This month','42+15'),Container(width:1,height:46,color:rule),metric('This year','318+40')])])),
   const SizedBox(height:14),heading('Recent Flights',trailing:link('View all ›')),
   SizedBox(height:24,child:Row(children:[SizedBox(width:52,child:Text('Date',style:tx(10.5,c:sub))),SizedBox(width:76,child:Text('Flight',style:tx(10.5,c:sub))),Expanded(child:Text('Route',style:tx(10.5,c:sub))),SizedBox(width:48,child:Text('Block',textAlign:TextAlign.end,style:tx(10.5,c:sub)))])),
   Divider(height:1,color:rule),flight('09.02','7C','132','GMP','CJU','1+12'),Divider(height:1,color:rule),flight('08.31','7C','1123','CJU','GMP','1+08'),Divider(height:1,color:rule),flight('08.29','KE','28','GMP','CJU','1+10'),Divider(height:1,color:rule),
   const SizedBox(height:14),heading('Activity',trailing:link('Details ›')),
   Row(children:[for(final p in ['7 days','28 days','90 days','Custom'])Expanded(child:InkWell(onTap:()=>setState(()=>period=p),child:Container(height:44,decoration:BoxDecoration(border:Border(bottom:BorderSide(width:period==p?2:1,color:period==p?accent:rule))),child:Center(child:Text(p,style:tx(10.5,w:period==p?FontWeight.w700:FontWeight.w500,c:period==p?ink:sub))))))]),const SizedBox(height:8),summary([('Legs','4'),('Block','6+48'),('TO / LD','3 / 3')]),
   const SizedBox(height:14),heading('Totals',trailing:link('Details ›')),summary([('Total','1,284+35'),('B737','842+10'),('SIC','1,163+55')]),
  ]))));
 }
}
