class Food {
  String? thName;
  String? enName;
  int? price;
  String? foodValue;

  //Constructor
  Food(this.thName, this.enName, this.price, this.foodValue);

  static getFood() {
    return[
      Food('พิซซ่า', 'Pizza', 99, 'Pizza'),
      Food('สเต็ก', 'Steak', 129, 'Steak'),
      Food('ชาบู', 'Shabu', 399, 'Shabu'),
      Food('ซูชิ', 'Sushi', 29, 'Sushi'),
      Food('กิมจิ', 'Kimji', 59, 'Kimji'),
    ];
  }
}