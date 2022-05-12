import XCTest
import SnapshotTesting
import SwiftUI
import UIKit

@testable import ToggleableSecureField

final class ToggleableSecureFieldTests: XCTestCase {

  var testField: some View {
    Group {
      ToggleableSecureField(true, title: "Password", text: .constant("p455w0rd"), prompt: nil)
        .padding()
        .background(
          RoundedRectangle(
            cornerSize: .init(width: 5, height: 5)
          )
          .foregroundColor(Color(UIColor.systemBackground))
        )
      ToggleableSecureField(false, title: "Password", text: .constant("p455w0rd"), prompt: nil)
        .padding()
        .background(
          RoundedRectangle(
            cornerSize: .init(width: 5, height: 5)
          )
          .foregroundColor(Color(UIColor.systemBackground))
        )
    }
    .padding()
  }
  
  var emptyField: some View {
    Group {
      ToggleableSecureField(true, title: "Password", text: .constant(""), prompt: nil)
        .padding()
        .background(
          RoundedRectangle(
            cornerSize: .init(width: 5, height: 5)
          )
          .foregroundColor(Color(UIColor.systemBackground))
        )
      ToggleableSecureField(false, title: "Password", text: .constant(""), prompt: nil)
        .padding()
        .background(
          RoundedRectangle(
            cornerSize: .init(width: 5, height: 5)
          )
          .foregroundColor(Color(UIColor.systemBackground))
        )
    }
    .padding()
  }

  func testToggleableSecureFieldWithContent() {
    assertSnapshot(
      matching: testField.colorScheme(.light),
      as: .image(layout: .device(config: .iPhone8))
    )
    assertSnapshot(
      matching: testField.colorScheme(.dark),
      as: .image(layout: .device(config: .iPhone8))
    )
  }
  
  func testToggleableSecureFieldEmpty() {
    assertSnapshot(
      matching: emptyField.colorScheme(.light),
      as: .image(layout: .device(config: .iPhone8))
    )
    assertSnapshot(
      matching: emptyField.colorScheme(.dark),
      as: .image(layout: .device(config: .iPhone8))
    )
  }
  
  func testToggleableSecureFieldTint() {
    assertSnapshot(
      matching: testField
        .environment(\.secureToggleImageTintColor, .orange)
        .colorScheme(.light),
      as: .image(layout: .device(config: .iPhone8))
    )
    assertSnapshot(
      matching: testField
        .environment(\.secureToggleImageTintColor, .orange)
        .colorScheme(.dark),
      as: .image(layout: .device(config: .iPhone8))
    )
  }
  
  func testToggleableSecureFieldCustomImages() {
    assertSnapshot(
      matching: testField
        .environment(\.secureToggleImageShow, Image(systemName: "eye.circle"))
        .environment(\.secureToggleImageHide, Image(systemName: "eye.slash.circle"))
        .colorScheme(.light),
      as: .image(layout: .device(config: .iPhone8))
    )
    assertSnapshot(
      matching: testField
        .environment(\.secureToggleImageShow, Image(systemName: "eye.circle"))
        .environment(\.secureToggleImageHide, Image(systemName: "eye.slash.circle"))
        .colorScheme(.dark),
      as: .image(layout: .device(config: .iPhone8))
    )
  }
}
