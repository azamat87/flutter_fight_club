import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fight_club/pages/fight_page.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _MainPageContent();
  }
}

class _MainPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                "The\nFight\nClub".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30, color: FightClubColors.darkGreyText),
              ),
            ),
            Expanded(child: SizedBox()),
            FutureBuilder<String>(
                future: SharedPreferences.getInstance()
                    .then((value) => value.getString("last_fight_result")!),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return SizedBox();
                  }
                  return Center(
                    child: Text(snapshot.data!),
                  );
                }),
            Expanded(child: SizedBox()),
            ActionButton(
                text: "Start".toUpperCase(),
                voidCallback: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FightPage()));
                },
                color: FightClubColors.blackButton),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
