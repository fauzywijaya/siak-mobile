/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_book.svg
  SvgGenImage get iconBook => const SvgGenImage('assets/icons/icon_book.svg');

  /// File path: assets/icons/icon_bsi.svg
  SvgGenImage get iconBsi => const SvgGenImage('assets/icons/icon_bsi.svg');

  /// File path: assets/icons/icon_card.svg
  SvgGenImage get iconCard => const SvgGenImage('assets/icons/icon_card.svg');

  /// File path: assets/icons/icon_card_va.svg
  SvgGenImage get iconCardVa =>
      const SvgGenImage('assets/icons/icon_card_va.svg');

  /// File path: assets/icons/icon_collage.svg
  SvgGenImage get iconCollage =>
      const SvgGenImage('assets/icons/icon_collage.svg');

  /// File path: assets/icons/icon_dpa.svg
  SvgGenImage get iconDpa => const SvgGenImage('assets/icons/icon_dpa.svg');

  /// File path: assets/icons/icon_google.svg
  SvgGenImage get iconGoogle =>
      const SvgGenImage('assets/icons/icon_google.svg');

  /// File path: assets/icons/icon_home.svg
  SvgGenImage get iconHome => const SvgGenImage('assets/icons/icon_home.svg');

  /// File path: assets/icons/icon_ip.svg
  SvgGenImage get iconIp => const SvgGenImage('assets/icons/icon_ip.svg');

  /// File path: assets/icons/icon_jadwal.svg
  SvgGenImage get iconJadwal =>
      const SvgGenImage('assets/icons/icon_jadwal.svg');

  /// File path: assets/icons/icon_lectures.svg
  SvgGenImage get iconLectures =>
      const SvgGenImage('assets/icons/icon_lectures.svg');

  /// File path: assets/icons/icon_print.svg
  SvgGenImage get iconPrint => const SvgGenImage('assets/icons/icon_print.svg');

  /// File path: assets/icons/icon_profile.svg
  SvgGenImage get iconProfile =>
      const SvgGenImage('assets/icons/icon_profile.svg');

  /// File path: assets/icons/icon_result_card.svg
  SvgGenImage get iconResultCard =>
      const SvgGenImage('assets/icons/icon_result_card.svg');

  /// File path: assets/icons/icon_simcard.svg
  SvgGenImage get iconSimcard =>
      const SvgGenImage('assets/icons/icon_simcard.svg');

  /// File path: assets/icons/icon_skak.svg
  SvgGenImage get iconSkak => const SvgGenImage('assets/icons/icon_skak.svg');

  /// File path: assets/icons/icon_teman.svg
  SvgGenImage get iconTeman => const SvgGenImage('assets/icons/icon_teman.svg');

  /// File path: assets/icons/icon_transcript.svg
  SvgGenImage get iconTranscript =>
      const SvgGenImage('assets/icons/icon_transcript.svg');

  /// File path: assets/icons/icon_virtual.svg
  SvgGenImage get iconVirtual =>
      const SvgGenImage('assets/icons/icon_virtual.svg');

  /// File path: assets/icons/line_shape_one.svg
  SvgGenImage get lineShapeOne =>
      const SvgGenImage('assets/icons/line_shape_one.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        iconBook,
        iconBsi,
        iconCard,
        iconCardVa,
        iconCollage,
        iconDpa,
        iconGoogle,
        iconHome,
        iconIp,
        iconJadwal,
        iconLectures,
        iconPrint,
        iconProfile,
        iconResultCard,
        iconSimcard,
        iconSkak,
        iconTeman,
        iconTranscript,
        iconVirtual,
        lineShapeOne
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Logo_UMMI.png
  AssetGenImage get logoUMMI =>
      const AssetGenImage('assets/images/Logo_UMMI.png');

  /// File path: assets/images/boy_avatar.svg
  SvgGenImage get boyAvatar =>
      const SvgGenImage('assets/images/boy_avatar.svg');

  /// File path: assets/images/girl_avatar.svg
  SvgGenImage get girlAvatar =>
      const SvgGenImage('assets/images/girl_avatar.svg');

  /// File path: assets/images/illustration_development.svg
  SvgGenImage get illustrationDevelopment =>
      const SvgGenImage('assets/images/illustration_development.svg');

  /// File path: assets/images/illustration_no_connection.svg
  SvgGenImage get illustrationNoConnection =>
      const SvgGenImage('assets/images/illustration_no_connection.svg');

  /// List of all assets
  List<dynamic> get values => [
        logoUMMI,
        boyAvatar,
        girlAvatar,
        illustrationDevelopment,
        illustrationNoConnection
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
