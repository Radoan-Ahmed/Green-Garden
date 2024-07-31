import 'package:flutter/material.dart';

showErrorDialog(
  BuildContext context,
  String message,
  String title,
) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.7,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "ok",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

// class CommonErrorDialog extends StatefulWidget {
//   const CommonErrorDialog({super.key});

//   @override
//   State<CommonErrorDialog> createState() => _CommonErrorDialogState();
// }

// class _CommonErrorDialogState extends State<CommonErrorDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
