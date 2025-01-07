import 'dart:async';

void main(){
  Future myFuture = Future(
    (){
      print("Going bak to Future");
      return 1;
    }
  ).then((value) => print("$value"));
  
  Future<int> myFutureFunc() async {
    await Future.delayed(
      Duration(seconds: 3)
      );
    return 0;
  }
  myFutureFunc()
  .then((value) => print("$value"))
  .onError((error, stackTrace) => print("$error $stackTrace"))
  .whenComplete(
    () => print("This Future is Over")
  );

  Future<int> myFutureErrorFunc(int a, int b)async {
    try{
      if (a > b){
        throw Exception();
      }
        
      await Future.delayed(Duration(seconds: 3));
      return 1;
    }catch(e){
      print("A error ocurred: $e");
      return 0;
    }
    finally{
      print("this func is over");
    }
  }


  print("Done with main");
}