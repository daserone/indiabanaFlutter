import 'package:flutter/material.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class NewProductStepperItem extends StatelessWidget {
  final bool isDone;
  final int index;
  final String title;
  const NewProductStepperItem(
      {super.key,
      required this.isDone,
      required this.index,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: Row(
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: ColorConstants.indiabanaDarkBlue,
            child: isDone
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  )
                : Text('${index + 1}'),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
                color: ColorConstants.indiabanaDarkBlue,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
