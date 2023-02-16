//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

extension Diffuse {
    public struct Element<T: Hashable>: Hashable {
        public let value: T
        public let index: Int

        public init(value: T, index: Int) {
            self.value = value
            self.index = index
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(value.hashValue)
        }

        public static func == (lhs: Element<T>, rhs: Element<T>) -> Bool {
            return lhs.value == rhs.value
        }
    }
}
