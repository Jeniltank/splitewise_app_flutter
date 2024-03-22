import 'package:flutter/material.dart';
import 'package:splitewise_flutter/main_Screen_Child/Split_Result.dart';

class SpliteBill extends StatefulWidget {
  const SpliteBill({super.key});

  @override
  State<SpliteBill> createState() => _SpliteBillState();
}

class _SpliteBillState extends State<SpliteBill> {
  double firendsvalue = 0.0;
  double tip = 0.0;
  String tax = '0';
  String bill = '0';
  Widget buildbutton(String text) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(15),
        ),
        onPressed: () {
          if (text == '-') {
            setState(() {
              bill = '';
            });
          } else {
            setState(() {
              bill += text;
            });
          }
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  TextStyle infostyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Split Bill",
          style: TextStyle(color: Colors.white),
        ),
        //automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 50),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: BoxDecoration(color: Colors.teal),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            bill,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Friend",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                "Tax",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                "Tip",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                firendsvalue.round().toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                "$tax%",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                "\₹${tip.round().toString()}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "How many Friends",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Slider(
                min: 0,
                max: 15,
                divisions: 15,
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,
                value: firendsvalue,
                onChanged: (value) {
                  setState(() {
                    firendsvalue =
                        value < 0 ? 0 : value; // Ensure value is not negative
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Tip",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  if (tip > 0) {
                                    // Ensure tip is greater than 0 before decrementing
                                    setState(() {
                                      tip--;
                                    });
                                  }
                                },
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "\₹${tip.round().toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    tip++;
                                  });
                                },
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            tax = value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: "Tax  in  %",
                          labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  buildbutton("1"),
                  buildbutton("2"),
                  buildbutton("3"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  buildbutton("4"),
                  buildbutton("5"),
                  buildbutton("6"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  buildbutton("."),
                  buildbutton("0"),
                  buildbutton("-"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplitResult(
                            friendsValue: firendsvalue,
                            tip: tip,
                            tax: tax,
                            bill: bill)
                        // Expancemain(
                        //   friendsValue: firendsvalue,
                        //   bill: bill,
                        //   tax: tax,
                        //   tip: tip,
                        // ),
                        ),
                  );
                },
                child: Center(
                  child: Text(
                    "Split Bill",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
