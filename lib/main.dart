import 'package:flutter/material.dart';
import 'first_use.dart';
import 'home_v0_5.dart';
import 'home_v0_7.dart';
import 'home_v0_8.dart';
import 'home_v0_9.dart';
import 'home_v0_10.dart';
import 'home_v0_11.dart';
import 'premium_v0_6.dart';
import 'tokens.dart';

void main() => runApp(const LogMateVisualPreview());

class LogMateVisualPreview extends StatefulWidget {
  const LogMateVisualPreview({super.key});

  @override
  State<LogMateVisualPreview> createState() => _LogMateVisualPreviewState();
}

class _LogMateVisualPreviewState extends State<LogMateVisualPreview> {
  ThemeMode themeMode = ThemeMode.light;
  int index = 0;

  static const screens = <Widget>[
    HomeV011(),
    HomeV010(),
    HomeV09(),
    HomeV08(),
    HomeV07(),
    HomeV06(),
    HomeV05(),
    WelcomePreview(),
    PreviousTotalPreview(),
    EmptyHomePreview(),
  ];

  static const labels = <String>[
    'Home B v0.11 System Consolidation',
    'Home B v0.10 Precision Recomposition',
    'Home B v0.9 Balanced Grid',
    'Home B v0.8 Stable Data',
    'Home B v0.7.1 Type/Layout',
    'Home B v0.6 Premium',
    'Home B v0.5',
    'Welcome',
    'Previous Total',
    'Empty Home',
  ];

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LogMate Visual Preview',
        theme: PreviewTheme.light(),
        darkTheme: PreviewTheme.dark(),
        themeMode: themeMode,
        home: Scaffold(
          body: Row(
            children: [
              SizedBox(
                width: 220,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'DESIGN PREVIEW',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        for (var i = 0; i < labels.length; i++)
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text(labels[i]),
                            selected: index == i,
                            onTap: () => setState(() => index = i),
                          ),
                        const Spacer(),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Dark'),
                          value: themeMode == ThemeMode.dark,
                          onChanged: (value) => setState(
                            () => themeMode =
                                value ? ThemeMode.dark : ThemeMode.light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.surface,
                  child: Center(
                    child: SizedBox(
                      width: 390,
                      height: 844,
                      child: ClipRect(child: screens[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
