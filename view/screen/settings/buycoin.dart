import 'package:alaraaf/controller/coins/buycoinscontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

class BuyCoins extends StatelessWidget {
  const BuyCoins({super.key});

  @override
  Widget build(BuildContext context) {
    BuyCoinsControllerImp controller = Get.put(BuyCoinsControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              GetBuilder<BuyCoinsControllerImp>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => PaypalCheckout(
                              sandboxMode: true,
                              clientId:
                                  "AcnG2uHYervQ1PfNinUUzOmJMXQlIiInV2nIiavhEvwQZoDgPRAtSat3MJnSxwjUu8HUw07isBJDld4U",
                              secretKey:
                                  "EAOYf5oUo_rjDdmIAYoynQY8ugtiwHqFUb_gKHLk1ZQg2OLaKSbdZP9_nycQbNICA6pHEMecRIB9gm2o",
                              returnURL: "success.snippetcoder.com",
                              cancelURL: "cancel.snippetcoder.com",
                              transactions: [
                                {
                                  "amount": {
                                    "total": controller.data[index]
                                            ["coins_discount"]
                                        ? controller.data[index]["coins_price"]
                                        : (controller.data[index]
                                                ["coins_price"] -
                                            (controller.data[index]
                                                    ["coins_price"] *
                                                (controller.data[index]
                                                        ["coins_offer"] /
                                                    100))),
                                    "currency": "USD",
                                    "details": {
                                      "subtotal": controller.data[index]
                                          ["coins_price"],
                                      //"shipping": '0',
                                      //"shipping_discount": 0
                                    }
                                  },
                                  "description":
                                      "The payment transaction description.",
                                  // "payment_options": {
                                  //   "allowed_payment_method":
                                  //       "INSTANT_FUNDING_SOURCE"
                                  // },
                                  "item_list": {
                                    "items": [
                                      {
                                        "name": "Coins",
                                        "quantity": 1,
                                        "price": controller.data[index]
                                                ["coins_discount"]
                                            ? controller.data[index]
                                                ["coins_price"]
                                            : (controller.data[index]
                                                    ["coins_price"] -
                                                (controller.data[index]
                                                        ["coins_price"] *
                                                    (controller.data[index]
                                                            ["coins_offer"] /
                                                        100))),
                                        "currency": "USD"
                                      },
                                      // {
                                      //   "name": "Pineapple",
                                      //   "quantity": 5,
                                      //   "price": '10',
                                      //   "currency": "USD"
                                      // }
                                    ],
                                  }
                                }
                              ],
                              note:
                                  "Contact us for any questions on your order.",
                              onSuccess: (Map params) async {
                                controller.request(
                                  controller.data[index]["coins_quantity"],
                                );
                                print("onSuccess: $params");
                              },
                              onError: (error) {
                                print("onError: $error");
                                Navigator.pop(context);
                              },
                              onCancel: () {
                                print('cancelled:');
                              },
                            ),
                          ));
                        },
                        child: Card(
                          shadowColor: AppColor.secondrycolor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppLink.imagecoins}/${controller.data[index]["coins_image"]}",
                                    fit: BoxFit.fitWidth,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width: 10),

                                // Image.asset(
                                //   AppImageAsset.coins,
                                //   fit: BoxFit.fill,
                                //   //    height: 100,
                                //   //    width: 100,
                                // )
                              ),
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                    title: //Text("${"30 Coins".tr}",
                                        Text(
                                            "${controller.data[index]["coins_quantity"]}   Coins\n",
                                            style:
                                                const TextStyle(fontSize: 20)),
                                    subtitle: controller.data[index]
                                                ["coins_discount"] ==
                                            0
                                        ? Text(
                                            "${controller.data[index]["coins_price"]}  \$",
                                            style: TextStyle(fontSize: 20),
                                          )
                                        : Text(
                                            "${controller.appToStringAsFixed((controller.data[index]["coins_price"] - (controller.data[index]["coins_price"] * (controller.data[index]["coins_offer"] / 100))), 2)}  \$",
                                            style: TextStyle(fontSize: 20),
                                          )),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   InkWell(
//     onTap: () {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (BuildContext context) => PaypalCheckout(
//           sandboxMode: true,
//           clientId:
//               "AcnG2uHYervQ1PfNinUUzOmJMXQlIiInV2nIiavhEvwQZoDgPRAtSat3MJnSxwjUu8HUw07isBJDld4U",
//           secretKey:
//               "EAOYf5oUo_rjDdmIAYoynQY8ugtiwHqFUb_gKHLk1ZQg2OLaKSbdZP9_nycQbNICA6pHEMecRIB9gm2o",
//           returnURL: "success.snippetcoder.com",
//           cancelURL: "cancel.snippetcoder.com",
//           transactions: const [
//             {
//               "amount": {
//                 "total": '100',
//                 "currency": "USD",
//                 "details": {
//                   "subtotal": '100',
//                   //"shipping": '0',
//                   //"shipping_discount": 0
//                 }
//               },
//               "description": "The payment transaction description.",
//               // "payment_options": {
//               //   "allowed_payment_method":
//               //       "INSTANT_FUNDING_SOURCE"
//               // },
//               "item_list": {
//                 "items": [
//                   {
//                     "name": "Coins",
//                     "quantity": 1,
//                     "price": '100',
//                     "currency": "USD"
//                   },
//                   // {
//                   //   "name": "Pineapple",
//                   //   "quantity": 5,
//                   //   "price": '10',
//                   //   "currency": "USD"
//                   // }
//                 ],
//               }
//             }
//           ],
//           note: "Contact us for any questions on your order.",
//           onSuccess: (Map params) async {
//             controller.request(20);
//             print("onSuccess: $params");
//           },
//           onError: (error) {
//             print("onError: $error");
//             Navigator.pop(context);
//           },
//           onCancel: () {
//             print('cancelled:');
//           },
//         ),
//       ));
//     },
//     child: Card(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//               flex: 1,
//               child: Image.asset(
//                 AppImageAsset.coins,
//                 fit: BoxFit.fill,
//                 //    height: 100,
//                 //    width: 100,
//               )),
//           Expanded(
//             flex: 2,
//             child: ListTile(
//               title: Text("${"20 Coins".tr}",
//                   style: const TextStyle(fontSize: 20)),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
//   InkWell(
//     onTap: () {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (BuildContext context) => PaypalCheckout(
//           sandboxMode: true,
//           clientId:
//               "AcnG2uHYervQ1PfNinUUzOmJMXQlIiInV2nIiavhEvwQZoDgPRAtSat3MJnSxwjUu8HUw07isBJDld4U",
//           secretKey:
//               "EAOYf5oUo_rjDdmIAYoynQY8ugtiwHqFUb_gKHLk1ZQg2OLaKSbdZP9_nycQbNICA6pHEMecRIB9gm2o",
//           returnURL: "success.snippetcoder.com",
//           cancelURL: "cancel.snippetcoder.com",
//           transactions: const [
//             {
//               "amount": {
//                 "total": '50',
//                 "currency": "USD",
//                 "details": {
//                   "subtotal": '50',
//                   //"shipping": '0',
//                   //"shipping_discount": 0
//                 }
//               },
//               "description": "The payment transaction description.",
//               // "payment_options": {
//               //   "allowed_payment_method":
//               //       "INSTANT_FUNDING_SOURCE"
//               // },
//               "item_list": {
//                 "items": [
//                   {
//                     "name": "Coins",
//                     "quantity": 1,
//                     "price": '50',
//                     "currency": "USD"
//                   },
//                   // {
//                   //   "name": "Pineapple",
//                   //   "quantity": 5,
//                   //   "price": '10',
//                   //   "currency": "USD"
//                   // }
//                 ],
//               }
//             }
//           ],
//           note: "Contact us for any questions on your order.",
//           onSuccess: (Map params) async {
//             controller.request(10);
//             print("onSuccess: $params");
//           },
//           onError: (error) {
//             print("onError: $error");
//             Navigator.pop(context);
//           },
//           onCancel: () {
//             print('cancelled:');
//           },
//         ),
//       ));
//     },
//     child: Card(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//               flex: 1,
//               child: Image.asset(
//                 AppImageAsset.coins,
//                 fit: BoxFit.fill,
//                 //    height: 100,
//                 //    width: 100,
//               )),
//           Expanded(
//             flex: 2,
//             child: ListTile(
//               title: Text("${"10 Coins".tr}",
//                   style: const TextStyle(fontSize: 20)),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
//   InkWell(
//     onTap: () {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (BuildContext context) => PaypalCheckout(
//           sandboxMode: true,
//           clientId:
//               "AcnG2uHYervQ1PfNinUUzOmJMXQlIiInV2nIiavhEvwQZoDgPRAtSat3MJnSxwjUu8HUw07isBJDld4U",
//           secretKey:
//               "EAOYf5oUo_rjDdmIAYoynQY8ugtiwHqFUb_gKHLk1ZQg2OLaKSbdZP9_nycQbNICA6pHEMecRIB9gm2o",
//           returnURL: "success.snippetcoder.com",
//           cancelURL: "cancel.snippetcoder.com",
//           transactions: const [
//             {
//               "amount": {
//                 "total": '25',
//                 "currency": "USD",
//                 "details": {
//                   "subtotal": '25',
//                   //"shipping": '0',
//                   //"shipping_discount": 0
//                 }
//               },
//               "description": "The payment transaction description.",
//               // "payment_options": {
//               //   "allowed_payment_method":
//               //       "INSTANT_FUNDING_SOURCE"
//               // },
//               "item_list": {
//                 "items": [
//                   {
//                     "name": "Coins",
//                     "quantity": 1,
//                     "price": '25',
//                     "currency": "USD"
//                   },
//                   // {
//                   //   "name": "Pineapple",
//                   //   "quantity": 5,
//                   //   "price": '10',
//                   //   "currency": "USD"
//                   // }
//                 ],
//               }
//             }
//           ],
//           note: "Contact us for any questions on your order.",
//           onSuccess: (Map params) async {
//             controller.request(5);
//             print("onSuccess: $params");
//           },
//           onError: (error) {
//             // print("onError: $error");
//             Navigator.pop(context);
//             Get.defaultDialog(
//                 title: "Warning".tr,
//                 middleText: "Paypal Not Valid In Your Country".tr);
//           },
//           onCancel: () {
//             Navigator.pop(context);
//             Get.defaultDialog(
//                 title: "Warning".tr,
//                 middleText: "You Cancled Your Order".tr);
//           },
//         ),
//       ));
//     },
//     child: Card(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//               flex: 1,
//               child: Image.asset(
//                 AppImageAsset.coins,
//                 fit: BoxFit.fill,
//                 //    height: 100,
//                 //    width: 100,
//               )),
//           Expanded(
//             flex: 2,
//             child: ListTile(
//               title: Text("${"5 Coins".tr}",
//                   style: const TextStyle(fontSize: 20)),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ],
