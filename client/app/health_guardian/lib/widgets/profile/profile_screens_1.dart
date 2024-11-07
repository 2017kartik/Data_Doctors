import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health_guardian/getX_controllers/profile/profile_controller.dart';
import 'package:health_guardian/styling/colors.dart';
import 'package:health_guardian/widgets/profile/profile_screens.dart';

final ProfileController profileController = Get.put(ProfileController());

Widget screen3(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      children: [
        //* select the birthday date

        SizedBox(height: 15),
        profileScreenText("When is your birthday?"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button("Date", () {
              Get.bottomSheet(
                Container(
                    height: 250,
                    color: Colors.white,
                    child: CupertinoDatePicker(
                      initialDateTime: profileController.selectedDate.value,
                      mode: CupertinoDatePickerMode.date,
                      minimumDate: DateTime(1900),
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        profileController.changeTime(newDate);
                      },
                    )),
              );
            }, Colours.buttonColorRed, Colors.white),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colours.buttonColorRed,
              size: 36,
            ),
            Obx(
              () => valueBox(
                  "${profileController.selectedDate.value.day}/${profileController.selectedDate.value.month}/${profileController.selectedDate.value.year}"),
            ),
          ],
        ),
        SizedBox(height: 45),

        //* select the weight

        profileScreenText("What's your weight?"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button("Weight", () {
              Get.bottomSheet(
                Container(
                  height: 250,
                  color: Colors.white,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: profileController.selectedWeight.value - 1,
                    ),
                    onSelectedItemChanged: (int index) {
                      profileController.changeWeight(index + 1);
                    },
                    children: List<Widget>.generate(100, (int index) {
                      return Center(
                        child: Text(
                          "${index + 1} kg",
                          style: TextStyle(
                              fontFamily: "CoreSansBold", fontSize: 26),
                        ),
                      );
                    }),
                  ),
                ),
              );
            }, Colours.buttonColorRed, Colors.white),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colours.buttonColorRed,
              size: 36,
            ),
            Obx(
              () => valueBox("${profileController.selectedWeight.value} kg"),
            ),
          ],
        ),
        SizedBox(height: 45),

        //* select the height

        profileScreenText("How tall are you?"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            button("Height", () {
              Get.bottomSheet(
                Container(
                  height: 250,
                  color: Colors.white,
                  child: CupertinoPicker(
                    itemExtent: 40,
                    scrollController: FixedExtentScrollController(
                      initialItem: profileController.selectedHeight.value,
                    ),
                    onSelectedItemChanged: (int index) {
                      profileController.changeHeight(index);
                    },
                    children: List<Widget>.generate(301, (int index) {
                      return Center(
                        child: Text(
                          "$index cm",
                          style: TextStyle(
                              fontFamily: "CoreSansBold", fontSize: 26),
                        ),
                      );
                    }),
                  ),
                ),
              );
            }, Colours.buttonColorRed, Colors.white),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colours.buttonColorRed,
              size: 36,
            ),
            Obx(
              () => valueBox("${profileController.selectedHeight.value} cm"),
            )
          ],
        ),
      ],
    ),
  );
}

Widget button(
    String title, void Function() onTap, Color color, Color textColor) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(35)),
      height: 55,
      width: 160,
      child: Center(
        child: FittedBox(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontFamily: "CoreSansLight",
              fontWeight: FontWeight.bold,
            ).copyWith(fontSize: 24),
          ),
        ),
      ),
    ),
  );
}

Widget valueBox(String value) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)),
    height: 60,
    width: 200,
    child: Center(
      child: Text(
        value,
        style: TextStyle(
          color: Color.fromARGB(255, 49, 48, 48),
          fontFamily: "CoreSansLight",
          fontWeight: FontWeight.bold,
        ).copyWith(fontSize: 23),
      ),
    ),
  );
}