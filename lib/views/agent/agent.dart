import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/controllers/auth_vm.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/utils/widget_extensions.dart';
import 'package:flutter_template/views/agent/add_product.dart';
import 'package:flutter_template/views/base.dart';
import 'package:flutter_template/views/startup/landing_view.dart';
import 'package:flutter_template/views/startup/login.dart';
import 'package:iconsax/iconsax.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
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
              title: const Text(
                "Welcome, Admin001",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inter"),
              ),
              actions: const [
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
                    const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.dashboard_customize,
                          size: 20,
                          color: AppColors.white,
                        ),
                      ),
                      title: Text(
                        "Dashboard",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter"),
                      ),
                    ),
                    const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.people,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Customers",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter"),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        navigationService.push(const AddProductView());
                      },
                      leading: const Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      title: const Text(
                        "Products",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter"),
                      ),
                    ),
                    const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.book,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Bookings",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter"),
                      ),
                    ),
                    const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.receipt,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Transactions",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter"),
                      ),
                    ),
                    const ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "In-app Notification",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Inter"),
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
                            fontFamily: "Inter"),
                      ),
                    ),
                    const SizedBox(
                      height: 190,
                    ),
                    ListTile(
                      onTap: () {
                        promptUser(context, "Sign Out",
                            "Are you sure you want to logout?", () async {
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
                            fontFamily: "Inter"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    15.0.sbH,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              // navigationService.push(TransactionLogView(
                              //   isVendor: true,
                              //   vendorID: widget.vendor.id,
                              // ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: 170.w,
                              height: 170.h,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                    Colors.white,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                    offset: const Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const AutoSizeText(
                                        '200',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset('assets/images/hand.png'),
                                    ],
                                  ),
                                  15.0.sbH,
                                  const AutoSizeText(
                                    'All Transactions',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 170.w,
                            height: 170.h,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const AutoSizeText(
                                      '2000',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Image.asset('assets/images/people.png'),
                                  ],
                                ),
                                15.0.sbH,
                                const AutoSizeText(
                                  'Customers',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    15.0.sbH,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 170.w,
                            height: 170.h,
                            decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const AutoSizeText(
                                      '10',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Image.asset('assets/images/invoice.png'),
                                  ],
                                ),
                                15.0.sbH,
                                const AutoSizeText(
                                  'Pending Bookings',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // navigationService.push(TransactionLogView(
                              //   isVendor: true,
                              //   vendorID: widget.vendor.id,
                              //   transactionStatus: TransactionStatus.complete,
                              // ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: 170.w,
                              height: 170.h,
                              decoration: BoxDecoration(
                                color: AppColors.green,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 1,
                                    offset: const Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const AutoSizeText(
                                        '12',
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Image.asset('assets/images/box.png'),
                                    ],
                                  ),
                                  15.0.sbH,
                                  const AutoSizeText(
                                    'Closed Transactions',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                    40.0.sbH,
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                              Colors.white,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AutoSizeText(
                                  'Recent Sales',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Iconsax.arrow_right_1),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(3),
                                  leading: CircleAvatar(
                                    child: Image.asset(
                                        'assets/images/Profile.png'),
                                  ),
                                  title: const AutoSizeText(
                                    'Shola Kojo',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: const AutoSizeText(
                                    'email@fakedomain.net',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.ruby,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.all(3),
                                  leading: CircleAvatar(
                                    child: Image.asset(
                                        'assets/images/Profile.png'),
                                  ),
                                  title: const AutoSizeText(
                                    'Fleming Usiomah',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: const AutoSizeText(
                                    'email@fakedomain.net',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.ruby,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.all(3),
                                  leading: CircleAvatar(
                                    child: Image.asset(
                                        'assets/images/Profile.png'),
                                  ),
                                  title: const AutoSizeText(
                                    'Matt Dukes',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: const AutoSizeText(
                                    'email@fakedomain.net',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppColors.ruby,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
