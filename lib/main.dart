import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String Output= "0";
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  Calculation(String val)
  {
    print(val);
    if (val=="C")
      {
        _out ="0";
        num1=0.0;
        num2=0.0;
        operand="";
      }
    else if( val == "+"||val == "-"||val == "*"||val == "/" )
      {
        num1 = double.parse(Output);
        operand = val;
        _out ="0";
        Output = Output+val;
      }
    else if(val ==".")
      {
        if(_out.contains(".")){return;}
        else{
          _out = _out +val;
        }
      }
    else if(val == "="){
      num2 = double.parse(Output);
      switch (operand) {
        case "+" : 
          _out =(num1+num2).toString();
          break;
        case "-" :
          _out =(num1-num2).toString();
          break;
        case "*" :
          _out =(num1*num2).toString();
          break;
        case "/" :
          _out =(num1/num2).toString();
          break;
      }
      num1 =0.0;
      num2 =0.0;
      
    }
    else{
      _out = _out+val;
    }
    
    setState(() {
      Output =double.parse(_out).toStringAsFixed(2);
    });
    
      
    }


  Widget cal_btn(String btnval)
  {
    return Expanded(child: Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: (btnval =="+"||btnval =="-"||btnval =="*"||btnval =="/")? Colors.orange[900]: Colors.grey[900],
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey[500],
          //   offset: Offset(2.0,2.0),
          //   blurRadius: 8.0,
          //   spreadRadius: 1.0
          // ),
          // BoxShadow(
          //     color: Colors.grey[900],
          //     offset: Offset(-2.0,-2.0),
          //     blurRadius: 8.0,
          //     spreadRadius: 1.0
          // )

        ]
      ),

      child: MaterialButton(
        padding: EdgeInsets.all(30.0),

        child: Text(btnval,style: TextStyle(
          fontSize: 22.0,color: Colors.white),),
        onPressed: (){
          Calculation(btnval);
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0),
                child: Text(Output ,
                  style: TextStyle( fontSize: 60.0,color: Colors.white),),
              ),
              
              Expanded(child: Divider()),
              
              Column(
                children: [
                  Row(
                    children: [
                      cal_btn("."),
                      cal_btn("C"),
                      cal_btn("<"),
                      cal_btn("*"),
                    ],
                  ),

                  Row(
                    children: [
                      cal_btn("7"),
                      cal_btn("8"),
                      cal_btn("9"),
                      cal_btn("/"),
                    ],
                  ),
                  Row(
                    children: [
                      cal_btn("4"),
                      cal_btn("5"),
                      cal_btn("6"),
                      cal_btn("-"),
                    ],
                  ),
                  Row(
                    children: [
                      cal_btn("1"),
                      cal_btn("2"),
                      cal_btn("3"),
                      cal_btn("+"),
                    ],
                  ),

                  Row(
                    children: [
                      cal_btn("0"),
                      cal_btn("="),
                    ],
                  ),
                  
                ],
              )
              
            ],
          ),
        ),

      ),
    );
  }
}

