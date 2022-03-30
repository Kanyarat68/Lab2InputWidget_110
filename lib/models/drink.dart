class Drink {
  String? thName;
  int? price;
  bool? checked;
 
  //Constructor
  Drink(this.thName, this.price, this.checked);

  static getDrink() {
    return[
      Drink('คาปูชิโน่หวานเจี๊ยบ', 50, true),
      Drink('แบล็คออเรนจ์เข้มข้น', 69, false),
      Drink('ชานมไข่มุกบุฟเฟ่', 39, false),
      Drink('ชาเขียวในตำนาน', 180, false),
    ];
  }
}