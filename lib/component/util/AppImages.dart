import 'package:flutter/material.dart';

class AppImages {
  static FadeInImage getImage(
      String networkImageLink, String defaultAssetImageLink) {
    return FadeInImage(
      fadeInDuration: const Duration(seconds: 1),
      fadeOutDuration: const Duration(milliseconds: 2),
      image: networkImageLink != null
          ? NetworkImage(networkImageLink)
          : AssetImage(defaultAssetImageLink),
      placeholder: AssetImage(defaultAssetImageLink),
      fit: BoxFit.cover,
    );
  }

  static FadeInImage getDetailsPageImage(double height,double width,
      String networkImageLink, String defaultAssetImageLink) {
    return FadeInImage(width: width,height: height,
      fadeInDuration: const Duration(seconds: 1),
      fadeOutDuration: const Duration(milliseconds: 2),
      image: networkImageLink != null
          ? NetworkImage(networkImageLink)
          : AssetImage(defaultAssetImageLink),
      placeholder: AssetImage(defaultAssetImageLink),
      fit: BoxFit.cover,
    );
  }

  static FadeInImage getImages(
      String imageLink) {
    return FadeInImage(
      fadeInDuration: const Duration(seconds: 1),
      fadeOutDuration: const Duration(milliseconds: 2),
      image: AssetImage(imageLink),
      placeholder: AssetImage(imageLink),
      fit: BoxFit.cover,
    );
  }

  // static getCustomerImage(File _image, User currentUser) {
  //   if (_image == null) {
  //     if (currentUser.gender == null ||
  //         currentUser.gender == UserGender.others) {
  //       return AppImages.getImage(null, defaultProfileImage);
  //     }
  //     if (currentUser.gender == UserGender.male) {
  //       return AppImages.getImage(null, defaultMaleImage);
  //     }
  //     if (currentUser.gender == UserGender.female) {
  //       return AppImages.getImage(null, defaultFemaleImage);
  //     }
  //   } else {
  //     return Image(
  //       image: FileImage(_image),
  //       fit: BoxFit.cover,
  //     );
  //   }
  // }

  static Widget circularAssetImage(double diameter, String assetImageLink) {
    return ClipOval(
      child: Container(
        height: diameter,
        width: diameter,
        child: Image.asset(
          assetImageLink,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget circularNetworkImage(
      double diameter, String defaultAssetImageLink, String networkImageLink) {
    return ClipOval(
      child: Container(
        height: diameter,
        width: diameter,
        child: AppImages.getImage(networkImageLink, defaultAssetImageLink),
      ),
    );
  }

  static Widget circularNetworkImages(
      double diameter, String imageLink) {
    return ClipOval(
      child: Container(
        height: diameter,
        width: diameter,
        child: AppImages.getImages(imageLink),
      ),
    );
  }
}
