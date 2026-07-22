import 'package:flutter/material.dart';

class StatusColors extends ThemeExtension<StatusColors> {
  final Color? occupiedBackground;
  final Color? occupiedText;
  final Color? reservedBackground;
  final Color? reservedText;
  final Color? availableBackground;
  final Color? availableText;
  final Color? dirtyBackground;
  final Color? dirtyText;

  const StatusColors({
    this.occupiedBackground,
    this.occupiedText,
    this.reservedBackground,
    this.reservedText,
    this.availableBackground,
    this.availableText,
    this.dirtyBackground,
    this.dirtyText,
  });

  @override
  ThemeExtension<StatusColors> copyWith({
    Color? occupiedBackground,
    Color? occupiedText,
    Color? reservedBackground,
    Color? reservedText,
    Color? availableBackground,
    Color? availableText,
    Color? dirtyBackground,
    Color? dirtyText,
  }) {
    return StatusColors(
      occupiedBackground: occupiedBackground ?? this.occupiedBackground,
      occupiedText: occupiedText ?? this.occupiedText,
      reservedBackground: reservedBackground ?? this.reservedBackground,
      reservedText: reservedText ?? this.reservedText,
      availableBackground: availableBackground ?? this.availableBackground,
      availableText: availableText ?? this.availableText,
      dirtyBackground: dirtyBackground ?? this.dirtyBackground,
      dirtyText: dirtyText ?? this.dirtyText,
    );
  }

  @override
  ThemeExtension<StatusColors> lerp(
    covariant ThemeExtension<StatusColors>? other,
    double t,
  ) {
    if (other is! StatusColors) {
      return this;
    }
    return StatusColors(
      occupiedBackground: Color.lerp(
        occupiedBackground,
        other.occupiedBackground,
        t,
      ),
      occupiedText: Color.lerp(occupiedText, other.occupiedText, t),
      reservedBackground: Color.lerp(
        reservedBackground,
        other.reservedBackground,
        t,
      ),
      reservedText: Color.lerp(reservedText, other.reservedText, t),
      availableBackground: Color.lerp(
        availableBackground,
        other.availableBackground,
        t,
      ),
      availableText: Color.lerp(availableText, other.availableText, t),
      dirtyBackground: Color.lerp(dirtyBackground, other.dirtyBackground, t),
      dirtyText: Color.lerp(dirtyText, other.dirtyText, t),
    );
  }
}
