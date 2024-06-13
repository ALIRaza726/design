import 'package:meditate/helpers/responsive.dart';
import 'package:flutter/material.dart';

class practice extends StatefulWidget {
  const practice({super.key});

  @override
  State<practice> createState() => _practiceState();
}

class _practiceState extends State<practice> {
  List<List<int>> countsList = List.generate(12, (index) => List.filled(10, 0));

  int selectedIndex = 0;
  int? singleItemIndex;
  int? singleCartIndex;

  final List<Map<String, dynamic>> menuItems = [
    {'image': 'assets/images/starter.png', "text": 'STARTER'},
    {'image': 'assets/images/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/images/beverages.png', "text": 'BEVERAGES'},
    {'image': 'assets/images/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/images/beverages.png', "text": 'BEVERAGES'},
    {'image': 'assets/images/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/images/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/images/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/images/beverages.png', "text": 'BEVERAGES'},
    {'image': 'assets/images/dessert.png', "text": 'DESSERT'},
    {'image': 'assets/images/beverages.png', "text": 'BEVERAGES'},
    {'image': 'assets/images/beverages.png', "text": 'BEVERAGES'},
  ];
  List<List<Map<String, dynamic>>> itemsList = [];
  List<ScrollController> itemControllers = [];
  @override
  void initState() {
    super.initState();
    itemsList = List.generate(menuItems.length, (index) => menuItems);
    // itemControllers =
    //     List.generate(menuItems.length, (index) => ScrollController());
    selectedIndex = 0; // Set the first index as the default selected index
  }

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 21, 20, 20),
          title: const Center(
            child: Text(
              'Ali raza',
              style: TextStyle(color: Color.fromRGBO(246, 249, 49, 1)),
            ),
          ),
        ),
        body: Responsive.isMobile(context)
            ? Row(
                children: [
                  Container(
                    color: Color.fromARGB(255, 106, 227, 240),
                    width: 100,
                    // height: 100,
                    child: ListView.builder(
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });

                              print(
                                  "row index:  ${controller.position.maxScrollExtent.toString()}");
                              controller.animateToPage(index,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.bounceOut);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: index == selectedIndex
                                            ? Colors.black.withOpacity(0.3)
                                            : Colors.transparent,
                                      ),
                                      child: Transform.scale(
                                        scale: 0.6,
                                        child: Image.asset(
                                          menuItems[index]['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    menuItems[index]['text'],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                      child: PageView.builder(
                          controller: controller,
                          itemCount: menuItems.length,
                          onPageChanged: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ListView.separated(
                              separatorBuilder: (context, index) => Container(
                                height: 1,
                                color: Colors.black,
                              ),
                              itemCount: 4,
                              shrinkWrap: true,
                              itemBuilder: (context, itemIndex) {
                                bool isSelected =
                                    singleItemIndex == itemIndex &&
                                        singleCartIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        singleItemIndex = null;
                                        singleCartIndex = null;
                                      } else {
                                        singleItemIndex = itemIndex;
                                        singleCartIndex = index;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 300,
                                    color: Color.fromARGB(255, 255, 242, 120),
                                    child: Stack(
                                      children: [
                                        Image.asset('assets/images/pizza4.png',
                                            width: 300, fit: BoxFit.fill),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Column(
                                            children: [
                                              Text('Cheese Pizza'),
                                              SizedBox(height: 10),
                                              Text('\$8'),
                                            ],
                                          ),
                                        ),
                                        if (isSelected ||
                                            countsList[index][itemIndex] > 0)
                                          Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    stops: const [0.01, 0.6],
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                      const Color.fromARGB(
                                                              255, 10, 10, 10)
                                                          .withOpacity(0.8),
                                                      Colors.transparent
                                                    ]),
                                              )),
                                        if (isSelected ||
                                            countsList[index][itemIndex] > 0)
                                          Positioned(
                                            bottom: 10,
                                            left: 25,
                                            right: 25,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                IconButton(
                                                  icon:
                                                      const Icon(Icons.remove),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (countsList[index]
                                                              [itemIndex] >
                                                          0) {
                                                        countsList[index]
                                                            [itemIndex]--;
                                                      }
                                                    });
                                                  },
                                                  color: Colors.white,
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      countsList[index]
                                                              [itemIndex]
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add),
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    setState(() {
                                                      countsList[index]
                                                          [itemIndex]++;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }))
                ],
              )
            : Column(
                children: [
                  Container(
                    color: Color.fromARGB(255, 106, 227, 240),
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });

                              print(
                                  "row index:  ${controller.position.maxScrollExtent.toString()}");
                              controller.animateToPage(index,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.bounceOut);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: ClipOval(
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: index == selectedIndex
                                              ? Colors.black.withOpacity(0.2)
                                              : Colors.transparent,
                                        ),
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: Image.asset(
                                            menuItems[index]['image'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      // height: 5,
                                      ),
                                  Text(
                                    menuItems[index]['text'],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                      child: PageView.builder(
                          controller: controller,
                          itemCount: menuItems.length,
                          onPageChanged: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, itemIndex) {
                            return GestureDetector(
                                child: GridView.builder(
                              //scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const PageScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 2),
                              itemCount: menuItems.length,
                              itemBuilder: (context, int index) {
                                bool isSelected =
                                    singleItemIndex == itemIndex &&
                                        singleCartIndex == index;
                                return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isSelected) {
                                          singleItemIndex = null;
                                          singleCartIndex = null;
                                        } else {
                                          singleItemIndex = itemIndex;
                                          singleCartIndex = index;
                                        }
                                      });
                                    },
                                    child: Container(
                                      color: const Color.fromARGB(
                                          255, 253, 253, 124),
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Image.asset(
                                                'assets/images/pizza4.png',
                                                width: 400,
                                                fit: BoxFit.fill),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Cheese Pizza',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color.fromARGB(
                                                          255, 73, 57, 251)),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  '\$8',
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (isSelected ||
                                              countsList[index][itemIndex] > 0)
                                            Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin: Alignment
                                                          .bottomCenter,
                                                      stops: const [0.01, 0.6],
                                                      end: Alignment.topCenter,
                                                      colors: [
                                                        Colors.black
                                                            .withOpacity(0.8),
                                                        Colors.transparent
                                                      ]),
                                                )),
                                          if (isSelected ||
                                              countsList[index][itemIndex] > 0)
                                            Positioned(
                                              bottom: 10,
                                              left: 25,
                                              right: 25,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  IconButton(
                                                    iconSize: 40,
                                                    icon: const Icon(
                                                        Icons.remove),
                                                    onPressed: () {
                                                      setState(() {
                                                        if (countsList[index]
                                                                [itemIndex] >
                                                            0) {
                                                          countsList[index]
                                                              [itemIndex]--;
                                                        }
                                                      });
                                                    },
                                                    color: Colors.white,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        countsList[index]
                                                                [itemIndex]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    iconSize: 40,
                                                    icon: const Icon(Icons.add),
                                                    color: Colors.white,
                                                    onPressed: () {
                                                      setState(() {
                                                        countsList[index]
                                                            [itemIndex]++;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ));
                              },
                            ));
                          }))
                ],
              ),
      ),
    );
  }
}
