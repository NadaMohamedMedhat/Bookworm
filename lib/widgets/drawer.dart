// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:graduation_project/components/reusable_components.dart';

// class MyDrawer extends StatelessWidget {
//   //const MyDrawer({Key? key, child}) : super(key: key);
//   //final zoomDrawerController = ZoomDrawerController() ;
//   //MyDrawer(this.zoomDrawerController);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//             // IconButton(onPressed: () {
//             //   zoomDrawerController.toggle!();
//             // }, icon: Icon(Icons.menu)),
//             // );
//             Drawer(
//                 child: Container(
//       color: thirdColor,
//       child: Column(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [secondColor, secondColor, thirdColor],
//                   begin: AlignmentDirectional.topCenter,
//                   end: AlignmentDirectional.bottomCenter),
//             ),
//             height: 150,
//             width: double.infinity,
//             padding: const EdgeInsets.all(15),
//             //alignment: Alignment.centerLeft,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               //mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 const SizedBox(
//                   height: 5.0,
//                 ),
//                 Row(
//                   children: const [
//                     CircleAvatar(
//                       radius: 30.0,
//                       child: ClipOval(
//                         child: Image(
//                           image: NetworkImage(
//                               'https://image.freepik.com/free-photo/portrait-focused-young-sportsman-adjusting-his-wristwatch_171337-7777.jpg'),
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Icon(Icons.dark_mode)
//                   ],
//                 ),
//                 Text('Mohamed',
//                     textAlign: TextAlign.start,
//                     style: Theme.of(context).textTheme.subtitle1),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           InkWell(
//             onTap: () {},
//             child: ListTile(
//               leading: const Icon(Icons.book_online),
//               title: Text(
//                 'Books',
//                 style: Theme.of(context).textTheme.subtitle2,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           InkWell(
//             onTap: () {},
//             child: ListTile(
//               leading: const Icon(Icons.person_add_sharp),
//               title: Text(
//                 'Invite Friends',
//                 style: Theme.of(context).textTheme.subtitle2,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           InkWell(
//             onTap: () {},
//             child: ListTile(
//               leading: const Icon(Icons.settings),
//               title: Text(
//                 'Settings',
//                 style: Theme.of(context).textTheme.subtitle2,
//               ),
//             ),
//           ),
//         ],
//       ),
//     )));
//   }
// }

import 'package:flutter/material.dart';
import 'reusable_components.dart';



