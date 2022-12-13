enum PaymentMethod { cod, online }

extension PaymentMethodExtension on PaymentMethod {
  int get id {
    switch (this) {
      case PaymentMethod.cod:
        return 1;
      case PaymentMethod.online:
        return 2;
    }
  }

  String get paymentMethodName {
    switch (this) {
      case PaymentMethod.cod:
        return 'COD';
      case PaymentMethod.online:
        return 'Online';
    }
  }

  PaymentMethod statusEnum(int value) {
    switch (value) {
      case 1:
        return PaymentMethod.cod;
      case 2:
        return PaymentMethod.online;
      default:
        return PaymentMethod.cod;
    }
  }
}
