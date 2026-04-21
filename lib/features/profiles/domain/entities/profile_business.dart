import 'package:ibiapabaapp/features/businesses/domain/entities/business.dart';

class ProfileBusiness {
  final String id;
  final String? cnpj;
  final ReachLevel maxReachLevel;
  final List<String> categories;

  const ProfileBusiness({
    required this.id,
    this.cnpj,
    required this.maxReachLevel,
    required this.categories,
  });
}
