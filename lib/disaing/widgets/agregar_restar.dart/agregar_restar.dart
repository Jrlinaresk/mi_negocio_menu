import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
  final int initialQuantity;
  final Function(int) onQuantityChanged;

  const AddToCartButton(
      {super.key,
      required this.initialQuantity,
      required this.onQuantityChanged});

  @override
  AddToCartButtonState createState() => AddToCartButtonState();
}

class AddToCartButtonState extends State<AddToCartButton> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Cantidad",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
          ),
          Card(
            elevation: 0,
            color: Colors.white,
            child: SizedBox(
              height: 42.0,
              child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 4,
                color: Colors.white,
                child: Row(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(0),
                      elevation: 0,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                  widget.onQuantityChanged(quantity);
                                });
                              }
                            },
                            child: quantity > 1
                                ? Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        const VerticalDivider(
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Icon(
                                            Icons.remove,
                                            color: quantity > 1
                                                ? Colors.black
                                                : Colors.grey,
                                            size: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                          ),
                          /* quantity > 1 ? const VerticalDivider() : Container(), */
                          Padding(
                            padding: quantity > 1
                                ? const EdgeInsets.symmetric(horizontal: 8.0)
                                : const EdgeInsets.only(left: 16, right: 8.0),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity++;
                          widget.onQuantityChanged(quantity);
                        });
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.orange,
                        child: Row(
                          children: [
                            const VerticalDivider(
                              width: 0,
                              color: Colors.transparent,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 38.0,
          )
        ],
      ),
    );
  }
}
