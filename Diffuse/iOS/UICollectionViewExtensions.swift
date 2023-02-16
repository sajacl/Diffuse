//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

#if os(iOS)

import UIKit

extension UICollectionView {
    public final func reload(
        with changes: CollectionChanges,
        section: Int = 0,
        updateDataSource: () -> Void
    ) {
        guard changes.hasChanges else {
            // no op
            return
        }

        let indexPaths = IndexPathResult(changes: changes, section: section)

        performBatchUpdates({
            updateDataSource()

            insertItems(at: indexPaths.inserted)
            reloadItems(at: indexPaths.updated)
            deleteItems(at: indexPaths.removed)

            indexPaths.moved.forEach { update in
                moveItem(at: update.from, to: update.to)
            }
        })
    }
}

#endif
