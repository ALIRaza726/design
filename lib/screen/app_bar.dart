import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditate/helpers/responsive.dart';
import 'package:meditate/screen/Time_date.dart';
import 'package:meditate/screen/camera.dart';
import 'package:meditate/screen/list_view.dart';
import 'package:meditate/screen/map_screen.dart';
import 'package:meditate/screen/menuScreencart.dart';
import 'package:meditate/screen/provider_class.dart';
import 'package:meditate/screen/tabs_screen.dart';
import 'package:meditate/screen/theme_value_pass.dart';
import 'package:meditate/screen/welcome_screen.dart';
import 'package:meditate/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppBarSc extends StatefulWidget {
  static const routeName = '/AppBarSc';
  const AppBarSc({super.key});

  @override
  State<AppBarSc> createState() => _AppBarScState();
}

class _AppBarScState extends State<AppBarSc> {
  int selectedIndex = 0;
  bool isDarkTheme = false;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final TextEditingController _textfieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void Dispose() {
    _textfieldController.dispose();
  }

  final List<String> _yourList = ["Home", "About", "Contact", "Login"];

  Widget _buitlerGridView(int index) {
    var item = _yourList[index];

    return Card(
      elevation: 7,
      color: Color.fromARGB(255, 158, 158, 163),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(child: Text(item)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 145, 237, 208),
        appBar: AppBar(
          //centerTitle: true,
          elevation: 10,
          shadowColor: Color.fromARGB(255, 44, 231, 234),
          backgroundColor: Color.fromARGB(255, 73, 247, 192),

          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    'User Name: ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 1, 17),
                      fontSize: Responsive.isMobile(context) ? 15.sp : 25.sp,
                    ),
                  ),
                  Responsive.isMobile(context)
                      ? const Text(
                          'Ali Raza',
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 1, 17),
                              fontSize: 15,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          'Ali Raza',
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 1, 17),
                              fontSize: 25.sp,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900),
                        ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'E-mail: ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 1, 17),
                      fontSize: Responsive.isMobile(context) ? 15.sp : 25.sp,
                    ),
                  ),
                  Responsive.isMobile(context)
                      ? Text(
                          'Ali@gmail',
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 1, 17),
                              fontSize:
                                  Responsive.isMobile(context) ? 15.sp : 25.sp,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          'Ali@gmail',
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 1, 17),
                              fontSize:
                                  Responsive.isMobile(context) ? 15.sp : 25.sp,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900),
                        ),
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            // Set the height of the bottom bar
            child: Container(
              color: const Color.fromARGB(255, 63, 214, 225),
              height: 50.0,
              child: Center(
                child: Text(
                  'Enter Personal Data',
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context) ? 15.sp : 30.sp,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Responsive.isMobile(context)
                          ? Container(
                              width: 130,
                              height: 25,
                              child: TextFormField(
                                cursorColor: Colors.white,
                                cursorHeight: 10,
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                                decoration: InputDecoration(
                                    prefixIcon: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      child: Icon(
                                        Icons.search,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    labelText: 'Search',
                                    labelStyle: const TextStyle(
                                        fontSize: 10, color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 247, 246, 246))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            )
                          : Container(
                              width: 240.sp,
                              height: 32.sp,
                              child: TextFormField(
                                cursorColor: Colors.white,
                                cursorHeight: 10,
                                textAlignVertical: TextAlignVertical.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                                decoration: InputDecoration(
                                    prefixIcon: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      child: Icon(
                                        Icons.search,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    labelText: 'Search',
                                    labelStyle: const TextStyle(
                                        fontSize: 10, color: Colors.white),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 247, 246, 246))),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 63, 214, 225),
          width: 200,
          child: ListView(
            children: [
              DrawerHeader(
                curve: Curves.bounceOut,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ali Raza',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'User Name: ',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 1, 1, 17),
                            fontSize:
                                Responsive.isMobile(context) ? 15.sp : 20.sp,
                          ),
                        ),
                        Text(
                          'Ali Raza',
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 1, 17),
                              fontSize:
                                  Responsive.isMobile(context) ? 15.sp : 20.sp,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'E-mail: ',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 1, 1, 17),
                            fontSize:
                                Responsive.isMobile(context) ? 15.sp : 20.sp,
                          ),
                        ),
                        const Text(
                          'Ali@gmail.com',
                          style: TextStyle(
                              color: Color.fromARGB(255, 1, 1, 17),
                              fontSize: 15,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Password:    ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 1, 17),
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '*******',
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 1, 17),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 230, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '<< Back ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 1, 17),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 60,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapScreen()));
                      },
                      child: Container(
                        color: Color.fromARGB(255, 51, 171, 180),
                        height: 50,
                        width: 200,
                        margin: EdgeInsets.symmetric(vertical: 70),
                        alignment: Alignment.bottomCenter,
                        child: const Center(
                          child: Text(
                            "goolge Map",
                            style: TextStyle(
                              color: Color.fromARGB(255, 248, 242, 242),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.isMobile(context) ? 4 : 8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: [
                  Card(
                    elevation: 10,
                    child: Column(children: [
                      const Text('Time/D'),
                      SizedBox(
                        // width: 40,
                        height: 30.h,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20).r)),
                            backgroundColor: const MaterialStatePropertyAll(
                              Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const time_date()));
                          },
                          child: const Text('T/d',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ]),
                  ),
                  Card(
                    elevation: 10,
                    child: Column(children: [
                      Text(
                        'camera',
                        style: GoogleFonts.aDLaMDisplay(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const camera()));
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/camera.png"),
                              ),
                              color: Color.fromARGB(255, 118, 76, 216),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ]),
                  ),
                  Card(
                    elevation: 10,
                    child: Column(children: [
                      Text('theme'),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const provider_theme()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        const Text('Ahsan'),
                        Container(
                          width: 130,
                          height: 25,
                          child: TextFormField(
                            cursorColor: Color.fromARGB(255, 21, 20, 20),
                            cursorHeight: 10,
                            textAlignVertical: TextAlignVertical.center,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 248, 98, 98),
                                fontSize: 10),
                            decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 1),
                                  child: Icon(
                                    Icons.search,
                                    size: 15,
                                    color: Color.fromARGB(255, 209, 35, 35),
                                  ),
                                ),
                                labelText: 'Search',
                                labelStyle: const TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 28, 28, 221)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 214, 83, 83))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Column(children: [
                      const Text('Tab/Sc'),
                      SizedBox(
                        // width: 40,
                        height: 30,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor: const MaterialStatePropertyAll(
                              Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const tabs_screen()));
                          },
                          child: const Text('tab',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ]),
                  ),
                  Card(
                    elevation: 10,
                    child: Column(children: [
                      Text('welcome'),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/wel_come.png"),
                              ),
                              color: const Color.fromARGB(255, 243, 245, 246),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ]),
                  ),
                  Card(
                    elevation: 10,
                    child: Column(children: [
                      RichText(
                        text: const TextSpan(
                            text: 'c',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 80, 43, 244),
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'A',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic)),
                              TextSpan(
                                  text: 'rt',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 78, 186, 235),
                                  ))
                            ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuScreen()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/cart.png'),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        const Text('Ahsan'),
                        Container(
                          width: 130,
                          height: 25,
                          child: TextFormField(
                            cursorColor: Color.fromARGB(255, 21, 20, 20),
                            cursorHeight: 10,
                            textAlignVertical: TextAlignVertical.center,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 248, 98, 98),
                                fontSize: 10),
                            decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 1),
                                  child: Icon(
                                    Icons.search,
                                    size: 15,
                                    color: Color.fromARGB(255, 209, 35, 35),
                                  ),
                                ),
                                labelText: 'Search',
                                labelStyle: const TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 28, 28, 221)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 214, 83, 83))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 400.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 0.9,
                    focalRadius: BorderSide.strokeAlignOutside,
                    colors: [
                      Color.fromARGB(255, 49, 203, 223),
                      Color.fromARGB(255, 145, 237, 208)
                    ],
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Responsive.isMobile(context) ? 20.h : 10.h,
                      ),
                      Responsive.isMobile(context)
                          ? Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10).r)),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                              ],
                            ),
                      TextFormField(
                        // Two digits after (.) value
                         keyboardType: TextInputType.number,
                         inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                        onFieldSubmitted: (value) {},
                        controller: _textfieldController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                     
                     
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //     content: Text('Enter Correct UserName'),
                              //   ),
                              // );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WelcomeScreen()));
                            }
                          },
                          child: const Text(
                            'Add Value',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //   GridView.builder(
              //     scrollDirection: Axis.vertical,
              //     shrinkWrap: true,
              //     physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 5),
              //     itemCount: _yourList.length,
              //     itemBuilder: (context, int index) {
              //       return _buitlerGridView(index);
              //     },
              //   )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListViewScreen()));
          },
          backgroundColor: const Color.fromARGB(255, 73, 247, 192),
          child: const Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 22, 127, 212),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 20,
            elevation: 10,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  label: 'login'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'setting'),
            ],
            backgroundColor: Color.fromARGB(255, 48, 213, 239),
            currentIndex: selectedIndex,
            selectedItemColor: Color.fromARGB(255, 11, 166, 117),
            unselectedItemColor: Color.fromARGB(255, 2, 2, 2),
            onTap: (value) {
              onItemTapped(value);
            }),
      ),
    );
  }
}
