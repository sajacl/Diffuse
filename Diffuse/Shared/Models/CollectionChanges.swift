//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

import Foundation

public struct CollectionChanges {
    public let inserted: [Int]
    public let removed: [Int]
    public let moved: [Move<Int>]
    public let updated: [Int]

    public init(
        inserted: [Int] = [],
        removed: [Int] = [],
        moved: [Move<Int>] = [],
        updated: [Int] = []
    ) {
        self.inserted = inserted
        self.removed = removed
        self.moved = moved
        self.updated = updated
    }

    public var sumCount: Int {
        return inserted.count +
        removed.count +
        moved.count +
        updated.count
    }

    public var hasChanges: Bool {
        let isMergedArrayEmpty = [
            inserted,
            removed,
            updated
        ].lazy.allSatisfy(\.isEmpty)

        let isEmpty: Bool

        // In favour of readability,
        // Next lines will not be inlined.
        if !isMergedArrayEmpty {
            isEmpty = false
        } else {
            isEmpty = moved.isEmpty
        }

        return !isEmpty
    }
}
