import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fight_club/fight_result.dart';
import 'package:flutter_fight_club/pages/fight_page.dart';
import 'package:flutter_fight_club/pages/statistics_page.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/resources/fight_club_preference_key.dart';
import 'package:flutter_fight_club/resources/fight_club_texts.dart';
import 'package:flutter_fight_club/widgets/action_button.dart';
import 'package:flutter_fight_club/widgets/fight_result_widget.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
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
                future: SharedPreferences.getInstance().then(
                    (value) => value.getString(PreferenceKey.lastFightResult)!),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return SizedBox();
                  }
                  final FightResult fightResult =
                      FightResult.getByName(snapshot.data!);

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Last fight result",
                        style: TextStyle(
                            fontSize: 14, color: FightClubColors.darkGreyText),
                      ),
                      SizedBox(height: 12),
                      FightResultWidget(fightResult: fightResult),
                    ],
                  );
                }),
            Expanded(child: SizedBox()),
            SecondaryActionButton(
                text: FightClubTexts.statistics,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StatisticsPage()));
                }),
            const SizedBox(
              height: 12,
            ),
            ActionButton(
                text: FightClubTexts.start.toUpperCase(),
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
