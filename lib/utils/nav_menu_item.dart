import 'package:flutter/material.dart';

import '../colors.dart';
import '../constants.dart';

class NavMenuItem extends StatelessWidget {
  const NavMenuItem({
    Key? key,
    required this.action,
    required this.label,
    this.active = false,
    this.isCenter = false,
    required this.icon,
    this.iconSize,
  }) : super(key: key);
  final VoidCallback action;
  final String label;
  final IconData icon;
  final bool active;
  final bool isCenter;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: key,
      child: Material(
        child: InkWell(
          onTap: action,
          highlightColor: isCenter
              ? cTransparent
              : Theme.of(context).primaryColor.withOpacity(0.1),
          splashColor: isCenter
              ? cTransparent
              : Theme.of(context).primaryColor.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(p1),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 32,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCenter ? Theme.of(context).primaryColor : null,
                  ),
                  padding: EdgeInsets.all(isCenter ? p2 : 0),
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    size: isCenter ? 28 : iconSize ?? 24,
                    color: isCenter
                        ? Colors.white
                        : active
                            ? Theme.of(context).primaryColor
                            : cGrey4,
                  ),
                ),
                SizedBox(height: isCenter ? 0 : 2),
                isCenter
                    ? const SizedBox()
                    : Text(
                        label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight:
                              active ? FontWeight.w500 : FontWeight.w400,
                          color:
                              active ? Theme.of(context).primaryColor : cGrey4,
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
