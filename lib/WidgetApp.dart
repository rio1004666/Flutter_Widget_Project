
import 'package:flutter/material.dart';

class WidgetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WidgetExampleState();
  }
}

class _WidgetExampleState extends State<WidgetApp> {
  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  var _buttonList = ['더하기', '빼기', '곱하기' , '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = new List.empty(growable: true);
  String? _buttonText;
  @override
  void initState(){
    super.initState();
    for(var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item,child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Text('flutter'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var valueInt1 = double.parse(value1.value.text);
                      var valueInt2 =  double.parse(value2.value.text);
                      var result;
                      if(_buttonText == '더하기'){
                        result = valueInt1 + valueInt2;
                      }else if(_buttonText == '빼기') {
                        result = valueInt1 - valueInt2;
                      }else if(_buttonText == '곱하기'){
                        result = valueInt1 * valueInt2;
                      }else{
                        result = valueInt1 / valueInt2;
                      }
                      sum = '$result';
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text(_buttonText!),
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  '결과 : $sum',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: DropdownButton(items:_dropDownMenuItems,onChanged:(String? value){
                  setState(() {
                    _buttonText = value;
                  });
                },value: _buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
