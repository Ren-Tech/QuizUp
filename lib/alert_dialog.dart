import 'package:flutter/material.dart';
import 'constant.dart';

class CustomAlertDialog extends StatelessWidget {
  final int scoreValue;
  const CustomAlertDialog({super.key, required this.scoreValue});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: kGreyCloseIcon,
            ),
          ),
          const Column(
            children: [
              Text(
                'FINISHED!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                'End of the quiz.',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
