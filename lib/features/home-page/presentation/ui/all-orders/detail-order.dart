import 'package:flutter/material.dart';
import 'package:tailor_app/models/AllOrdersModel.dart';
import 'package:velocity_x/velocity_x.dart';


class DetailScreen extends StatelessWidget {

  final Orders orders;

  const DetailScreen({Key key, this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFB19069),
        title: Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text('Order Detail').text.uppercase
              .size(20)
              .bold
              .white
              .make(),
        ),
      ),
        backgroundColor: Color(0xFFedeeef),
      body:  SingleChildScrollView(
        child: Column(
            children: [

              Padding(
                  padding: const EdgeInsets.all(8.0),
                      child: Container(
                       height:80 ,
                        width: 500,
                        decoration: BoxDecoration(
                          color:Colors.white ,
                          borderRadius: BorderRadius.all(Radius.circular(5.0),)
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left:8.0,top: 27.0),
                            child: Text('Order No: ${orders.orderNo ?? " "}').text.size(18).gray700.medium.make()),
                      ),

                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:80 ,
                  width: 500,
                  decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(5.0),)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 27.0),
                      child: Text('Tailor Name: ${orders.tailor.name ?? " "}').text.size(18).gray700.medium.make()),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:80 ,
                  width: 500,
                  decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(5.0),)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 27.0),
                      child: Text('Description: ${orders.tailor.description ?? " "}').text.size(18).gray700.medium.make()),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:80 ,
                  width: 500,
                  decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(5.0),)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 27.0),
                      child: Text('Fabric delivery method: ${orders.fabricDeliveryMethod ?? " "}').text.size(18).gray700.medium.make()),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:80 ,
                  width: 500,
                  decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(5.0),)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 27.0),
                      child: Text('Shipping Cost: ${orders.shippingCost ?? " "}').text.size(18).gray700.medium.make()),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:80 ,
                  width: 500,
                  decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(5.0),)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 27.0),
                      child: Text('Total Amount: ${orders.total ?? " "}').text.size(18).gray700.medium.make()),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:80 ,
                  width: 500,
                  decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(5.0),)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 27.0),
                      child: Text('Delivery Date: ${orders.deliveryDate ?? " "}').text.size(18).gray700.medium.make()),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:80 ,
                  width: 500,
                  decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(5.0),)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 27.0),
                      child: Text('City: ${orders.city.name ?? " "}').text.size(18).gray700.medium.make()),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height:80 ,
                  width: 500,
                  decoration: BoxDecoration(
                      color:Colors.white ,
                      borderRadius: BorderRadius.all(Radius.circular(5.0),)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left:8.0,top: 27.0),
                      child: Text('Area: ${orders.area.name ?? " "}').text.size(18).gray700.medium.make()),
                ),

              ),

            ],
          ),
      ),


    );
  }


}

