import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../constants.dart';
import '../providers/discount_offer_provider.dart';
import 'date_time_selector_components.dart';

class SingleValuePicker extends StatefulWidget {
  const SingleValuePicker(
      {Key? key,
      required this.initialValue,
      required this.maximumValue,
      required this.label})
      : super(key: key);
  final int initialValue;
  final int maximumValue;
  final String label;
  @override
  State<SingleValuePicker> createState() => _SingleValuePickerState();
}

class _SingleValuePickerState extends State<SingleValuePicker> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpToItem(widget.initialValue - 1);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(p4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(p4),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: p2),
              child: Text(
                widget.label,
                style: const TextStyle(color: cPrimary),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minHeight: selectOptionHeight * 2,
                      maxHeight: selectOptionHeight * datePreviewCount),
                  child: ListWheelScrollView(
                    itemExtent: selectOptionHeight,
                    controller: _controller,
                    scrollBehavior: const ScrollBehavior(),
                    physics: const FixedExtentScrollPhysics(
                      parent: CustomScrollPhysics(ClampingScrollPhysics()),
                    ),
                    diameterRatio: selectOptionHeight,
                    onSelectedItemChanged: (index) {
                      /// TODO to modify on another value
                      /// together with increment factor/unit
                      Provider.of<DiscountOfferProvider>(context, listen: false)
                          .setMaximumPersonsOffer(index + 1);
                    },
                    children: List.generate(
                      widget.maximumValue,
                      (i) => ItemMenu(
                        data: (i + 1).toString(),
                      ),
                    ),
                  ),
                ),
                const SelectedIndicatorLines(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
