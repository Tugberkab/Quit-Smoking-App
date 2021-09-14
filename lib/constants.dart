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

const welcomeText =
    'Tebrikler! Sigarayı bırakma adına büyük bir adım atmış bulunmaktasınız. Bu uygulama sayesinde sigarı bırakma anından itibaren size sunduğumuz dataları görebilirsiniz.';
