// Copyright © 2021 Yurii Lysytsia. All rights reserved.

public extension UISegmentedControl {
    /// Removes all segments and insert a new segments.
    func replace(segments: [String], animated: Bool) {
        removeAllSegments()
        segments.forEach { segment in
            insertSegment(withTitle: segment, at: numberOfSegments, animated: animated)
        }
    }
}
