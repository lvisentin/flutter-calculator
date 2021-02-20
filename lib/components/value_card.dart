import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class ValueCard extends StatefulWidget {
  final double value;
  final double maxValue;
  final String title;
  final String mode;
  final double height;

  const ValueCard(
      {Key key, this.value, this.maxValue, this.title, this.mode, this.height})
      : super(key: key);

  @override
  ValueCardState createState() => ValueCardState();
}

class ValueCardState extends State<ValueCard> {
  double _sliderDiscreteValue;
  var currencyFormat = new NumberFormat('#0.00', 'pt-BR');

  @override
  void initState() {
    // TODO: implement initState
    _sliderDiscreteValue = widget.value;
    currencyFormat.format(_sliderDiscreteValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: widget.height,
        decoration: BoxDecoration(
          color: Color(0XFF272727),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0XFF6A6A6A),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'R\$ ${currencyFormat.format(_sliderDiscreteValue)}',
                        style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (widget.mode == 'edit')
                Align(
                  alignment: Alignment.centerLeft,
                  child: SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Color(0XFFFF9F01),
                      valueIndicatorColor: Color(0XFFFF9F01),
                      activeTrackColor: Color(0XFFFF9F01),
                      inactiveTrackColor: Color(0XFF6A6A6A),
                      inactiveTickMarkColor: Color(0XFF6A6A6A),
                    ),
                    child: Slider(
                      value: _sliderDiscreteValue,
                      min: 0,
                      max: widget.maxValue,
                      divisions: 50,
                      label: _sliderDiscreteValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _sliderDiscreteValue = value;
                        });
                      },
                    ),
                  ),
                ),
              if (widget.mode == 'edit')
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('R\$ 0'),
                      Text('R\$ ${widget.maxValue}'),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
