class CartItem1 {
  String? productID;
  String? uid;
  int? qty;
  String? cartItemId;

  CartItem1({
    this.productID,
    this.uid,
    this.qty,
    this.cartItemId
  });

  Map<String, dynamic> toJSON() => {
    'productID': productID,
    'uid': uid,
    'qty': qty,
    'cartItemId': cartItemId,
  };

  static CartItem1 fromJSON(Map<String, dynamic> json) => CartItem1(
    productID: json['productID'],
    uid: json['uid'],
    qty: json['qty'],
    cartItemId: json['cartItemId'],
  );
}