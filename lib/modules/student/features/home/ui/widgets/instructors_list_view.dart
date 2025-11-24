import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/modules/student/features/home/data/model/instructor_item_model.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/instructors_list_view_item.dart';

class InstructorsListView extends StatelessWidget {
  const InstructorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: instructors.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InstructorsListViewItem(
            isSelected: false,
            onTap: () {},
            instructor: instructors[index],
          );
        },
      ),
    );
  }
}

final List<InstructorItemModel> instructors = [
  InstructorItemModel(
    id: 1,
    name: "Mustafa",
    image: "https://randomuser.me/api/portraits/men/1.jpg",
  ),
  InstructorItemModel(
    id: 2,
    name: "Ali",
    image: "https://randomuser.me/api/portraits/men/2.jpg",
  ),
  InstructorItemModel(
    id: 1,
    name: "Mustafa",
    image: "https://randomuser.me/api/portraits/men/1.jpg",
  ),
  InstructorItemModel(
    id: 2,
    name: "Ali",
    image: "https://randomuser.me/api/portraits/men/2.jpg",
  ),
  InstructorItemModel(
    id: 1,
    name: "Mustafa",
    image: "https://randomuser.me/api/portraits/men/1.jpg",
  ),
  InstructorItemModel(
    id: 2,
    name: "Ali",
    image: "https://randomuser.me/api/portraits/men/2.jpg",
  ),
];
