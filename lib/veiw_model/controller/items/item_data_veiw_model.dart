import 'package:get/get.dart';

import '../../../model/items/get_items_data.dart';
import '../../../model/items/item_model.dart';

class ItemVeiwModel extends GetxController {
  // get item data
  //start
  List<ItemModel> _itemData = [];
  Future<void> fetchItemData() async {
    _itemData.clear();
    _itemData = await ItemData().getItemData();
    update();
  }

  List<ItemModel> get itemData => _itemData;
  //end
  @override
  void onInit() async {
    await fetchItemData();
    super.onInit();
  }
}
