# ToggleableSecureField

## Sumary

An alternative to "custom password" text fields made 100% with `SwiftUI`. 

## Description

ToggleableSecureField is a flexible type of text field that relies on both `SwiftUI` native components `TextField` and `SecureField`. In addition, it contains a built-in toggle  that allows to swap between two states. It is the ideal component to let users input their password, showing or hiding the entered content without glitches.

The "show/hide" button takes in an `Image` that can be customized via environment, as well as its tint `Color`.

# Customization
Any style (or other types of) customization can be done externally using the [TextFieldStyle](https://developer.apple.com/documentation/swiftui/textfieldstyle). 

# Usage

```swift
ToggleableSecureField(
  title: "Password",
  text: $password,
  prompt: nil
)
.environment(\.secureToggleImageShow, Image(systemName: "eye.circle"))
.environment(\.secureToggleImageHide, Image(systemName: "eye.slash.circle"))
.environment(\.secureToggleImageTintColor, .orange)
```

## Preview

<img width="373" alt="image" src="https://user-images.githubusercontent.com/20460404/168142630-9ec09ffc-507d-446a-8135-9a1c46e6ec07.png">

## Demo

![tfgif](https://user-images.githubusercontent.com/20460404/168142892-fa98f297-9aa7-4fc7-9537-d1af0df75e92.gif)