class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  //const MyDrawer({ Key  }) : super(key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int selectedIndex = -1; //dont set it to 0

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      // ignore: sized_box_for_whitespace
      child: Container(
        width: width,
        child: row(),
        //color: Color(0xffe3e9f7),
      ),
    );
  }

  Widget row() {
    return Row(children: [
      isExpanded ? blackIconTiles() : blackIconMenu(),
      invisibleSubMenus(),
    ]);
  }

  Widget blackIconTiles() {
    return Container(
      width: 200,
      color: thirdColor,
      child: Column(
        children: [
          controlTile(),
          Expanded(
            child: ListView.builder(
              itemCount: cdms.length,
              itemBuilder: (BuildContext context, int index) {
                //  if(index==0) return controlTile();

                CDM cdm = cdms[index];
                bool selected = selectedIndex == index;
                return ExpansionTile(
                    onExpansionChanged: (z) {
                      setState(() {
                        selectedIndex = z ? index : -1;
                      });
                    },
                    leading: Icon(cdm.icon, color: Colors.white),
                    title: TextForm(
                      text: cdm.title,
                      color: Colors.white,
                    ),
                    trailing: cdm.submenus.isEmpty
                        ? null
                        : Icon(
                            selected
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                    children: cdm.submenus.map((subMenu) {
                      return sMenuButton(subMenu, false);
                    }).toList());
              },
            ),
          ),
          //accountTile(),
        ],
      ),
    );
  }

  Widget controlTile() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30.0,
          child: ClipOval(
            child: Image(
              image: AssetImage('assets/images/person.webp'),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const TextForm(
          text: "Mohamed",
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        onTap: expandOrShrinkDrawer,
      ),
    );
  }

  Widget blackIconMenu() {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: 100,
      color: thirdColor,
      child: Column(
        children: [
          controlButton(),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (contex, index) {
                  // if(index==0) return controlButton();
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Icon(cdms[index].icon, color: Colors.white),
                    ),
                  );
                }),
          ),
          //accountButton(),
        ],
      ),
    );
  }

  Widget invisibleSubMenus() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: isExpanded ? 0 : 125,
      //color: Color(0xffe3e9f7),
      child: Column(
        children: [
          Container(height: 95),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (context, index) {
                  CDM cmd = cdms[index];

                  bool selected = selectedIndex == index;
                  bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;
                  return subMenuWidget(
                      [cmd.title]..addAll(cmd.submenus), isValidSubMenu);
                }),
          ),
        ],
      ),
    );
  }

  Widget controlButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: const Icon(
            Icons.menu,
            size: 60,
            color: fourthColor,
          ),
        ),
      ),
    );
  }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu ? thirdColor : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          padding: const EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index];
            return sMenuButton(subMenu, index == 0);
          }),
    );
  }

  Widget sMenuButton(String subMenu, bool isTitle) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextForm(
          text: subMenu,
          fontSize: isTitle ? 17 : 14,
          color: isTitle ? Colors.white : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget accountButton({bool usePadding = true}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white70,
          image: const DecorationImage(
            image: NetworkImage(
                'https://image.freepik.com/free-vector/ancient-architecture-with-arches-torches_107791-9774.jpg?w=1380'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget accountTile() {
    return Container(
      color: thirdColor,
      child: ListTile(
        leading: accountButton(usePadding: false),
        title: const TextForm(
          text: "Prem Shanhi",
          color: Colors.white,
        ),
        subtitle: const TextForm(
          text: "Web Designer",
          color: Colors.white70,
        ),
      ),
    );
  }

  static List<CDM> cdms = [
    CDM(Icons.home, "Home", []),
    CDM(Icons.subscriptions, "Category",
        ["crime", "Psychology", "fantasy", "Poetry "]),
    CDM(Icons.person, "Authors",
        ["ahmed tawfik", "Naguib Mahfouz", "Agatha Christie"]),
    CDM(Icons.settings, "Setting", []),
    CDM(Icons.logout, "Logout", []),
  ];

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}

class CDM {
  final IconData icon;
  final String title;
  final List<String> submenus;

  CDM(this.icon, this.title, this.submenus);
}

class Clone {
  final Widget page;
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;

  Clone(this.page, this.color, this.icon, this.title, this.subtitle);
}

class TextForm extends StatefulWidget {
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final int? maxlines;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final bool useoverflow;
  final bool upperCaseFirst;
  final bool useQuotes;
  final bool useFiler;
  final bool underlined;
  final bool fullUpperCase;
  final bool fullLowerCase;
  final dynamic text;
  final String? fontFamily;

  // ignore: use_key_in_widget_constructors
  const TextForm({
    this.fontStyle,
    this.fontWeight,
    this.maxlines,
    this.fontSize,
    this.color,
    this.textAlign,
    this.useoverflow = false,
    this.upperCaseFirst = false,
    this.useQuotes = false,
    this.useFiler = false,
    this.underlined = false,
    this.fullUpperCase = false,
    this.fullLowerCase = false,
    @required this.text,
    this.fontFamily,
  }) : super();

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  String finalText = "Null";

  @override
  Widget build(BuildContext context) {
    bool isString = widget.text is String;
    bool isNumber = widget.text is double || widget.text is int;
    bool isOthers = isString == false && isNumber == false;

    if (isString) {
      finalText = widget.text ?? "Error";
    }
    if (isNumber) finalText = '${widget.text}';
    if (isOthers) finalText = "Invalid input ${widget.text}";

    if (widget.fullLowerCase) finalText = finalText.toLowerCase();

    if (widget.fullUpperCase) finalText = finalText.toUpperCase();

    if (widget.upperCaseFirst && finalText.length > 1) {
      finalText =
          "${finalText[0].toUpperCase()}${finalText.substring(1, finalText.length).toLowerCase()}";
    }

    if (widget.useQuotes) finalText = "❝$finalText❞";

    if (widget.useFiler) {
      finalText = finalText
          .replaceAll("*", "")
          .replaceAll("_", "")
          .replaceAll("-", "")
          .replaceAll("#", "")
          .replaceAll("\n", "")
          .replaceAll("!", "")
          .replaceAll('[', '')
          .replaceAll(']', '');
    }

    return Text((finalText).toString(),
        overflow: widget.useoverflow ? TextOverflow.ellipsis : null,
        textAlign: widget.textAlign,
        maxLines: widget.maxlines,
        textScaleFactor: 1,
        style: TextStyle(
          decoration: widget.underlined ? TextDecoration.underline : null,
          color: widget.color,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          fontStyle: widget.fontStyle,
          fontFamily: widget.fontFamily,
        ));
  }
}
