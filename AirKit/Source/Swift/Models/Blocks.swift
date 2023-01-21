//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Void

/// The return type of closure block that don’t explicitly specify a value and a return type, that is, an empty block.
public typealias VoidBlock = () -> Void

/// The return type of closure block that don’t explicitly specify a value and a return type, that is, an empty block but throwable.
public typealias VoidThrowsBlock = () throws -> Void
