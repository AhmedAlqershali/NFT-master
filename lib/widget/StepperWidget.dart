import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/constants/app.colors.dart';
import 'package:progress_stepper/progress_stepper.dart';



class StepperWidget extends StatefulWidget {
int num;
   StepperWidget({Key? key,required this.num}) : super(key: key);

  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  String selectedOption = 'Option 1';



  // void _incrementCustomStepper() {
  //   setState(() {
  //     if (_customCounter < 3) {
  //       _customCounter++;
  //
  //     }
  //   });
  // }
  //
  // void _decrementCustomStepper() {
  //   setState(() {
  //     if (_customCounter > 1) {
  //       _customCounter--;
  //     }
  //   });
  // }
  List<String> words = ['',
    'Customers Information',
    'Delivery Information',
    'Delivery Information'];


  // واجهة مستخدم مخصصة لعنصر الاختيار
  Widget customRadioTile(String value, String groupValue, Function(String) onChanged) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {
              onChanged(value!);
            },
            activeColor: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : AppColors.black,
            focusColor: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : AppColors.black,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(

    body: ProgressStepper(
      width: 400.w,
      height: 56.h,
      stepCount: 3,

      builder: (int index) {
        if (index == widget.num) {
          return ProgressStepWithArrow(
            width: 270.w,

            defaultColor: Colors.red,
            progressColor: Color(0xFFEBEDF2),
            wasCompleted: true,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(words[widget.num],style: GoogleFonts.roboto(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade100
                        : AppColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp
                  ),),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: customRadioTile(
                    'Option 1',
                    selectedOption,
                        (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          // الخطوات غير النشطة
          return ProgressStepWithChevron(
            width: 50.w,
            defaultColor: Colors.red,
            progressColor: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : AppColors.black,
            wasCompleted: true,
            child: customRadioTile(
              'Option 2',
              selectedOption,
                  (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
          );
        }
      },
    ),
  );
}
