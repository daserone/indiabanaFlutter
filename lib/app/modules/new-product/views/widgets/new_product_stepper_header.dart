import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/new_product_stepper_item.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class NewProductStepperHeader extends StatelessWidget {
  const NewProductStepperHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.lightScaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 50,
      child: ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.steps.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            controller.changeStep(index);
            controller.scrollController
                .scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
          },
          child: Obx(() => AutoScrollTag(
                key: ValueKey(index),
                controller: controller.scrollController,
                index: index,
                highlightColor: Colors.black.withOpacity(0.1),
                child: NewProductStepperItem(
                  isDone: controller.currentStep > index,
                  index: index,
                  title: controller.steps[index],
                ),
              )),
        ),
      ),
    );
  }
}
