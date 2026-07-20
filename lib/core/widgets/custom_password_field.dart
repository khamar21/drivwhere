import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction textInputAction;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  // bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: size.height * .003),
        ],

        Container(
          height: 48,
          width: 388,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.10),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: widget.controller,
            // obscureText: _obscureText,
            //  validator: widget.validator,
            onChanged: widget.onChanged,
            textInputAction: widget.textInputAction,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: size.width * .045,
                vertical: size.height * .02,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  "assets/images/eye.svg",
                  width: 20,
                  height: 20,
                ),
              ),
              // suffixIcon: IconButton(
              //   onPressed: () {
              //     setState(() {
              //       _obscureText = !_obscureText;
              //     });
              //   },
              //   // icon: Icon(
              //   //   _obscureText
              //   //       ? Icons.visibility_off_outlined
              //   //       : Icons.visibility_outlined,
              //   //   color: Colors.grey,
              //   //   size: 20,
              //   // ),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
