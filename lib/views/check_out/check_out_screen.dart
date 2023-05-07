import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ems/services/payment_service/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../../widgets/my_widgets.dart';

class CheckOutView extends StatefulWidget {
  DocumentSnapshot? eventDoc;

  CheckOutView(this.eventDoc);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int selectedRadio = 0;

  void setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
    );
  }

  String eventImage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    try {
      List media = widget.eventDoc!.get('media') as List;
      Map mediaItem =
          media.firstWhere((element) => element['isImage'] == true) as Map;
      eventImage = mediaItem['url'];
    } catch (e) {
      eventImage = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: Get.height,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 27,
                      height: 27,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/circle.png'),
                        ),
                      ),
                      child: Image.asset('assets/bi_x-lg.png'),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: myText(
                        text: 'CheckOut',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text(''),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 1,
                      color: const Color(0xff393939).withOpacity(0.15),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(eventImage),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                myText(
                                  text: widget.eventDoc!.get('event_name'),
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                myText(
                                  text: 'may 15',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 11.67,
                                height: 15,
                                child: Image.asset(
                                  'assets/location.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              myText(
                                text: widget.eventDoc!.get('location'),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          myText(
                            text: widget.eventDoc!.get('date'),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              myText(
                text: 'Payment Method',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 16,
                        height: 12,
                        child: Image.asset(
                          'assets/Group1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      myText(
                        text: 'Add Card detail',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Radio(
                    value: 0,
                    groupValue: selectedRadio,
                    onChanged: (int? val) {
                      setSelectedRadio(val!);
                    },
                  ),
                ],
              ),
              textField(text: 'Card Number'),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      margin: EdgeInsets.only(
                        bottom: Get.height * 0.02,
                      ),
                      child: TextFormField(
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: InputDecoration(
                          hintText: 'Expiration date',
                          contentPadding:
                              const EdgeInsets.only(top: 10, left: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.04,
                  ),
                  Expanded(child: textField(text: 'Security Code'))
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Row(
                children: [
                  myText(
                    text: 'Other option',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        setSelectedRadio(value!);
                      });
                    },
                    activeColor: AppColors.blue,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 48,
                    height: 34,
                    child: Image.asset(
                      'assets/paypal.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  myText(
                    text: 'Paypal',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        setSelectedRadio(value!);
                      });
                    },
                    activeColor: AppColors.blue,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 48,
                    height: 34,
                    child: Image.asset(
                      'assets/strip.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  myText(
                    text: 'Strip',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Radio(
                    value: 3,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        setSelectedRadio(value!);
                      });
                    },
                    activeColor: AppColors.blue,
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  myText(
                    text: 'Event Fee',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  myText(
                    text: '\$${widget.eventDoc!.get('price')}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  myText(
                    text: 'Total Ticket',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  myText(
                    text: '\$${int.parse(widget.eventDoc!.get('price')) + 2}',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 50,
                width: double.infinity,
                child: elevatedButton(
                  onpress: () {
                    if (selectedRadio == 3) {
                      // makePayment(context,amount: '${int.parse(widget.eventDoc!.get('price')) + 2}',eventId: widget.eventDoc!.id);
                    }
                  },
                  text: 'Book Now',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
