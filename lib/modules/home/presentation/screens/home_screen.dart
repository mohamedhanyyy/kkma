import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkma/core/extensions/context_extension.dart';
import 'package:kkma/core/resources/colors.dart';
import 'package:kkma/modules/profile/presentation/screens/profile_screen.dart';
import '../../../repository/screens/repository_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void changeIndex(int index) {
    setState(() => currentIndex = index);
  }

  final List<Widget> pages = const [
    RepositoryScreen(),
    Center(child: Text('قيد التنفيذ')),
    Center(child: Text('قيد التنفيذ')),
    ProfileScreen(),
  ];

  static const List<String> titles = [
    'المستودعات',
    'رابط',
    'رابط',
    'حسابي',
  ];

  static const List<String> icons = [
    'assets/icons/repo.svg',
    'assets/icons/link.svg',
    'assets/icons/link.svg',
    'assets/icons/profile.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,

        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
        unselectedLabelStyle: const TextStyle(color: AppColors.grey2),
        onTap: changeIndex,
        elevation: 0,
        items: List.generate(
          titles.length,
          (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icons[index],
              colorFilter: currentIndex == index
                  ? AppColors.primaryColor.toColorFilter
                  : Colors.grey.toColorFilter,
            ),
            label: titles[index],
          ),
        ),
      ),
    );
  }
}
