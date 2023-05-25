import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fight_club/fight_result.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/resources/fight_club_texts.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FightClubColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16, left: 16, top: 24),
              child: Text(
                FightClubTexts.statistics,
                style: TextStyle(
                    fontSize: 24, color: FightClubColors.darkGreyText),
              ),
            ),
            Expanded(child: SizedBox.shrink()),
            FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return SizedBox();
                  }
                  final SharedPreferences pref = snapshot.data!;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Won: ${pref.getInt("stats_won") ?? 0}",
                        style: TextStyle(
                            fontSize: 16, color: FightClubColors.darkGreyText),
                      ),
                      SizedBox(height: 6,),
                      Text(
                        "Lose: ${pref.getInt("stats_lose") ?? 0}",
                        style: TextStyle(
                            fontSize: 16, color: FightClubColors.darkGreyText),
                      ),
                      SizedBox(height: 6,),
                      Text(
                        "Draw: ${pref.getInt("stats_draw") ?? 0}",
                        style: TextStyle(
                            fontSize: 16, color: FightClubColors.darkGreyText),
                      ),
                    ],
                  );
                }),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: SecondaryActionButton(
                text: "Back",
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
