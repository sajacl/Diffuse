//
//  Copyright © FINN.no AS, Inc. All rights reserved.
//

#if os(iOS)

import UIKit

extension UITableView {
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
        let animation = UITableView.RowAnimation.automatic

        if #available(iOS 11, *) {
            performBatchUpdates({
                updateDataSource()
                insertRows(at: indexPaths.inserted, with: animation)
                reloadRows(at: indexPaths.updated, with: animation)
                deleteRows(at: indexPaths.removed, with: animation)

                indexPaths.moved.forEach { update in
                    moveRow(at: update.from, to: update.to)
                }
            })
        } else {
            beginUpdates()
            updateDataSource()
            insertRows(at: indexPaths.inserted, with: animation)
            reloadRows(at: indexPaths.updated, with: animation)
            deleteRows(at: indexPaths.removed, with: animation)

            indexPaths.moved.forEach { update in
                moveRow(at: update.from, to: update.to)
            }
            endUpdates()
        }
    }
}

#endif
