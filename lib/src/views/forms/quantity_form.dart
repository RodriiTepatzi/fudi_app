import 'package:flutter/material.dart';
import 'package:fudi_app/src/models/product.dart';
import 'package:fudi_app/src/static/colors.dart';
import 'package:fudi_app/src/static/widget_properties.dart';
import 'package:intl/intl.dart';

class QuantityForm extends StatefulWidget {
  final Product product;

  QuantityForm({Key? key, required this.product}) : super(key: key);

  @override
  State<QuantityForm> createState() => _QuantityFormState();
}

class _QuantityFormState extends State<QuantityForm> {

  final doubleFormater = NumberFormat("#######.00");

  int _quantityValue = 1;

  void changeQuantityValue(int value){
    setState(() {
      _quantityValue = value;
    });
  }

  int minusQuantity(){
    if(_quantityValue > 1){
      return _quantityValue - 1;
    }

    return _quantityValue;
  }

  int plusQuantity(){
    return _quantityValue + 1;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.9) - 50,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -1),
                      child: ClipRRect(
                       borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(roundedCornersValue),
                          topRight: Radius.circular(roundedCornersValue)
                        ),
                        child: Image(
                          width: MediaQuery.of(context).size.width,
                          height: 250.0,
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.product.productUrl),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(marginWidget),
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.product.productName,
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: marginWidget, left: marginWidget),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.product.productDescription,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: marginWidget),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              changeQuantityValue(minusQuantity());
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: accentColorApp,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(roundedCornersValue),
                                  bottomLeft: Radius.circular(roundedCornersValue)
                                ),
                              ),
                              padding: const EdgeInsets.all(marginWidget),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: bgApp,
                            padding: const EdgeInsets.all(marginWidget),
                            child: Text(_quantityValue.toString()),
                          ),
                          GestureDetector(
                            onTap: (){
                              changeQuantityValue(plusQuantity());
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: accentColorApp,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(roundedCornersValue),
                                  bottomRight: Radius.circular(roundedCornersValue)
                                ),
                              ),
                              padding: const EdgeInsets.all(marginWidget),
                              child: const Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: marginWidget),
            height: 50,
            child: Row(
              children: [
                Text(
                  "Total: \$" + doubleFormater.format((double.parse(widget.product.productPrice) * _quantityValue)),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: marginWidget),
                    padding: const EdgeInsets.only(left: marginWidget * 2, right: marginWidget * 2),
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                      color: accentColorApp,
                      borderRadius: BorderRadius.circular(roundedCornersValue),
                    ),
                    child: const Text(
                      "Agregar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}