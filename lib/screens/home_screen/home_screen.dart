import 'package:doctor_appointment_app/data/data.dart';
import 'package:doctor_appointment_app/domain/doctor_model.dart';
import 'package:doctor_appointment_app/screens/doctor_detail_screen/doctor_details_screen.dart';
import 'package:doctor_appointment_app/utils/constant/app_constant.dart';
import 'package:doctor_appointment_app/utils/constant/image_constant.dart';
import 'package:doctor_appointment_app/utils/themes/color_themes.dart';
import 'package:doctor_appointment_app/utils/widget/text_widget.dart';
import 'package:doctor_appointment_app/utils/widget/transparent_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Track the selected category index
  int selectedIndex = 0;

  // Track the search field value
  String searchQuery = '';

  // Define a filtered list of doctors based on search
  List<DoctorModel> filteredDoctors = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Filter doctors based on the search query
    filteredDoctors = doctorList.where((doctor) {
      final nameLower = doctor.doctorName.toLowerCase();
      final specialityLower = doctor.speciality.toLowerCase();
      final searchLower = searchQuery.toLowerCase();
      return nameLower.contains(searchLower) || specialityLower.contains(searchLower);
    }).toList();
  print("searchQuery: ${searchQuery.isEmpty}");
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Field
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                image: const DecorationImage(
                  image: AssetImage(ImageConstant.homeTexture),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mediumSpaceh,
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/userImage.png"),
                        ),
                        smallSpacew,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTextWidget(
                              text: "Hello, Welcome 🎉",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            customTextWidget(
                              text: "Savannah Nguyen",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          ImageConstant.notificationIcon,
                          height: 40,
                        ),
                      ],
                    ),
                    // Updated Search Field
                    TransparentSearchField(
                      controller: searchController,
                      onSearch: (value) {

                        setState(() {
                          searchQuery = value;
                        });
                      },
                      // hintText: "Search doctor by name or speciality...",
                    ),
                  ],
                ),
              ),
            ),
            mediumSpaceh,

            // Show the normal UI if search query is empty
            searchQuery.isEmpty
                ? buildNormalUI()
                : filteredDoctors.isNotEmpty
                ? buildFilteredDoctorList()
                : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customTextWidget(
                    text: "No doctor found.",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                  mediumSpaceh,
                  Lottie.asset('assets/searchJson.json' , height: MediaQuery.of(context).size.height * 0.4 , width: MediaQuery.of(context).size.width * 0.5),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the normal UI when no search is performed
  Widget buildNormalUI() {
    return Column(
      children: [
        // Display categories or other normal content
        mediumSpaceh,
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? primaryColor
                            : const Color(0xffEDEDFC).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: customTextWidget(
                          text: categories[index],
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: selectedIndex == index ? Colors.white : lightPurpleColor,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        // Other UI like favorite doctors, top doctors, etc.
        mediumSpaceh,

        // Center content instead of using Expanded
        mediumSpaceh,
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customTextWidget(text: "Favorite Doctor", fontSize: 16, fontWeight: FontWeight.w500),
              customTextWidget(text: "See all", fontSize: 12, fontWeight: FontWeight.w400 ,color: primaryColor),
            ],
          ),
        ),
        mediumSpaceh,
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 200, // Constrain the height for the list
            child: // Replace ListView.builder with a Row or Wrap


            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetailsScreen(doctorModel: favoriteDoctors[index]),));
                    },
                    child: Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height *0.25,
                        width: MediaQuery.of(context).size.width *0.5,// Add horizontal padding for spacing
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 134,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(favoriteDoctors[index].doctorImage),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10) , topLeft: Radius.circular(10))                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10 , top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  customTextWidget(
                                    text: favoriteDoctors[index].doctorName,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  Wrap(
                                    children: [
                                      const Icon(
                                        Icons.star_purple500_outlined,
                                        color: Color(0xffFFD33C),
                                        size: 16,
                                      ),
                                      customTextWidget(
                                        text: favoriteDoctors[index].rating.toString(),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: customTextWidget(
                                text: favoriteDoctors[index].speciality,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),

                          ],
                        )
                    ),
                  ),

                );
              },
              itemCount: favoriteDoctors.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        mediumSpaceh,
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customTextWidget(text: "Top Doctor", fontSize: 16, fontWeight: FontWeight.w500),
              customTextWidget(text: "See all", fontSize: 12, fontWeight: FontWeight.w400 ,color: primaryColor),
            ],
          ),
        ),
        // mediumSpaceh,
        Padding(
          padding: const EdgeInsets.only(left: 10 , right: 10),
          child: ListView.separated(
            separatorBuilder: (context, index) => smallSpaceh,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailsScreen(doctorModel: doctorList[index]),
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.5, // Add horizontal padding for spacing
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(doctorList[index].doctorImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Add a horizontal space if necessary
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns the text and icon
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      customTextWidget(
                                        text: doctorList[index].doctorName,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(ImageConstant.moreIcon),
                                            fit: BoxFit.cover,
                                          ),

                                        ),
                                      ), // Positioned to the right
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: customTextWidget(
                                    text: "${doctorList[index].speciality} | ${doctorList[index].clinicName}",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: lighterColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star_purple500_outlined,
                                        color: Color(0xffFFD33C),
                                        size: 16,
                                      ),
                                      customTextWidget(
                                        text: doctorList[index].rating.toString(),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      customTextWidget(
                                        text: "(${doctorList[index].totalReviews.toString()} reviews)",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: lighterColor,
                                      ),
                                    ],
                                  ),
                                ),
                                smallSpaceh,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              ;
            },
            itemCount: doctorList.length,
            scrollDirection: Axis.vertical,
          ),
        ),
        // buildFavoriteDoctorList(),
      ],
    );
  }

  // Build the filtered doctor list based on the search query
  Widget buildFilteredDoctorList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: filteredDoctors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailsScreen(doctorModel: doctor),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 134,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(doctor.doctorImage),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTextWidget(
                                  text: doctor.doctorName,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                customTextWidget(
                                  text: doctor.speciality,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget for the normal favorite doctor list
  Widget buildFavoriteDoctorList() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: favoriteDoctors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final doctor = favoriteDoctors[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorDetailsScreen(doctorModel: doctor),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 134,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(doctor.doctorImage),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customTextWidget(
                              text: doctor.doctorName,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            customTextWidget(
                              text: doctor.speciality,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
