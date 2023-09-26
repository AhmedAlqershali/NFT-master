import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';

class ContainerActivityWidget extends StatelessWidget {
  String img;
  String name;
  String num;

  ContainerActivityWidget({
    super.key,
    required this.img,
    required this.name,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : AppColors.black,
      elevation: 10,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset(
              img,
              height: 44.h,
              width: 44.w,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name),
                Row(
                  children: [
                    Image.asset('assets/images/coin.png',width: 16.w,height: 16.h,),
                    SizedBox(
                      width: 10,
                    ),
                    Text("475.98 BNB"),
                  ],
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "21 h ago  / ",
                      style: GoogleFonts.roboto(),
                    ),
                    Text(
                      "Floor bid",
                      style: GoogleFonts.roboto(color: AppColors.purple),
                    ),
                  ],
                ),
                Text(
                  "≈ \$140.05",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
