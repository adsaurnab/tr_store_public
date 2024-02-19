import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/asset_constants.dart';
import 'shimmer/shimmer_base.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height, width;
  final bool isProfilePhoto,
      isJobErrorIcon,
      isBoxFitFill,
      isBoxFitContain,
      emptyErrorCourseImage,
      emptyErrorImage;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.isProfilePhoto = false,
    this.isJobErrorIcon = false,
    this.isBoxFitFill = false,
    this.isBoxFitContain = false,
    this.emptyErrorImage = false,
    this.emptyErrorCourseImage = false,
    this.height = 114,
    this.width = 114,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: isBoxFitFill
          ? BoxFit.fill
          : isBoxFitContain
              ? BoxFit.contain
              : BoxFit.cover,
      placeholder: (context, url) => ShimmerBase(
        child: Container(
          height: height,
          width: width,
          color: AppColors.liteGrey,
        ),
      ),
      errorWidget: (context, url, error) {
        return Container(
          child: emptyErrorImage
              ? Container()
              : Image.asset(
                  logo,
                  height: height,
                  width: width,
                  fit: emptyErrorCourseImage
                      ? BoxFit.cover
                      : isProfilePhoto
                          ? BoxFit.cover
                          : BoxFit.contain,
                ),
        );
      },
    );
  }
}
