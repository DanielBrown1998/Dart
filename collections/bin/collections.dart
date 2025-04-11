import 'package:collections/exceptions/exceptions.dart';

void main() {
  try {
    Delivery.checkDelivery(false);
  } on DeliveryFailedException catch (erro) {
    print(erro.msg);
    print(erro.deliveryId);
    print(erro.driverName);
  }

}
