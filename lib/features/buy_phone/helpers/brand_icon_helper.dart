import 'package:lahza/core/constants/app_assets.dart';
class BrandIconHelper {
  BrandIconHelper._();

  static String getIcon(String brandName) {
    switch (brandName.toLowerCase()) {
      case 'all':
        return AppAssets.defaultBrand;

      case 'apple':
        return AppAssets.apple;

      case 'samsung':
        return AppAssets.samsung;

      case 'huawei':
        return AppAssets.huawei;

      case 'xiaomi':
        return AppAssets.xiaomi;

      case 'oppo':
        return AppAssets.oppo;

      case 'realme':
        return AppAssets.realme;

      default:
        return AppAssets.defaultBrand;
    }
  }
}