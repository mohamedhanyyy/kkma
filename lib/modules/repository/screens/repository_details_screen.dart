import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kkma/core/cubit/base_cubit_state.dart';
import 'package:kkma/core/model/get_stores_model.dart';
import 'package:kkma/modules/repository/screens/category_details_screen.dart';
import 'package:kkma/modules/repository/widgets/search_failed_widget.dart';
import 'package:kkma/services/navigation/navigation.dart';
import 'package:kkma/shared/widgets/custom_loading_widget.dart';
import 'package:kkma/shared/widgets/custom_text_field.dart';

import '../../../core/resources/colors.dart';
import '../cubit/store_item_cubit.dart';

class RepositoryDetailsScreen extends StatefulWidget {
  const RepositoryDetailsScreen({super.key, required this.item});

  final StoreModelItem item;

  @override
  State<RepositoryDetailsScreen> createState() =>
      _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState extends State<RepositoryDetailsScreen> {
  final searchController = TextEditingController();

  late StoreItemCubit storeItemCubit;
  @override
  void initState() {
    super.initState();
    storeItemCubit = context.read<StoreItemCubit>();
    storeItemCubit.clearItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _PinnedHeader(
              child: SizedBox(
                height: 270,
                child: Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          AppNavigation.pop();
                        },
                        child: Image.asset(
                          'assets/images/library.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                    Positioned(
                      top: 140,
                      left: 24,
                      right: 24,
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 1,
                                  blurRadius: 1)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/repo1.svg'),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    "${widget.item.name}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/location.svg"),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    "${widget.item.name}",
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: AppColors.greyText),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset("assets/icons/box.svg"),
                                const SizedBox(width: 4),
                                const Text("المخزون: 234 صنف",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.greyText))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          /// 🔹 Search field
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: CustomTextField(
                hintText: 'بحث عن طريق اسم الصنف',
                prefixIcon: SvgPicture.asset('assets/icons/search.svg'),
                onSubmitted: (val) =>
                    storeItemCubit.getStoreItemCubit(widget.item.id, val),
              ),
            ),
          ),

          /// 🔹 List of items
          BlocBuilder<StoreItemCubit, CubitState>(
            builder: (context, state) {
              if (state == CubitState.done) {
                return SliverList.separated(
                  separatorBuilder: (contex, index) =>
                      Divider(thickness: 2, height: 1, color: AppColors.grey),
                  itemCount: storeItemCubit.storeItemsModel?.storeItems?.length,
                  itemBuilder: (context, index) {
                    final storeItem =
                        storeItemCubit.storeItemsModel?.storeItems?[index];

                    return GestureDetector(
                      onTap: () {
                        AppNavigation.navigate(
                            CategoryDetailsScreen(item: storeItem));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${storeItem?.name}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'التصنيف: ${storeItem?.amount}',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.greyText),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'العدد: ${storeItem?.code} قطعة',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.greyText),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/icons/arr.svg')
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (state == CubitState.loading) {
                return const SliverToBoxAdapter(
                  child: CustomLoadingWidget(padding: 200),
                );
              } else if (state == CubitState.empty) {
                return const SliverToBoxAdapter(
                  child: SearchFailedWidget(),
                );
              } else {
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              }
            },
          ),
        ],
      ),
    );
  }
}

/// 🔹 Helper class for pinned header
class _PinnedHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  _PinnedHeader({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 270;

  @override
  double get minExtent => 270;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
