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

  Widget _getAccountPhoto(BuildContext context, Account? account, double size) {
    if (account == null) {
      return Icon(
        Icons.device_unknown_rounded,
        size: size / 1.5,
        color: context.theme.colors.secondaryForeground,
      );
    }

    if (account.avatarUrl == null) {
      switch (account.type) {
        case AccountType.personal:
          return Icon(
            Icons.person_rounded,
            size: size / 1.5,
            color: context.theme.colors.secondaryForeground,
          );
        case AccountType.business:
          return Icon(
            Icons.business_rounded,
            size: size / 1.5,
            color: context.theme.colors.secondaryForeground,
          );
      }
    }

    return ClipOval(
      child: Image.network(
        account.avatarUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

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
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),
      child: _getAccountPhoto(context, account, size),
    );
  }
}
