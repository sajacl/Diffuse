//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

public struct Move<T: Hashable>: Hashable {
    public let from: T
    public let to: T

    public init(from: T, to: T) {
        self.from = from
        self.to = to
    }
}
