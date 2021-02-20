import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeCard extends StatefulWidget {
  final double value;
  final double maxValue;
  final String title;

  const TimeCard({Key key, this.value, this.maxValue, this.title})
      : super(key: key);

  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  double _sliderDiscreteValue;

  @override
  void initState() {
    // TODO: implement initState
    _sliderDiscreteValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 180,
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
                        '${_sliderDiscreteValue.toStringAsFixed(0)} meses',
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
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1 mês'),
                    Text('${widget.maxValue.toStringAsFixed(0)} meses'),
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
