class MakeOrderModel {
  final int amount;
  final List<ProductModel> productIds;
  MakeOrderModel({
    required this.amount,
    required this.productIds,
  });
}

class ProductModel {
  final String productId;
  final int count;
  final String optionName;
  final String optionValue;
  ProductModel({
    required this.productId,
    required this.count,
    required this.optionName,
    required this.optionValue,
  });
}
