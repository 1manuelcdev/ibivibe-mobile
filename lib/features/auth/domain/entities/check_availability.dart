class CheckAvailability {
  final AvailabilityField field;
  final String value;
  final bool available;

  const CheckAvailability({
    required this.available,
    required this.field,
    required this.value,
  });
}

enum AvailabilityField { username, email, phoneNumber }

extension AvailabilityFieldMapper on AvailabilityField {
  String get value {
    switch (this) {
      case AvailabilityField.username:
        return 'username';
      case AvailabilityField.email:
        return 'email';
      case AvailabilityField.phoneNumber:
        return 'phone_number';
    }
  }
}
