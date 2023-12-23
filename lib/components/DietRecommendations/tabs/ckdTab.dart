// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CkdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Foods to Limit",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Eat less salt/sodium. That's a good move for diabetes and really important for CKD. Over time, your kidneys lose the ability to control your sodium-water balance. Less sodium in your diet will help lower blood pressure and decrease fluid buildup in your body, which is common in kidney disease.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "Focus on fresh, homemade food and eat only small amounts of restaurant food and packaged food, which usually have lots of sodium. Look for low sodium (5% or less) on food labels.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                "In a week or two, you'll get used to less salt in your food, especially if you dial up the flavor with herbs, spices, mustard, and flavored vinegars. But don't use salt substitutes unless your doctor or dietitian says you can. Many are very high in potassium, which you may need to limit.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                "Recommended steps to eating right",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Choose and prepare foods with less salt and sodium",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Why? To help control your blood pressure. Your diet should contain less than 2,300 milligrams of sodium each day.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Buy fresh food often. Sodium (a part of salt) is added to many prepared or packaged foods you buy at the supermarket or at restaurants.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                "Eat the right amount and the right types of protein",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Why? To help protect your kidneys. When your body uses protein, it produces waste. Your kidneys remove this waste. Eating more protein than you need may make your kidneys work harder.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Eat small portions of protein foods.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Protein is found in foods from plants and animals. Most people eat both types of protein. Talk to your dietitian about how to choose the right combination of protein foods for you.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Animal-protein foods:",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Chicken\nFish\nMeat\nEggs\nDairy\nA cooked portion of chicken, fish, or meat is about 2 to 3 ounces or about the size of a deck of cards. A portion of dairy foods is ½ cup of milk or yogurt, or one slice of cheese.",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                "Plant-protein foods:",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Beans\nNuts\nGrains\nA portion of cooked beans is about ½ cup, and a portion of nuts is ¼ cup. A portion of bread is a single slice, and a portion of cooked rice or cooked noodles is ½ cup.",
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
