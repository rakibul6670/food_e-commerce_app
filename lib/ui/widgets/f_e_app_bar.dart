import 'package:flutter/material.dart';

class FEAppBar extends StatelessWidget implements PreferredSizeWidget {
  //------ AppBar e Widget nibe na ejonno w class ke
  //------PreferceSized Widget implement korchi---------
  final String title;
  final double? spaceWidth;

  const FEAppBar({super.key, required this.title, this.spaceWidth});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: theme.primaryColor,

      //------------- title --------------
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              height: 32,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 15),
                  Text(
                    "back",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: spaceWidth ?? 14),

          //------------ title-------------
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  //------ AppBar e Widget nibe na ejonno w class ke
  //------PreferceSized Widget implement korchi---------

  //---------- er jonno eta required override korte hobe ..
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
