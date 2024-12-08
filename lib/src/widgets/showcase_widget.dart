import 'package:bub_showcase/src/paint/explain_showcase_paint.dart';
import 'package:bub_showcase/src/paint/shadow_paint.dart';
import 'package:bub_showcase/src/showcase/showcase_explain.dart';
import 'package:bub_showcase/src/showcase/showcase_focus.dart';
import 'package:bub_showcase/src/showcase_controller.dart';
import 'package:bub_showcase/src/widgets/explain_showcase_widget.dart';
import 'package:flutter/material.dart';

/// Widget to show guide line
/// [targets] list of [TargetShowcaseFocus]
/// [parentWidth] width of parent widget
/// [parentHeight] height of parent widget
/// [onSkip] callback when skip button clicked
/// [onPrevious] callback when previous button clicked
///   if [onPrevious] is null, previous button will not be shown
/// [onFinished] callback when finished button clicked
class ShowcaseWidget extends StatefulWidget {
  final List<TargetShowcaseFocus> targets;
  final double parentWidth;
  final double parentHeight;

  final Function()? onSkip;
  final Function()? onPrevious;
  final Function()? onFinished;
  final Function()? onShow;

  const ShowcaseWidget({
    super.key,
    this.onSkip,
    this.onPrevious,
    this.onFinished,
    this.onShow,
    required this.targets,
    required this.parentHeight,
    required this.parentWidth,
  }) :

        /// assert that targets must not be empty
        assert(targets.length > 0, 'targets must not be empty');

  @override
  State<ShowcaseWidget> createState() => _ShowcaseWidgetState();
}

