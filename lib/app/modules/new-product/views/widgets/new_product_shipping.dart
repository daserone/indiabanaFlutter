import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indiabana_app/app/modules/new-product/controllers/new_product_controller.dart';
import 'package:indiabana_app/app/modules/new-product/views/widgets/form_nav_buttons.dart';

class NewProductShipping extends StatelessWidget {
  const NewProductShipping({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewProductController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Métodos de envió',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: controller.shippingMethods.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(controller.shippingMethods[index].method!),
                    value: controller.shippingMethods[index].checked,
                    onChanged: (bool? value) {
                      controller.changeCheckShippingMethods(index, value!);
                    },
                  );
                }),
          ),

          const Text(
            'Gastos de envió',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          //radio condition list tile
          ListTile(
            title: const Text('Por cuenta del vendedor(tu pagas)'),
            leading: Radio<int>(
              value: 0,
              groupValue: controller.shippingExpenses,
              onChanged: (value) {
                controller.shippingExpenses = value!;
              },
            ),
          ),
          ListTile(
            title: const Text('Por cuenta del comprador(el comprador paga)'),
            leading: Radio<int>(
              value: 1,
              groupValue: controller.shippingExpenses,
              onChanged: (value) {
                controller.shippingExpenses = value!;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (controller.shippingExpenses == 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //shipping company
                Expanded(
                  child: TextFormField(
                    controller: controller.shippingCompanyProductController,
                    decoration: const InputDecoration(
                      labelText: 'Empresa de envió',
                      hintText: 'Empresa de envió',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //shipping price
                Expanded(
                  child: TextFormField(
                    controller: controller.shippingPriceProductController,
                    decoration: const InputDecoration(
                      labelText: 'Precio de envió',
                      hintText: 'Precio de envió',
                    ),
                  ),
                ),
                IconButton(
                    onPressed: controller.addToShippingList,
                    icon: const Icon(Icons.add)),
              ],
            ),
          if (controller.shippingList.isNotEmpty)
            Container(
              height: 200,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: ListView.builder(
                itemCount: controller.shippingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(controller.shippingList[index].company!),
                    subtitle: Text(controller.shippingList[index].price!),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deleteFromShippingList(index);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(
            height: 20,
          ),
          // back and next buttons
          const FormNavButtons()
        ],
      ),
    );
  }
}
