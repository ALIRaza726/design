import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:meditate/screen/e_mail.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  bool department = false;
  final departmentController = TextEditingController();

  Future popupDialog() {
    return showDialog(
      barrierColor: Colors.black54,
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        );
      },
    );
  }

  String? select = '';
  bool isChecked = false;
  String selectedOption = "Radio Button 1";
  String selectedRadioOption = "Radio Button 1";
  final List<String> items =
      List<String>.generate(6, (index) => "Item ${index + 1}");
  Map<String, String?> selectedItems = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 136, 210, 225),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 53, 165, 179),
            title: const Text('ListView'),
            actions: [
              IconButton(
                  onPressed: () {
                    popupDialog();
                  },
                  icon: const Icon(Icons.add))
            ]),
        body: SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.star_border_purple500),
                    title: Text(
                      items[index],
                      style:
                          TextStyle(color: Color.fromARGB(255, 44, 142, 155)),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Item ${index + 2}',
                        ),
                        Text('Phone Num ${index + 3}'),
                      ],
                    ),
                    trailing: DropdownButton<String>(
                      underline: Container(
                        height: 2,
                        color: Colors.cyan,
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 53, 165, 179)),
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 10,
                      value: selectedItems[
                          items[index]], // Use index to refer to a single item
                      items: <String>['Item1', 'Item2', 'Item3', 'Item4']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedItems[items[index]] =
                              newValue; // Update using index
                        });
                      },
                    ),
                    // title: Text('Item $index'),
                    // onTap: () {
                    //   print('Item $index tapped');
                    // },
                  ),
                );
              },
            ),
            ListTile(
              leading: Radio(
                  value: "1",
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  }),
              title: Text('Radio Button 1'),
            ),
            ListTile(
              leading: Radio(
                  value: "2",
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  }),
              title: Text('Radio Button 2'),
            ),
            ListTile(
              leading: Radio(
                value: "3",
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              title: Text('Selected Radio Option'),
            ),
            ListTile(
              leading: Radio(
                value: "4",
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              title: Text('Selected Radio Option'),
            ),
            //Hide Unhide Widg

            InkWell(
              onTap: () {
                setState(() {
                  department = !department;
                  print('department : $department');
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: department,
                      activeColor: Colors.amber,
                      onChanged: (bool? newValue) {
                        setState(() {
                          department = newValue!;
                          print('department : $department');
                        });
                      },
                    ),
                    const Expanded(child: Text('Department')),
                  ],
                ),
              ),
            ),
            if (department == true)
              Padding(
                padding: const EdgeInsets.all(18),
                child: TextFormField(
                  controller: departmentController,
                  readOnly: department ? false : true,
                  onTap: () {},
                  decoration: InputDecoration(
                      hintText: ('None Selected'),
                      labelText: ('Select Department'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      )
                      // suffixIcon: Icon(
                      //   Icons.search,
                      //   color: buttonColor,
                      // ),
                      ),
                ),
              ),

            //checkBox Code ===>>>>
            Checkbox(
                fillColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 146, 236, 149)),
                checkColor: Color.fromARGB(255, 222, 29, 29),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
            Text(isChecked ? 'Checked' : 'NotChecked'),

            // Menu PopUp Code ===>>>>
            PopupMenuButton(
              onSelected: (String result) {
                setState(() {
                  select = result;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You Have Selected: $result'),
                  ),
                );
              },
              // icon: const Icon(Icons.menu_outlined,
              //     color: Color.fromRGBO(63, 33, 255, 1)),
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: '1st Menu',
                  child: Text('Menu num 1'),
                ),
                const PopupMenuItem(
                  value: '2nd Menu',
                  child: Text('Menu num 2'),
                ),
                const PopupMenuItem(
                  value: '3rd Menu',
                  child: Text('Menu num 3'),
                ),
              ],
            ),
            Text(
              'You Have Selected MenuButton : $select',
              style: const TextStyle(
                  color: Color.fromARGB(255, 246, 73, 73), fontSize: 10),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogBackgroundColor: Color.fromARGB(255, 173, 215, 233),
                  barrierColor: Color.fromARGB(255, 149, 238, 250),
                  dialogType: DialogType.info,
                  headerAnimationLoop: true,
                  animType: AnimType.bottomSlide,
                  title: 'INFO Reversed',
                  reverseBtnOrder: true,
                  btnOkOnPress: () {},
                  btnCancelOnPress: () {},
                  desc: ' Add TextFormField + Any Widjet,',
                ).show();
              },
              child: const Text(
                'PopUp (With Package)',
                style: TextStyle(
                    color: Color.fromARGB(255, 14, 14, 14), fontSize: 14),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => e_mail()));
                },
                icon: Icon(Icons.mail))
          ]),
        ),
      ),
    );
  }
}
