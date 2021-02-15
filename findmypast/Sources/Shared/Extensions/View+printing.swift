import SwiftUI

extension View {
  public func printing<A>(_ value: A) -> Self {
    print(value)
    return self
  }
}
