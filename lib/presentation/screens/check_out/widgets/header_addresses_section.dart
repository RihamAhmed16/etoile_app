import 'package:flutter/material.dart';

import '../../../../constance/colors.dart';
import '../../../../constance/strings.dart';

class HeaderAddressesSection extends StatelessWidget {
  const HeaderAddressesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Addresses',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.address,
            );
          },
          style: ButtonStyle(
            overlayColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
              return Colors
                  .transparent; // Set the overlay color to be transparent
            }),
          ),
          child: Text(
            'New Address',
            style: TextStyle(
                color: AppColors.buttonColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
