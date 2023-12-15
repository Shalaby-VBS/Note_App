import 'package:flutter/material.dart';

class CustomFormBottn extends StatelessWidget {
  final void Function()? onPressed;
  final bool loadingIndecator;
  const CustomFormBottn(
      {super.key, this.onPressed, this.loadingIndecator = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onPressed,
        color: const Color(0xff62FFD8),
        child: loadingIndecator
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : const Text(
                'Add',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
      ),
    );
  }
}
