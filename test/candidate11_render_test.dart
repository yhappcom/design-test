import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logmate_visual_preview/home_candidate_11_visual.dart';
Future<void> shot(WidgetTester t,Brightness b,String f)async{await t.binding.setSurfaceSize(const Size(390,844));addTearDown(()=>t.binding.setSurfaceSize(null));await t.pumpWidget(MaterialApp(debugShowCheckedModeBanner:false,theme:ThemeData(brightness:Brightness.light),darkTheme:ThemeData(brightness:Brightness.dark),themeMode:b==Brightness.dark?ThemeMode.dark:ThemeMode.light,home:const HomeCandidate11Visual()));await t.pumpAndSettle();await expectLater(find.byType(Scaffold).first,matchesGoldenFile('goldens/$f'));}
void main(){testWidgets('Candidate 11 light 390x844',(t)=>shot(t,Brightness.light,'candidate11_light_390x844.png'));testWidgets('Candidate 11 dark 390x844',(t)=>shot(t,Brightness.dark,'candidate11_dark_390x844.png'));}
