import 'package:get/get.dart';
import 'package:getx_practice/models/counter_model.dart';

class CounterController extends GetxController{
  Counter counter = Counter(i: 0.obs);

  void increment(){
    counter.i++;
  }
}