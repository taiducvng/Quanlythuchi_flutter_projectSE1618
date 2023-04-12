import 'package:flutter/material.dart';

extension BuildContextMapping on BuildContext {
  AppBar materialYouAppBar(
    String title, {
    List<Widget>? actions,
    Widget? leadingWidget,
  }) =>
      AppBar(
        leading: leadingWidget,
        title: Text(title),
        titleTextStyle: Theme.of(this)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
        actions: actions ?? [],
      );

  showMaterialSnackBar(
    String content, {
    Color? backgroundColor,
    Color? color,
  }) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Text(
            content,
            style: TextStyle(
              color: color ?? Theme.of(this).colorScheme.onSurface,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor:
              backgroundColor ?? Theme.of(this).colorScheme.surface,
        ),
      );
}
