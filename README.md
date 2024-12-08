![Showcase Overlay ]

# ShowcaseOverlay


A Flutter package to create interactive step-by-step guides and highlights for your widgets.

## Preview

![image](https://github.com/user-attachments/assets/62ccccc1-bdec-4bcd-8b50-e84b25c2e03b)


![The example app running in Android](https://your-image-url.com/preview/Showcaseoverlay.gif)

## Migration Guide for Release 2.0.0
Updated the structure for `ShowcaseOverlay` initialization.

Before:
```dart
ShowcaseOverlay(
  targets: targetsList,
  finish: () => onFinishFunction(),
);
```

After:
```dart
ShowcaseOverlay(
  targets: targetsList,
  parentHeight: context.heightDevice,
  parentWidth: context.widthDevice,
  finish: () async {
    await controller.disableFirstLoginValue();
  },
);
```

## Installing

<!-- 1.  Add dependency to `pubspec.yaml`

    *Get the latest version in the 'Installing' tab on [pub.dev](https://pub.dev/packages/Showcaseoverlay)*

```yaml
dependencies:
    Showcaseoverlay: <latest-version>
``` -->

2.  Import the package
```dart
import 'package:bub_showcase/showcase_overlay.dart';
```

3. Initialize and Show `ShowcaseOverlay`.
```dart
ShowcaseOverlay? _ShowcaseOverLay;

_ShowcaseOverLay = ShowcaseOverlay(
  targets: widget.targetsShowcase!,
  parentHeight: context.heightDevice,
  parentWidth: context.widthDevice,
  finish: () async {
    await _controller.disableFirstLoginValue();
  },
);

_ShowcaseOverLay?.show(context: context);
```

4. Define `TargetShowcaseExplain` for common styling.
```dart
TargetShowcaseExplain get baseTargetShowcaseExplain => TargetShowcaseExplain(
  width: 480,
  contentAlign: ContentAlign.right,
  leadTitle: "",
  title: "",
  titleStyle: context.titleSmall.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
  groundColor: Colors.blue,
  groundButtonColor: Colors.white,
  buttonStyle: context.titleSmall.copyWith(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
);
```

5. Specify `targetsShowcase`.
```dart
targetsShowcase: [
  TargetShowcaseFocus(
    keyTarget: GlobalKey(),
    keyCheck: RouteLocation.configuration,
    explain: baseTargetShowcaseExplain.copyWith(
      title: "Access Setting",
    ),
  ),
  TargetShowcaseFocus(
    keyTarget: GlobalKey(),
    keyCheck: RouteLocation.restaurantGroup,
    explain: baseTargetShowcaseExplain.copyWith(
      title: "Setup and Manage Area",
    ),
  ),
  TargetShowcaseFocus(
    keyTarget: GlobalKey(),
    keyCheck: RouteLocation.productGroup,
    explain: baseTargetShowcaseExplain.copyWith(
      title: "Access Product",
    ),
  ),
  TargetShowcaseFocus(
    keyTarget: GlobalKey(),
    keyCheck: RouteLocation.reportGroup,
    explain: baseTargetShowcaseExplain.copyWith(
      title: "Access Report",
    ),
  ),
  TargetShowcaseFocus(
    keyTarget: GlobalKey(),
    keyCheck: RouteLocation.dashboard,
    explain: baseTargetShowcaseExplain.copyWith(
      title: "Main Screen",
    ),
  ),
]
```

## How to use

Check out the **example** app in the [example](example) directory or the 'Example' tab on pub.dev for a more complete example.

## Functions of `ShowcaseOverlay`:

| Function Name                            | Description              |
|------------------------------------------|--------------------------|
| show(BuildContext context)               | Show the Showcase       |
| dismiss()                                | Dismisses the Showcase  |

## Properties of `ShowcaseOverlay`:

| Name                      | Type                       | Default Behaviour            | Description                                                                    |
|---------------------------|----------------------------|------------------------------|--------------------------------------------------------------------------------|
| targets                   | List<TargetShowcaseFocus> |                              | List of target widgets to be highlighted.                                      |
| parentHeight              | double                     |                              | Height of the parent widget.                                                   |
| parentWidth               | double                     |                              | Width of the parent widget.                                                    |
| finish                    | VoidCallback?              |                              | Triggered when all the Showcases are completed.                               |

## Properties of `TargetShowcaseFocus`:

| Name                         | Type             | Default Behaviour                                | Description                                                                                        |
|------------------------------|------------------|--------------------------------------------------|----------------------------------------------------------------------------------------------------|
| keyTarget                    | GlobalKey        |                                                  | Unique Global key for each target widget.                                                          |
| keyCheck                     | String           |                                                  | Identifier to check target.                                                                        |
| explain                      | TargetShowcaseExplain  |                                                  | Explanation and styling for the target widget.                                                     |
