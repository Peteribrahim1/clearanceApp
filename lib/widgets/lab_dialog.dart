import 'package:flutter/material.dart';

import '../styles/styles.dart';

class LabDialog extends StatelessWidget {
  const LabDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: const Color.fromRGBO(20, 10, 38, 1),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.50,
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            const Text(
              'Sorry! You have pending laboratory issues resolve before you can continue with your clearance. Kindly proceed to your coordinator for more information.',
              style: Styles.normalTextStyle,
            ),
            // AppSpace.vertical12,
          ],
        ),
      ),
    );
  }
}
