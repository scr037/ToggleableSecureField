import SwiftUI


  /// A flexible type of text field that relies on both `SwiftUI` native
  /// components `TextField` and `SecureField` and a built-in
  /// toggle allows to swap between the two.
  /// This visual component is ideal to let users input passwords
  /// allowing to show or hide the entered content without glitches.
  ///
  /// The "show/hide" button takes in an image that can be customized
  /// via environment, as well as its tint color.
  ///
  /// Example of usage:
  /// ```
  /// ToggleableSecureField(
  ///   title: "Password",
  ///   text: $password,
  ///   prompt: nil
  /// )
  /// .environment(\.secureToggleImageShow, Image(systemName: "eye.circle"))
  /// .environment(\.secureToggleImageHide, Image(systemName: "eye.slash.circle"))
  /// .environment(\.secureToggleImageTintColor, .orange)
  /// ```
public struct ToggleableSecureField: View {
  @State private var isSecure: Bool

  private var title: String
  private var text: Binding<String>
  private var prompt: Text?

  public init(
    _ isSecure: Bool = true,
    title: String,
    text: Binding<String>,
    prompt: Text?
  ) {
    self.isSecure = isSecure
    self.title = title
    self.text = text
    self.prompt = prompt
  }
  
  public var body: some View {
    VStack {
      if isSecure {
        if #available(iOS 15.0, *) {
          SecureField(title, text: text, prompt: prompt)
        } else {
          SecureField(title, text: text)
        }
      } else {
        if #available(iOS 15.0, *) {
          TextField(title, text: text, prompt: prompt)
        } else {
          TextField(title, text: text)
        }
      }
    }
    .textFieldStyle(
      .toggleableSecureField(isSecure: $isSecure)
    )
  }
}

struct ToggleableSecureField_Previews: PreviewProvider {
  static var field: some View {
    ToggleableSecureField(
      title: "Password",
      text: .constant("p455w0rd"),
      prompt: Text("Enter your password")
    )
  }

  @ViewBuilder
  static var fieldGroup: some View {
    if #available(iOS 14.0, *) {
      GroupBox { field }
    } else {
      field
        .padding()
        .background(
          RoundedRectangle(
            cornerSize: .init(width: 10, height: 10)
          )
          .foregroundColor(Color(UIColor.systemBackground))
        )
    }
  }

  static var previews: some View {
    VStack {
      Text("ToggleableSecureField")
        .padding()
        .font(.headline)
      fieldGroup.colorScheme(.light)
      fieldGroup.colorScheme(.dark)
    }
    .padding()
  }
}


