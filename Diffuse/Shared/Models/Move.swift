//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

public struct Move<T: Hashable>: Hashable {
    public let from: Int
    public let to: Int
    
    public init(from: Int, to: Int) {
        self.from = from
        self.to = to
    }
}
