import 'package:flutter/material.dart';
import 'package:marj_card_style_example/app_const.dart';
import 'package:marj_card_styles/marj_card_styles.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  CardModel card = defaultCard;

  late TabController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TabController(
      length: CardStyle.values.length,
      initialIndex: 1,
      vsync: this,
    );
  }

  void toggleThemeMode() {
    setState(() => card = card.toggleMode());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MARJTheme.light,
      darkTheme: MARJTheme.dark,
      themeMode: card.themeMode,
      home: Center(
        child: Container(
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(),
            ),
          ),
          width: 800,

          ///* Start ---------------------------
          child: Scaffold(
            appBar: AppBar(
              title: const Text('STYLES'),
              actions: [
                Text(card.themeMode.name),
                Switch(
                  value: card.themeMode == ThemeMode.light,
                  onChanged: (value) => toggleThemeMode(),
                ),
              ],
              bottom: TabBar(
                controller: _ctrl,
                tabs: [
                  ...CardStyle.values.map((e) => Tab(text: e.name)),
                ],
              ),
            ),
            body: TabBarView(
              controller: _ctrl,
              children: [
                ...CardStyle.values.map(
                  (e) => SingleChildScrollView(
                    child: e.styled(card),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
