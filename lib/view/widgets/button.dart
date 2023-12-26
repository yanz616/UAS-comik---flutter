import 'package:flutter/material.dart';
import 'package:mobile3/shared/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.OnPressed,
  });

  final String title;
  final double width;
  final double height;
  final VoidCallback? OnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: OnPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.OnPressed,
  });

  final String title;
  final double width;
  final double height;
  final VoidCallback? OnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: OnPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}

class CustomBannerButton extends StatelessWidget {
  const CustomBannerButton({
    super.key,
    required this.title,
    this.width = 100,
    this.height = 40,
    this.OnPressed,
  });

  final String title;
  final double width;
  final double height;
  final VoidCallback? OnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: OnPressed,
        style: TextButton.styleFrom(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
