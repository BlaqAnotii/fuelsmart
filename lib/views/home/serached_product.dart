import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:iconsax/iconsax.dart';

class SearchedProduct extends StatefulWidget {
  const SearchedProduct({super.key});

  @override
  State<SearchedProduct> createState() => _SearchedProductState();
}

class _SearchedProductState extends State<SearchedProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 50,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            navigationService.goBack();
          },
          child: const Icon(Iconsax.arrow_circle_left,
              color: AppColors.darkBlue, size: 25),
        ),
        centerTitle: false,
        title: const Text(
          "Searched Component",
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              25.0.sbH,
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Container(
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
                                    image: AssetImage('assets/images/cng.jpg'),
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
                                        borderRadius: BorderRadius.circular(8),
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
                                  'Mijo',
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
                                        "Purchase",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter"),
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
                    5.0.sbW,
                    Container(
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
                                    image: AssetImage('assets/images/ta.jpg'),
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
                                        borderRadius: BorderRadius.circular(8),
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
                                  'TA',
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
                                        "Purchase",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter"),
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
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
