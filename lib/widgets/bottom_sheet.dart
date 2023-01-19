import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void SettingsBottomSheet(BuildContext context) => showModalBottomSheet(
    context: context,
    builder: (builder) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AbsorbPointer(
                  //ToAvoidRemovalOfBottomSheetOnTouchingIt
                  //There is also other widget named IgnorePointer which won't even allow its child to receive touch events
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Theme.of(context).colorScheme.secondary,
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),

                            Flexible(
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            //Next Widget is just made to center the 'Settings' text at center as the crossAxis..is spaceBetween
                            Opacity(
                              opacity: 0.0,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back), //Just random Icon
                                onPressed: null,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/night.svg',
                                height: 30,
                                width: 30,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              title: Text(
                                'Dark Theme',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                            ListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/sleep-time.svg',
                                height: 35,
                                width: 35,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              title: Text(
                                'Sleep Timer',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.announcement_rounded,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              title: Text(
                                'About',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/coffee.svg',
                                height: 25,
                                width: 25,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              title: Text(
                                'Buy me a coffee',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    backgroundColor: Colors.transparent);
