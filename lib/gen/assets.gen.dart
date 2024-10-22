/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/iconsax.ttf
  String get iconsax => 'assets/fonts/iconsax.ttf';

  /// List of all assets
  List<String> get values => [iconsax];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/induko_blue.png
  AssetGenImage get indukoBlue =>
      const AssetGenImage('assets/png/induko_blue.png');

  /// File path: assets/png/induko_white.png
  AssetGenImage get indukoWhite =>
      const AssetGenImage('assets/png/induko_white.png');

  /// File path: assets/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/png/logo.png');

  /// File path: assets/png/logo_purple.png
  AssetGenImage get logoPurple =>
      const AssetGenImage('assets/png/logo_purple.png');

  /// File path: assets/png/logo_white.png
  AssetGenImage get logoWhite =>
      const AssetGenImage('assets/png/logo_white.png');

  /// File path: assets/png/logo_white_bg_yellow.png
  AssetGenImage get logoWhiteBgYellow =>
      const AssetGenImage('assets/png/logo_white_bg_yellow.png');

  /// File path: assets/png/logo_yellow.png
  AssetGenImage get logoYellow =>
      const AssetGenImage('assets/png/logo_yellow.png');

  /// File path: assets/png/placeholder_profile.png
  AssetGenImage get placeholderProfile =>
      const AssetGenImage('assets/png/placeholder_profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        indukoBlue,
        indukoWhite,
        logo,
        logoPurple,
        logoWhite,
        logoWhiteBgYellow,
        logoYellow,
        placeholderProfile
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/arrow_back_ic.svg
  String get arrowBackIc => 'assets/svg/arrow_back_ic.svg';

  /// File path: assets/svg/chat_ic.svg
  String get chatIc => 'assets/svg/chat_ic.svg';

  /// File path: assets/svg/de.svg
  String get de => 'assets/svg/de.svg';

  /// File path: assets/svg/idea_ic.svg
  String get ideaIc => 'assets/svg/idea_ic.svg';

  /// File path: assets/svg/more_vertical_ic.svg
  String get moreVerticalIc => 'assets/svg/more_vertical_ic.svg';

  /// File path: assets/svg/robot_ic_circle.svg
  String get robotIcCircle => 'assets/svg/robot_ic_circle.svg';

  /// File path: assets/svg/us.svg
  String get us => 'assets/svg/us.svg';

  /// List of all assets
  List<String> get values =>
      [arrowBackIc, chatIc, de, ideaIc, moreVerticalIc, robotIcCircle, us];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
