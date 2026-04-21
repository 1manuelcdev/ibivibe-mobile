import 'package:ibiapabaapp/features/profiles/domain/entities/profile_business.dart';
import 'package:ibiapabaapp/features/profiles/domain/entities/profile_interests.dart';

enum ProfileType { personal, business }

enum BusinessRole {
  owner,
  admin,
  editor,
  viewer;

  String get name {
    switch (this) {
      case BusinessRole.owner:
        return 'Proprietário';
      case BusinessRole.admin:
        return 'Administrador';
      case BusinessRole.editor:
        return 'Editor';
      case BusinessRole.viewer:
        return 'Visualizador';
    }
  }
}

class Profile {
  final String id;
  final String slug;
  final String displayName;
  final String bio;
  final String? avatarUrl;
  final ProfileType type;

  final DateTime createdAt;
  final DateTime updatedAt;

  final ProfileInterests? interests;
  // TODO: centralizar roles de negócio e pessoal aqui (exige mudança no banco, account_profile)
  final BusinessRole? businessRole;
  final ProfileBusiness? business;

  Profile({
    required this.id,
    required this.slug,
    required this.displayName,
    required this.bio,
    required this.avatarUrl,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.interests,
    this.business,
    this.businessRole,
  });
}
