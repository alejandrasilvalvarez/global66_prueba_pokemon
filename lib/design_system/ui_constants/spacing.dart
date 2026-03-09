library com.curi.app.ui.layout;

import 'package:flutter/material.dart' hide Colors;
import 'layout.dart';

class Spacing {
  static Widget get spacingH4 => const SizedBox(width: UILayout.xsmall);
  static Widget get spacingV4 => const SizedBox(height: UILayout.xsmall);

  static Widget get spacingH8 => const SizedBox(width: UILayout.small);
  static Widget get spacingV8 => const SizedBox(height: UILayout.small);

  static Widget get spacingH12 => const SizedBox(width: 12);
  static Widget get spacingV12 => const SizedBox(height: 12);

  static Widget get spacingH16 => const SizedBox(width: UILayout.medium);
  static Widget get spacingV16 => const SizedBox(height: UILayout.medium);

  static Widget get spacingH24 => const SizedBox(width: UILayout.large);
  static Widget get spacingV24 => const SizedBox(height: UILayout.large);

  static Widget get spacingH32 => const SizedBox(width: UILayout.mlarge);
  static Widget get spacingV32 => const SizedBox(height: UILayout.mlarge);

  static Widget get spacingH48 => const SizedBox(width: UILayout.xlarge);
  static Widget get spacingV48 => const SizedBox(height: UILayout.xlarge);

  static Widget get spacingH96 => const SizedBox(width: UILayout.xxlarge);
  static Widget get spacingV96 => const SizedBox(height: UILayout.xxlarge);
}
