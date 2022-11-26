class Grocery {
  Grocery({required this.item, required this.amount});

  Grocery.fromJson(Map<String, dynamic> json)
      : item = json['item'] as String,
        amount = json['amount'] as int;

  Map<String,dynamic> toJson() => {
        'item': item,
        'amount': amount,
      };

  int amount = 0;
  String item = '';
}