class _ShowcaseWidgetState extends State<ShowcaseWidget>
    implements GuideLineController {
  /// current focus
  /// default is first target
  TargetShowcaseFocus? currentFocus;
  Widget? buildContentWidget;
  GlobalKey? _explainKey;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentFocus = widget.targets.first;
      final renderBox = currentFocus?.keyTarget?.currentContext
          ?.findRenderObject() as RenderBox?;
      final offset = renderBox?.localToGlobal(Offset.zero);
      final size = renderBox?.size;
      buildContentWidget = _buildContentWidget(currentFocus?.explain,
          focusOffset: offset, focusSize: size);
    });
  }

  @override
  Widget build(BuildContext context) {
    final renderBox = currentFocus?.keyTarget?.currentContext
        ?.findRenderObject() as RenderBox?;
    final offset = renderBox?.localToGlobal(Offset.zero);
    final size = renderBox?.size;
    return Stack(
      children: [
        if (offset != null && size != null) ...[
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: ShadowPainter(offset: offset, size: size),
          ),
        ],
        buildContentWidget ?? const SizedBox.shrink(),
      ],
    );
  }

  /// build content widget
  /// [guideLineExplain] [TargetShowcaseExplain]
  /// default is [Offset.zero]
  /// default is [Size.zero]
  /// return [Widget]
  Widget _buildContentWidget(TargetShowcaseExplain? guideLineExplain,
      {Offset? focusOffset, Size? focusSize}) {
    if (guideLineExplain == null) return const SizedBox.shrink();
    final groundColor = guideLineExplain.groundColor ?? Colors.white;
    final leadTitleStyle = guideLineExplain.leadTitleStyle;
    final titleStyle = guideLineExplain.titleStyle;
    final groundButtonColor = guideLineExplain.groundButtonColor;
    final buttonStyle = guideLineExplain.buttonStyle;

    _explainKey = GlobalKey();

    final explainWidth = guideLineExplain.width ?? 0;
    final explainHeight = guideLineExplain.height ?? 0;

    final explainWidget = ExplainShowcaseWidget(
      leadTitle: guideLineExplain.leadTitle,
      title: guideLineExplain.title,
      width: explainWidth,
      color: groundColor,
      nextStep: onSkip,
      leadTitleStyle: leadTitleStyle,
      titleStyle: titleStyle,
      groundButtonColor: groundButtonColor,
      buttonStyle: buttonStyle,
      totalStep: widget.targets.length,
      currentStep: widget.targets.indexOf(currentFocus!) + 1,
    );

    final navigateWidget = CustomPaint(
      size: const Size(16, 16),
      painter: switch (guideLineExplain.contentAlign) {
        ContentAlign.top => DownwardTrianglePainter(color: groundColor),
        ContentAlign.bottom => UpwardTrianglePainter(color: groundColor),
        ContentAlign.left => RightTrianglePainter(color: groundColor),
        ContentAlign.right => LeftTrianglePainter(color: groundColor),
      },
    );
    const sizedBox = SizedBox(width: 4.0, height: 4.0);
    List<Widget> listWidget = [
      sizedBox,
      Padding(
        padding: (guideLineExplain.contentAlign == ContentAlign.right ||
                guideLineExplain.contentAlign == ContentAlign.left)
            ? const EdgeInsets.only(top: 12)
            : const EdgeInsets.only(left: 12.0),
        child: navigateWidget,
      ),
      explainWidget
    ];
    if (guideLineExplain.contentAlign == ContentAlign.left ||
        guideLineExplain.contentAlign == ContentAlign.top) {
      listWidget = listWidget.reversed.toList();
    }
    final explainNavigateView =
        (guideLineExplain.contentAlign == ContentAlign.right ||
                guideLineExplain.contentAlign == ContentAlign.left)
            ? Row(
                key: _explainKey,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listWidget)
            : Column(
                key: _explainKey,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listWidget,
              );

    // final explainRenderBox =
    //     _explainKey?.currentContext?.findRenderObject() as RenderBox?;
    // // final explainSize = explainRenderBox?.size;

    final positionX = focusOffset?.dx ?? 0;
    final positionY = focusOffset?.dy ?? 0;

    final focusWidth = focusSize?.width ?? 0;
    final focusHeight = focusSize?.height ?? 0;

    var explainPositionX = 0.0;
    var explainPositionY = 0.0;

    switch (guideLineExplain.contentAlign) {
      case ContentAlign.top:
        explainPositionX = positionX;
        explainPositionY = positionY - explainHeight;
        break;
      case ContentAlign.bottom:
        explainPositionX = positionX;
        explainPositionY = positionY + focusHeight;
        break;
      case ContentAlign.left:
        explainPositionX = positionX - explainWidth;
        explainPositionY = positionY;
        break;
      case ContentAlign.right:
        explainPositionX = positionX + focusWidth;
        explainPositionY = positionY;
        break;
    }

    if (guideLineExplain.contentAlign == ContentAlign.top) {
      return Padding(
        padding: EdgeInsets.only(left: explainPositionX),
        child: SizedBox(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              explainNavigateView,
              SizedBox(height: widget.parentHeight - positionY)
            ],
          ),
        ),
      );
    }

    if (guideLineExplain.contentAlign == ContentAlign.left) {
      return Padding(
        padding: EdgeInsets.only(top: explainPositionY),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              explainNavigateView,
              SizedBox(width: widget.parentWidth - positionX)
            ],
          ),
        ),
      );
    }

    return Positioned(
        top: explainPositionY,
        left: explainPositionX,
        child: explainNavigateView);
  }

  @override
  void onFinished() => widget.onFinished?.call();

  @override
  void onPrevious() {
    final currentIndex = widget.targets.indexOf(currentFocus!);
    if (currentIndex > 0) {
      setState(() {
        currentFocus = widget.targets[currentIndex - 1];
        final renderBox = currentFocus?.keyTarget?.currentContext
            ?.findRenderObject() as RenderBox?;
        final offset = renderBox?.localToGlobal(Offset.zero);
        final size = renderBox?.size;
        buildContentWidget = _buildContentWidget(currentFocus?.explain,
            focusOffset: offset, focusSize: size);
      });
    }
  }

  @override
  void onShow() {
    // TODO: implement onShow
  }

  @override
  void onSkip() {
    final currentIndex = widget.targets.indexOf(currentFocus!);
    if (currentIndex < widget.targets.length - 1) {
      setState(() {
        currentFocus = widget.targets[currentIndex + 1];
        final renderBox = currentFocus?.keyTarget?.currentContext
            ?.findRenderObject() as RenderBox?;
        final offset = renderBox?.localToGlobal(Offset.zero);
        final size = renderBox?.size;
        buildContentWidget = _buildContentWidget(currentFocus?.explain,
            focusOffset: offset, focusSize: size);
      });
    } else {
      onFinished();
    }
  }
}
