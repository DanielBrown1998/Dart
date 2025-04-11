class DeliveryFailedException implements Exception {
  final String msg;
  final String deliveryId;
  final String driverName;
  DeliveryFailedException({
    required this.msg,
    required this.deliveryId,
    required this.driverName,
  });
}

class Delivery {
  Delivery();

  static checkDelivery(bool value) {
    if (!value) {
      throw DeliveryFailedException(
        msg: "Delivery nao entregue",
        deliveryId: "ID099",
        driverName: "Daniel",
      );
    }
  }
}

class PasswordException implements Exception {
  final String msg;

  PasswordException({required this.msg});
}

class Password {
  final String password;

  Password({required this.password});

  static checkPassword(String password) {
    if (password.length < 8) {
      throw PasswordException(msg: "senha com menos de 8 caracteres");
    }
  }
}
