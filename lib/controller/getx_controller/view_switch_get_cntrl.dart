import 'package:get/get.dart';


class ViewControl extends GetxController{
  Rx<bool> view = false.obs;

  void gridView(){
    view.value = true;
    update();
  }

   void listView(){
    view.value = false;
    update();
  }
}