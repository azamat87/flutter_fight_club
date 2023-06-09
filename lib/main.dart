import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  BodyPart? defendingBodyPart;
  BodyPart? attackingBodyPart;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(width: 16,),
              Expanded(child: Center(child: Text("You"),)),
              SizedBox(width: 12,),
              Expanded(child: Center(child: Text("Enemy"),)),
              SizedBox(width: 16,)
            ],
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Text("Defend".toUpperCase()),
                    SizedBox(height: 13),
                    BodyPartButton(bodyPart: BodyPart.head,
                      selected: defendingBodyPart == BodyPart.head,
                      bodyValueSetter: _selectDefendingBodyPart,
                    ),
                    SizedBox(height: 14),
                    BodyPartButton(bodyPart: BodyPart.torso,
                      selected: defendingBodyPart == BodyPart.torso,
                      bodyValueSetter: _selectDefendingBodyPart,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    Text("Attack".toUpperCase()),
                    SizedBox(height: 13),
                    BodyPartButton(bodyPart: BodyPart.head,
                      selected: attackingBodyPart == BodyPart.head,
                      bodyValueSetter: _selectAttackingBodyPart
                    ),
                    SizedBox(height: 14),
                    BodyPartButton(bodyPart: BodyPart.torso,
                      selected: attackingBodyPart == BodyPart.torso,
                      bodyValueSetter: _selectAttackingBodyPart
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 14,),
          Row(
            children: [
              SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ColoredBox(
                    color: Color.fromRGBO(0, 0, 0, 0.87),
                    child: Center(
                        child: Text("Go".toUpperCase(), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.white),)),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 40),
        ],
      )
    );
  }

  void _selectDefendingBodyPart(final BodyPart value) {
     setState(() {
       defendingBodyPart = value;
     });
  }

  void _selectAttackingBodyPart(final BodyPart value) {
     setState(() {
       attackingBodyPart = value;
     });
  }
}

class BodyPart {

  final String name;

  const BodyPart._(this.name);

  static const head = BodyPart._("Head");
  static const torso = BodyPart._("Torso");

  @override
  String toString() {
    return 'BodyPart{name: $name}';
  }
}

class BodyPartButton extends StatelessWidget {

  final BodyPart bodyPart;
  final bool selected;
  final ValueSetter<BodyPart> bodyValueSetter;

  const BodyPartButton({
    super.key,
    required this.bodyPart, required this.selected, required this.bodyValueSetter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bodyValueSetter(bodyPart),
      child: SizedBox(
        height: 40,
        child: ColoredBox(
          color: selected? const Color.fromRGBO(28, 121, 206, 1) : Colors.black26,
          child: Center(child: Text(bodyPart.name.toUpperCase())),
        ),
      ),
    );
  }
}
