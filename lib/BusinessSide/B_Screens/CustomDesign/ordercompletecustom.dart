import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';

class OrderCompletCustom extends StatefulWidget {
  const OrderCompletCustom({super.key});

  @override
  State<OrderCompletCustom> createState() => _OrderCompletCustomState();
}

AppText appText = AppText();

class _OrderCompletCustomState extends State<OrderCompletCustom> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appText.completeordernames.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.1, 0.1),
                    spreadRadius: 1,
                    blurRadius: 8)
              ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                title: Text(
                  appText.completeordernames[index],
                  style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      color: Color(0xFF9AD6FB),
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Row(
                  children: [
                    Text(
                      'Completed',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(AppText.date),
                  ],
                ),
                trailing: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9AD6FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      CupertinoIcons.chat_bubble,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
