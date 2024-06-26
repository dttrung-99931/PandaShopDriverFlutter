// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/shared/widgets/common/card_icon.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({
    super.key,
    required this.selectedIndexNotifier,
  });
  final ValueNotifier<int> selectedIndexNotifier;
  int get _selectIndex => selectedIndexNotifier.value;
  set _selectIndex(value) => selectedIndexNotifier.value = value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (_, __, ___) {
            return BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: CardIcon.smallPadding(Icons.home_outlined, size: 24.r),
                  label: "Trang chủ",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: CardIcon.smallPadding(Icons.notifications_outlined, size: 24.r),
                  label: "Thông báo",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: CardIcon.smallPadding(Icons.account_box_outlined, size: 24.r),
                  label: "Tài khoản",
                ),
              ],
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.black.withOpacity(0.8),
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectIndex,
              onTap: (index) {
                _selectIndex = index;
              },
              iconSize: 28.r,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              elevation: 10,
            );
          }),
    );
  }
}

// class NotiIconWithBadge extends StatefulWidget {
//   const NotiIconWithBadge({
//     super.key,
//   });

//   @override
//   State<NotiIconWithBadge> createState() => _NotiIconWithBadgeState();
// }

// class _NotiIconWithBadgeState extends State<NotiIconWithBadge> {
//   @override
//   void initState() {
//     // doIfLoggedIn(() {
//     //   notiBloc.add(OnGetNotificationOverview(requestModel: GetNotificationsModel.default_()));
//     // });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.topRight,
//       clipBehavior: Clip.none,
//       children: [
//         CardIcon.zeroPadding(Icons.notifications_outlined),
//         Positioned(
//           right: -8.w,
//           top: 2.h,
//           child: CustomBlocBuilder<NotificationBloc>(
//             handleLoading: false,
//             buildForStates: const [GetNotificationOverviewSuccesss],
//             builder: (state) {
//               if (state is! GetNotificationOverviewSuccesss || state.data.newNotiNum == 0) {
//                 return emptyWidget;
//               }
//               return AppBadge(number: state.data.newNotiNum);
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
