import 'package:flutter/material.dart';
import 'package:rest_api_crud/app/menu.dart';
import 'package:rest_api_crud/app/cau_placeholder_screen.dart';
import 'package:rest_api_crud/cau2/screens/cau2_product_detail_screen.dart';
import 'package:rest_api_crud/cau3/screens/cau3_create_post_screen.dart';
import '../cau1/screens/cau1_user_list_screen.dart';

class Routes {
  static const String home = '/';
  static const String cau1 = '/cau1';
  static const String cau2 = '/cau2';
  static const String cau3 = '/cau3';
  static const String cau4 = '/cau4';
  static const String cau5 = '/cau5';
  static const String cau6 = '/cau6';
  static const String cau7 = '/cau7';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const Menu(),
    cau1: (context) => const Cau1UserListScreen(),
    cau2: (context) => const Cau2ProductDetailScreen(),
    cau3: (context) => const Cau3CreatePostScreen(),
    cau4: (context) => const CauPlaceholderScreen(title: 'Cau 4'),
    cau5: (context) => const CauPlaceholderScreen(title: 'Cau 5'),
    cau6: (context) => const CauPlaceholderScreen(title: 'Cau 6'),
    cau7: (context) => const CauPlaceholderScreen(title: 'Cau 7'),
  };
}
