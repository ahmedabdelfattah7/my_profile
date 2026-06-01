import 'package:ahmed_abdelfattah/utils/hover_extensions.dart';
import 'package:ahmed_abdelfattah/utils/url_launcher_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

enum StoreType {
  appStore,
  playStore,
}

class StoreBadgeButton extends StatelessWidget {
  const StoreBadgeButton({
    required this.storeType,
    required this.url,
    super.key,
  });

  final StoreType storeType;
  final String url;

  @override
  Widget build(BuildContext context) {
    final isAppStore = storeType == StoreType.appStore;
    final topText = isAppStore ? 'Download on the' : 'GET IT ON';
    final bottomText = isAppStore ? 'App Store' : 'Google Play';

    // The SVGs should be just the logos (Apple logo, Google Play logo)
    final logoAsset = isAppStore
        ? 'assets/images/apple_logo.svg'
        : 'assets/images/play_store_logo.svg';

    final topTextStyle = isAppStore 
        ? GoogleFonts.inter(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.2,
          )
        : GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.2,
          );

    final bottomTextStyle = isAppStore
        ? GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
            letterSpacing: -0.5,
          )
        : GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
            letterSpacing: -0.5,
          );

    return InkWell(
      onTap: () => UrlLauncherHelper.openUrl(url),
      borderRadius: BorderRadius.circular(8),
      child: HoverScaleWidget(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                logoAsset,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    topText,
                    style: topTextStyle,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    bottomText,
                    style: bottomTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
