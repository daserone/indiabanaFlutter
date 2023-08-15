import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/shared/constants/color_constants.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      height: 100,
      decoration: BoxDecoration(
        color: ColorConstants.indiabanaDarkBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //cart
          SizedBox(
            width: Get.width / 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                const SizedBox(
                  width: 100,
                  child: Text(
                    'Agregar al carrito',
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      //bold
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //buy
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.indiabanaOrange,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
