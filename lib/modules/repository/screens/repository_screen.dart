import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kkma/core/cubit/base_cubit_state.dart';
import 'package:kkma/core/resources/colors.dart';
import 'package:kkma/modules/profile/presentation/screens/notifications_screen.dart';
import 'package:kkma/modules/repository/cubit/stores_cubit.dart';
import 'package:kkma/modules/repository/screens/repository_details_screen.dart';
import 'package:kkma/services/navigation/navigation.dart';
import 'package:kkma/services/shared_preferences/preferences_helper.dart';
import 'package:kkma/shared/widgets/custom_button.dart';
import 'package:kkma/shared/widgets/custom_loading_widget.dart';

import '../../../core/model/get_stores_model.dart';

class RepositoryScreen extends StatefulWidget {
  const RepositoryScreen({super.key});

  @override
  State<RepositoryScreen> createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  late StoresCubit storesCubit;
  @override
  void initState() {
    super.initState();

    storesCubit = context.read<StoresCubit>();
    storesCubit.getStores();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 140,
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff003556), Color(0xff1B8BD3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Notification
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Icon(Icons.person, color: AppColors.primaryColor),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "حياك الله،",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        CacheHelper.getName??"mohamed",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      AppNavigation.navigate(const NotificationsScreen());
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 4,
                            right: 3,
                            child: CircleAvatar(
                                backgroundColor: Colors.red, radius: 3),
                          ),
                          Icon(Icons.notifications,
                              color: AppColors.primaryColor),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 140,
                child: SvgPicture.asset('assets/icons/fig1.svg',
                    fit: BoxFit.fill)),
            SizedBox(
                height: 140,
                child: SvgPicture.asset('assets/icons/fig2.svg',
                    fit: BoxFit.fill)),
          ],
        ),
        const SizedBox(height: 16),
        BlocBuilder<StoresCubit, CubitState>(builder: (context, state) {
          if (state == CubitState.done) {
            return Expanded(
              child: ListView.builder(

                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: storesCubit.storesModel?.stores?.length??0,
                itemBuilder: (context, index) => RepositoryCard(
                    item: storesCubit.storesModel?.stores?[index]),
              ),
            );
          } else if (state == CubitState.loading) {
            return   const CustomLoadingWidget(color: AppColors.primaryColor,);
          }
          return const SizedBox.shrink();
        })
      ],
    );
  }
}

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({super.key, required this.item});
  final StoreModelItem ?item;

  @override

  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/repo1.svg'),
                const SizedBox(width: 10),
                const Text(
                  "مستودع الرياض",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 27),
            Row(
              children: [
                SvgPicture.asset("assets/icons/location.svg"),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    "${item?.name}",
                    style:
                        const TextStyle(fontSize: 12, color: AppColors.greyText),
                  ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/box.svg"),
                const SizedBox(width: 4),
                const Text("المخزون: 234 صنف",
                    style: TextStyle(fontSize: 12, color: AppColors.greyText))
              ],
            ),
            const SizedBox(height: 25),
            CustomElevatedButton(
              onTap: () {
                AppNavigation.navigate(RepositoryDetailsScreen(item: item!));
              },
              padding: 0,
              borderRadius: 12,
              buttonText: 'عرض المزيد',
              fontSize: 17,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
