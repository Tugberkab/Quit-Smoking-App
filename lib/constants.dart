import 'package:flutter/material.dart';

const primaryColor = Color(0xFF591fe5);
const secondaryColor = Color(0xFF874bd1);
const gradientTB = LinearGradient(
  colors: [primaryColor, secondaryColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const gradientLR = LinearGradient(
  colors: [primaryColor, secondaryColor],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const welcomeText = 'Sigarayı bırakmaya hazır mısın?';
