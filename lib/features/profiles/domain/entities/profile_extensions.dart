import 'package:ibiapabaapp/features/businesses/domain/entities/business.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile.dart';

extension ProfileX on Profile {
  bool get isBusiness => type == ProfileType.business;
  bool get isPersonal => type == ProfileType.personal;

  Business? toBusiness() {
    if (business == null) return null;
    return Business(
      id: business!.id,
      slug: slug,
      name: displayName,
      bio: bio,
      avatar: avatarUrl,
      maxReachLevel: business!.maxReachLevel,
      categories: business!.categories,
      createdAt: createdAt,
    );
  }
}