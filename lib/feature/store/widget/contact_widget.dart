import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Column(
              children: List.generate(
                2,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          width: size.width * 0.45,
                          height: size.height * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Avatar: The War of Water',
                                style: semiBoldDefault,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Avatar: The War of Water',
                                style: semiBoldDefault,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 15),
                              Text(
                                '1 mn  15 sec',
                                style: semiBoldSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 500,
            )
          ],
        ),
      ),
    );
  }
}