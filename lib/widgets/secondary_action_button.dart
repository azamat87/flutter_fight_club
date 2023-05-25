
import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';

class SecondaryActionButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;

  const SecondaryActionButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border:
        Border.all(color: FightClubColors.darkGreyText, width: 2),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              fontSize: 13,
              color: FightClubColors.darkGreyText,
              fontWeight: FontWeight.w400
          )),
    );
  }

}