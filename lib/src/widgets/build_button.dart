import 'package:bub_showcase/ext/context_ext.dart';
import 'package:flutter/material.dart';

mixin PopUpMixin<T extends StatefulWidget> on State<T> {}

class BuildButton extends StatefulWidget {
  final Function() onTap;
  final Widget child;
  final Color? color;
  final BoxBorder? border;
  final bool loading;

  const BuildButton(
      {Key? key,
      this.color,
      required this.onTap,
      required this.child,
      this.border,
      this.loading = false})
      : super(key: key);

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  final ValueNotifier<bool> _isHovered = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _isHovered.value = true,
      onExit: (_) => _isHovered.value = false,
      child: ValueListenableBuilder(
          valueListenable: _isHovered,
          builder: (context, value, child) {
            return InkWell(
                onTap: widget.onTap,
                mouseCursor: MouseCursor.defer,
                borderRadius:
                    BorderRadius.circular(8.0), // Match container border radius
                child: AnimatedContainer(
                  duration:
                      const Duration(milliseconds: 200), // Animation duration
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: widget.color
                            ?.withOpacity(_isHovered.value ? 0.75 : 1) ??
                        Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: _isHovered.value ? widget.border : null,
                    boxShadow: _isHovered.value
                        ? [
                            const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6.0,
                                offset: Offset(0, 2))
                          ]
                        : [],
                  ),
                  child: widget.loading
                      ? const Center(
                          child: SizedBox(
                            width: (50) * 0.6,
                            height: (50) * 0.6,
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          ),
                        )
                      : widget.child,
                ));
          }),
    );
  }
}

class BuildPopUpWidget<T> extends StatefulWidget {
  final String title;
  final List<T> items;

  final IconData? leadingIcon;
  final Widget Function(T) itemBuilder;

  const BuildPopUpWidget({
    super.key,
    this.leadingIcon,
    required this.title,
    required this.items,
    required this.itemBuilder,
  });

  @override
  State<BuildPopUpWidget<T>> createState() => _BuildPopUpWidgetState<T>();
}

class _BuildPopUpWidgetState<T> extends State<BuildPopUpWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
      ),
      builder: (context, controller, anchor) => BuildButton(
        onTap: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        child: Row(
          children: [
            if (widget.leadingIcon != null) ...[
              Icon(widget.leadingIcon, color: Colors.white, size: 14.0),
              const SizedBox(width: 4.0),
            ],
            Text(
              widget.title,
              style: context.titleSmall.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 4.0),
            const Icon(Icons.arrow_drop_down, color: Colors.white, size: 14.0),
          ],
        ),
      ),
      menuChildren: [
        ...widget.items.map((e) => widget.itemBuilder(e)),
      ],
    );
  }
}
