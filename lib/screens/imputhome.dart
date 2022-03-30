import 'package:flutter/material.dart';
import 'package:inputwidgets/models/drink.dart';
import 'package:inputwidgets/models/food.dart';

class InputHomePage extends StatefulWidget {
  const InputHomePage({ Key? key }) : super(key: key);

  @override
  State<InputHomePage> createState() => _InputHomePageState();
}


class _InputHomePageState extends State<InputHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  
  //Radio
  String? groupFood;
  List<Food>? Foods;

  //Checkbok
  List checkedDrink = [];  //เก็บค่าที่เลือก :)
  List<Drink>? drink;      //เก็บรายการเครื่องดื่มจาก CLASS

  //Dropdown
  List<ListItem> types = ListItem.getItem();
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItem;
  late ListItem _selectedTypeItem;

  @override
  void initState() {
    super.initState();
    Foods = Food.getFood();
    drink = Drink.getDrink();
    _dropdownMenuItem = createDropdownMenuItem(types);
    _selectedTypeItem = _dropdownMenuItem[0].value!;
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenuItem(
    List<ListItem> types) {
      List<DropdownMenuItem<ListItem>> items = [];

      for (var item in types) {
        items.add(DropdownMenuItem(
          child: Text(item.name!),
          value: item,
        ));

      }

      return items;
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  usernameTextField(),
                  PasswordTextField(),
                  const SizedBox(height: 16,),
                  Column(
                    children: createRadioFood(),
                  ),
                  Text('Radio Selected: $groupFood'),
                  const SizedBox(height: 16,),
                  Column(
                    children: createCheckboxDrink(),
                  ),
                  const SizedBox(height: 16,),
                  DropdownButton(
                    value: _selectedTypeItem,
                    items: _dropdownMenuItem, 
                    onChanged: (ListItem? value) {
                      setState(() {
                        _selectedTypeItem = value!;
                      });
                    },
                  ),
                  Text('Dropdown Selected: ${_selectedTypeItem.value}'),
                  submitBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton submitBtn() {
    return ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                print(_username.text);
              }
            },
             child: Text('Submit'),
          );
  }


   Widget PasswordTextField() {
    return Container(
      width: 300,
      margin: EdgeInsets.all(8),
      child: TextFormField(
              obscureText: true,
              controller: _password,
              validator: (value) {
                if (value!.isEmpty){
                  return "Please Enter Password";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),

              ),
      ),
    );
  }

  Widget usernameTextField() {
    return Container(
      width: 300,
      margin: EdgeInsets.all(8),
      child: TextFormField(
              controller: _username,
              validator: (value) {
                if (value!.isEmpty){
                  return "Please Enter Username";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'UserName',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),

              ),
      ),
    );
  }

  List<Widget> createRadioFood() {
    List<Widget> listFood = [];

    for (var food in Foods!) {
      listFood.add(
        RadioListTile<dynamic>(
          title: Text(food.thName!),
          subtitle: Text(food.enName!),
          secondary: Text('${food.price} บาท'),
          value: food.foodValue,
          groupValue: groupFood,
          onChanged: (value) {
            setState(() {
              groupFood = value;  
            });
          },  
        ),
      );
    }
    return listFood; 
  }

  List<Widget> createCheckboxDrink() {
    List<Widget> listDrink = [];

    for (var drink in drink!) {
      listDrink.add(CheckboxListTile(
        title: Text(drink.thName!),
        value: drink.checked,
        subtitle: Text('${drink.price} บาท'),
        onChanged: (value) {
          setState(() {
            drink.checked = value;
          });

          if (value!) {
            checkedDrink.add(drink.thName);
          } else {
            checkedDrink.remove(drink.thName);

          print(checkedDrink);
        }
        }
      ));
    }
    return listDrink;
  }


}

class ListItem {
  int? value;
  String? name;

  //Construtor
  ListItem(this.value, this.name);

  static getItem() {
    return [
      ListItem(1, 'เครื่องดื่ม'),
      ListItem(2, 'อาหารอีสาน'),
      ListItem(3, 'อาหารตามสั่ง'),
      ListItem(4, 'ขนม'),
    ];
  }
}