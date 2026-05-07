import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account.dart';
import 'package:ibiapabaapp/features/accounts/domain/entities/account_type.dart';

class AccountPhoto extends StatelessWidget {
  final Account? account;
  final double size;
  final bool isSelected;
  final Color? borderColor;

  const AccountPhoto({
    required this.account,
    super.key,
    required this.size,
    this.isSelected = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        color: context.theme.colors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: isSelected
              ? BorderSide(
                  color: borderColor ?? context.theme.colors.primary,
                  width: 1.4,
                )
              : BorderSide.none,
        ),
      ),
      child: Icon(
        account == null
            ? Icons.device_unknown_rounded
            : account!.type == AccountType.personal
            ? Icons.person_rounded
            : account!.type == AccountType.business
            ? Icons.business_rounded
            : Icons.person_rounded,
        size: size / 1.5,
        color: context.theme.colors.secondaryForeground,
      ),
    );
  }
}
