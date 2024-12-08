import 'package:bub_showcase/ext/context_ext.dart';
import 'package:flutter/material.dart';

import 'build_button.dart';

class ExplainShowcaseWidget extends StatefulWidget {
  final GlobalKey? widgetKey;
  final String leadTitle;
  final String title;
  final Function() nextStep;
  final Color? color;
  final double? width;
  final double? height;

  final TextStyle? leadTitleStyle;
  final TextStyle? titleStyle;

  final Color? groundButtonColor;
  final TextStyle? buttonStyle;

  final int? currentStep;
  final int? totalStep;

  const ExplainShowcaseWidget({
    super.key,
    this.color,
    this.widgetKey,
    this.width,
    this.height,
    this.leadTitleStyle,
    this.titleStyle,
    this.groundButtonColor,
    this.buttonStyle,
    this.currentStep,
    this.totalStep,
    required this.leadTitle,
    required this.title,
    required this.nextStep,
  });

  @override
  State<ExplainShowcaseWidget> createState() => _ExplainShowcaseWidgetState();
}

class _ExplainShowcaseWidgetState extends State<ExplainShowcaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.widgetKey,
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.color ?? Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.leadTitle.isNotEmpty) ...[
            Text(
              widget.leadTitle,
              style: widget.leadTitleStyle ??
                  context.titleLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
          ],
          Text(widget.title, style: widget.titleStyle ?? context.titleMedium),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.width != null)
                Expanded(child: _buildStep())
              else
                _buildStep(),
              BuildButton(
                  onTap: widget.nextStep,
                  color: widget.groundButtonColor ?? Colors.lightBlue,
                  child: Text(
                    (widget.currentStep != null &&
                            widget.totalStep != null &&
                            widget.currentStep! < widget.totalStep!)
                        ? "Next"
                        : "Understand",
                    style: widget.buttonStyle ??
                        const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep() {
    if (widget.currentStep != null && widget.totalStep != null) {
      return Text(
        'Step ${widget.currentStep!.toString()} / ${widget.totalStep!.toString()}',
        style: widget.titleStyle ??
            const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
      );
    }
    return const SizedBox.shrink();
  }
}
