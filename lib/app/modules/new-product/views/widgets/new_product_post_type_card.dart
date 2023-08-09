import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/data/models/pub_type.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/shared/constants/constants.dart';

class NewProductPostCardType extends StatelessWidget {
  final int index;
  const NewProductPostCardType({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    NewProductPubTypes item = controller.pubTypeList[index];
    return Obx(
      () => InkWell(
        onTap: () {
          controller.selectedPubType = index;
        },
        child: SizedBox(
          height: 370,
          width: 300,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: controller.selectedPubType == index
                      ? ColorConstants.indiabanaOrange
                      : Colors.transparent,
                  width: 2,
                )),
            shadowColor: Colors.red,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  item.type ?? '',
                  height: 80,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.indiabanaDarkBlue,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  width: Get.width,
                  child: Column(
                    children: [
                      //duration
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Duración: ${item.duration ?? ''}",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //exposure
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.exposure ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //sales
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 210,
                              child: Text(
                                item.sales ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //stock
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.inventory,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.stock ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //commissions
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.monetization_on,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.commissions ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
