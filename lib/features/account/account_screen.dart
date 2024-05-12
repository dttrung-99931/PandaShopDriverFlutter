// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/ui_utils.dart';
import 'package:panshop_driver/features/auth/login/controllers/login_controller.dart';
import 'package:panshop_driver/features/auth/login/screens/login_screen.dart';
import 'package:panshop_driver/shared/widgets/common/unregister_widget.dart';
import 'package:panshop_driver/shared/widgets/dialog/app_alert_dialog.dart';
import 'package:panshop_driver/shared/widgets/layout/spacing_row.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          color: AppColors.primary,
        ),
        Positioned.fill(
          top: 120.h,
          child: Column(
            children: [
              Avatar(),
              const Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: _Items(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NotLoginWidget extends StatelessWidget {
  const NotLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnregisterWidget(
      title: 'Bạn chưa đăng nhập!',
      buttonTitle: 'Đăng nhập',
      onPressed: () {
        Get.toNamed(LoginScreen.route);
      },
    );
  }
}

class Avatar extends StatelessWidget {
  Avatar({double? size, super.key}) : size = size ?? 64.r;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 3.r),
      ),
      child: CircleAvatar(
        maxRadius: size,
        backgroundColor: AppColors.grey,
      ),
    );
  }
}

class _Items extends StatelessWidget {
  const _Items();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _Item(
          title: 'Thông tin',
          onPressed: commingSoon,
          icon: Icon(Icons.info_outlined),
        ),
        const _Item(
          title: 'Cài đặt',
          onPressed: commingSoon,
          icon: Icon(Icons.settings_outlined),
        ),
        _Item(
          title: 'Đăng xuất',
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AppAlertDialog(
                title: 'Xác nhận đăng xuất?',
                width: 360.w,
                confirmLabel: 'Xác nhận',
                onConfirm: () {
                  Get.find<LoginController>().logout();
                },
              ),
            );
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Widget icon;
  const _Item({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(color: AppColors.white),
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
          margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
          child: SpacingRow(
            spacing: 16.w,
            children: [
              icon,
              Expanded(child: Text(title, style: textTheme.bodyMedium)),
              const Icon(Icons.chevron_right_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
