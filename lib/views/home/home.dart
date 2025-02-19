import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/controllers/auth_vm.dart';
import 'package:flutter_template/data/https.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/resources/events.dart';
import 'package:flutter_template/services/app_cache.dart';
import 'package:flutter_template/services/locator.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/button.dart';
import 'package:flutter_template/utils/filter.dart';
import 'package:flutter_template/utils/snack_message.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/home/book_CNG.dart';
import 'package:flutter_template/views/home/profile.dart';
import 'package:flutter_template/views/home/serached_product.dart';
import 'package:flutter_template/views/startup/landing_view.dart';
import 'package:flutter_template/views/startup/login.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/home.vm.dart';
import '../base.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

listenForEvent(
    HomeViewModel model, ApplicationEvent event, BuildContext context) {
  if (event.type == 'warning_event') {
    showCustomToast(event.message, toastType: ToastType.warning);
  }
  if (event.type == 'info_event') {
    showCustomToast(event.message, toastType: ToastType.info);
  }
  if (event.type == 'error_event') {
    showCustomToast(event.message, toastType: ToastType.error);
  }
  if (event.type == 'success_event') {
    showCustomToast(event.message, toastType: ToastType.success);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedTab = 0;

  // static final List _categories = <Widget>[
  //   const FeaturedWidgetAll(),
  //   const FeaturedWidgetAll(),
  //   const FeaturedWidgetAll(),
  // ];

  String? selectedPropertyType;
  String? selectedLocation;
  String? selectedBedroom;
  String? selectedCondition;
  String? selectedPriceRange;
  String? selectedTime;

  List<String> propertyTypes = [
    'Toyota',
    'Mercedes',
    'Lexus',
    'Hyundai',
    'Honda',
  ];

  List<String> priceRanges = [
    '${150000} - ${350000}',
    '${350000} - ${350000}',
    '${550000} - ${750000}',
    '${750000} - ${950000}',
    '${950000} - ${1500000}',
    '${1500000} - ${3500000}',
    '${3500000} & Above',
  ];
  List<String> times = [
    'V4',
    'V6',
    'V8',
    'V12',
  ];

  AppData cache = getIt<AppData>();

  String lastname = '';
  String firstname = '';

  @override
  void initState() {
    super.initState();
    _name();
  }

  Future<void> _name() async {
    String? lname = cache.getStringPreference('last_name');
    String? fname = cache.getStringPreference('first_name');

    setState(() {
      if (lname != null) {
        lastname = lname;
      }
      if (fname != null) {
        firstname = fname;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (model) {},
      onListenForEvent: (model, event) {
        //listenForEvent(model, event, context);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          toolbarHeight: 50,
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Iconsax.profile_circle,
                    color: AppColors.darkBlue, size: 25),
              );
            },
          ),
          centerTitle: false,
          title: Text(
            "Welcome, $firstname $lastname",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'JosefinSans'),
          ),
          actions: const [
            Padding(
                padding: EdgeInsets.only(
                  right: 14,
                ),
                child: Icon(Iconsax.shopping_cart)),
            Padding(
                padding: EdgeInsets.only(
                  right: 14,
                ),
                child: Icon(Iconsax.notification))
          ],
        ),
        drawer: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
          ),
          child: Drawer(
            backgroundColor: AppColors.darkBlue,
            width: 260,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ListTile(
                  onTap: () {
                    navigationService.push(const HomeScreen());
                  },
                  leading: const Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Icon(
                      Icons.home_filled,
                      size: 20,
                      color: AppColors.white,
                    ),
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    navigationService.push(const Profile());
                  },
                  leading: const Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "Favorites",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 190,
                ),
                ListTile(
                  onTap: () {
                    promptUser(
                        context, "Sign Out", "Are you sure you want to logout?",
                        () async {
                      model.processLogout();
                    });
                  },
                  leading: const Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Icon(
                      Iconsax.logout,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 0.3)),
                    hintText: "Search CNG Parts",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    suffix: const Icon(
                      Icons.search,
                      size: 23,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),

              Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.darkBlue,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterDropDown(
                        selectedValue: selectedPropertyType,
                        hint: "Car Type",
                        onChanged: (newValue) {
                          setState(() {
                            selectedPropertyType = newValue;
                          });
                        },
                        items: propertyTypes,
                      ),
                      const SizedBox(
                        width: 5,
                      ), // Red background color
                      FilterDropDown(
                        selectedValue: selectedPriceRange,
                        hint: "Price Range",
                        onChanged: (newValue) {
                          setState(() {
                            selectedPriceRange = newValue;
                          });
                        },
                        items: priceRanges,
                      ), // Orange background color
                      const SizedBox(
                        width: 5,
                      ), // Space between dropdowns
                      FilterDropDown(
                        selectedValue: selectedTime,
                        hint: "Engine Type",
                        onChanged: (newValue) {
                          setState(() {
                            selectedTime = newValue;
                          });
                        },
                        items: times,
                      ),
                      // Purple background color
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // ignore: use_full_hex_values_for_flutter_colors
                          backgroundColor: AppColors.darkBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          navigationService.push(const SearchedProduct());
                        },
                        child: const Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Featured",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: use_full_hex_values_for_flutter_colors
                        backgroundColor: AppColors.darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => const PropertyPage(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => Container(
                        width: 250,
                        margin: const EdgeInsets.only(right: 15, bottom: 35),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            border: Border.all(
                              width: 0.4,
                              color: AppColors.darkBlue,
                            )),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 190,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/cngpart.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10.0,
                                  left: 10.0,
                                  right: 10.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                          vertical: 5.0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.orange.withOpacity(0.5),
                                        ),
                                        child: const Text(
                                          "sponsored",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      // SavedBox(
                                      //   isSaved: data["is_favorited"],
                                      // ),
                                    ],
                                  ),
                                ),
                                // Positioned(
                                //   bottom: sm ? 17 : 20,
                                //   // Adjust the top position as needed
                                //   left: sm ? 16 : 20,
                                //   // Adjust the left position as needed
                                //   child: RatingStars(ratings[currentIndex]),
                                // ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(
                                10,
                              ),
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'CNG Part',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                      ),
                                      Text(
                                        'Wuse 2, Abuja',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "₦30,000",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.darkBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () {
                                          // Navigator.push(
                                          //   context,
                                          //   CupertinoPageRoute(
                                          //     builder: (context) =>
                                          //         const ProductDetailPage(),
                                          //   ),
                                          // );
                                        },
                                        child: const Text(
                                          "Add to Cart",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent Transaction",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: use_full_hex_values_for_flutter_colors
                        backgroundColor: AppColors.darkBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => const PropertyPage(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              17.0.sbH,

              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 0.4,
                        color: AppColors.darkBlue,
                      )),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/cngpart.jpg',
                        scale: 10,
                      ),

                      16.0.sbW,
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('CNG part',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text('₦30,000',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkBlue)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '27, August 2024',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  '9:00am',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Text(amount,
                      //     style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 0.4,
                        color: AppColors.darkBlue,
                      )),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/cngpart.jpg',
                        scale: 10,
                      ),

                      16.0.sbW,
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('CNG part',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                                Text('₦30,000',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.darkBlue)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '27, August 2024',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  '9:00am',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Text(amount,
                      //     style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                    ],
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: EdgeInsets.only(
              //       left:  Adaptive.sp(10) : Adaptive.sp(10),
              //     ),
              //     child: Row(
              //       children: [
              //         ...List.generate(
              //           property.length,
              //           (index) => PropertyCategory(
              //             data: property[index],
              //             isSelected: selectedTab == index,
              //             onTap: () {
              //               setState(() {
              //                 selectedTab = index;
              //               });
              //             },
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // IndexedStack(
              //   index: selectedTab,
              //   children: List.generate(
              //     property.length,
              //     (index) => _categories[index],
              //   ),
              // ),
              // SizedBox(
              //   height:  Adaptive.h(3) : Adaptive.h(3),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left:  20 : 20,
              //     right:  20 : 20,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text(
              //         "Distressed Sales",
              //         style: TextStyle(
              //             color: Colors.red,
              //             fontSize:  16 : 23,
              //             fontWeight: FontWeight.w600,
              //             ),
              //       ),
              //       ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           // ignore: use_full_hex_values_for_flutter_colors
              //           backgroundColor: AppColors.darkBlue,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5),
              //           ),
              //         ),
              //         onPressed: () {
              //           Navigator.pushReplacement(
              //             context,
              //             CupertinoPageRoute(
              //               builder: (context) => const PropertyPage(),
              //             ),
              //           );
              //         },
              //         child: const Text(
              //           "View all",
              //           style: TextStyle(
              //             fontSize:  15 : 20,
              //             ,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height:  Adaptive.h(3) : Adaptive.h(3),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   padding: const EdgeInsets.only(
              //     left:  15 : 15,
              //   ),
              //   child: Row(
              //     children: List.generate(
              //       distress.length,
              //       (index) => DistressContainer(data: distress[index]),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height:  Adaptive.h(3) : Adaptive.h(3),
              // ),
              // const AdvertContainer(),
              // SizedBox(
              //   height:  Adaptive.h(3) : Adaptive.h(3),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left:  20 : 20,
              //     right:  20 : 20,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Text(
              //         "Interior Decorators",
              //         style: TextStyle(
              //             color: AppColors.darkBlue,
              //             fontSize:  16 : 23,
              //             fontWeight: FontWeight.w600,
              //             ),
              //       ),
              //       ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           // ignore: use_full_hex_values_for_flutter_colors
              //           backgroundColor: AppColors.darkBlue,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5),
              //           ),
              //         ),
              //         onPressed: () {
              //           Navigator.pushReplacement(
              //             context,
              //             CupertinoPageRoute(
              //               builder: (context) => const InteriorPage(),
              //             ),
              //           );
              //         },
              //         child: const Text(
              //           "View all",
              //           style: TextStyle(
              //             fontSize:  15 : 20,
              //             ,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height:  Adaptive.h(3) : Adaptive.h(3),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   padding: const EdgeInsets.only(
              //     left:  15 : 15,
              //   ),
              //   child: Row(
              //     children: List.generate(
              //       interior.length,
              //       (index) => InteriorContainer(data: interior[index]),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height:  Adaptive.h(4) : Adaptive.h(4),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
