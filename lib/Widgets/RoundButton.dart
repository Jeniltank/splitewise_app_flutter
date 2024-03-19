import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool loding;
  const RoundButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.loding = false,
      required bool loading})
      : super(key: key);

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: widget.loding
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  widget.title,
                  style: TextStyle(color: Colors.white),
                ), // Access title from the widget object
        ),
      ),
    );
  }
}
