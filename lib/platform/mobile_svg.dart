import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'interface_svg.dart' as Interface;

class PlatformSvg extends Interface.PlatformSvg {
  /// The flag to display.
  ///
  /// This value listed in https://github.com/LunaGao/flag_flutter/blob/master/un_members.txt.
  final String? semanticLabel;

  /// If non-null, requires the child to have exactly this height.
  final double? height;

  /// If non-null, requires the child to have exactly this width.
  final double? width;

  /// How to inscribe the flag into the space allocated during layout.
  ///
  /// The default value is [BoxFit.contain].
  final BoxFit? fit;

  /// Flag svg path
  final String assetName;

  PlatformSvg(
    this.assetName, {
    Key? key,
    this.semanticLabel,
    this.height,
    this.width,
    this.fit,
  }) : super(assetName, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: semanticLabel,
        fit: fit!,
      ),
    );
  }

  static Future<void> preloadFlag(
      BuildContext context, String assetName) async {
    await precachePicture(
        ExactAssetPicture(
          SvgPicture.svgStringDecoder,
          assetName,
        ),
        context);
  }
}
