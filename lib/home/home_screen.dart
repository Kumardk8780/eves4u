import 'package:eves4u/controller/data_controller.dart';
import 'package:eves4u/widgets/custom_app_bar.dart';
import 'package:eves4u/widgets/events_feed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.03),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),

                Text(
                  "What Going on today",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                eventsFeed(),
                eventsIJoined(),
                // Obx(()=> dataController.isUsersLoading.value? const Center(child: CircularProgressIndicator(),) : EventsIJoined())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
