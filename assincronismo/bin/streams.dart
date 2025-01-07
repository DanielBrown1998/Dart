import 'dart:async';

void main() async {
  Stream myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      await Future.delayed(
          Duration(seconds: interval), () => print("Sending $i"));
      yield i++;
    }
  }

  StreamSubscription subscription = myStream(1, 6).listen((event) {
    if (event.isEven) {
      print("Received: $event");
    }
  },
      onDone: () => print("Done!"),
      onError: (e) => print("A Error happend: $e"));

  await Future.delayed(Duration(seconds: 3), () => print("Stream paused"));
  subscription.pause();
  await Future.delayed(Duration(seconds: 3), () => print("Stream resumed"));
  subscription.resume();
  await Future.delayed(Duration(seconds: 3), () => print("Stream canceled"));
  subscription.cancel();


  Stream kakoStream = myStream(3).asBroadcastStream();
  kakoStream.map(
    (event) => "Subscriber 2 watching $event"
  );
  kakoStream.listen(print);
}
