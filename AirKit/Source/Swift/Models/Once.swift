//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

/// Instance of this class can manages only one execution block of code.
public final class Once {
    
    // MARK: - Public properties
    
    /// Returns `true` if `run()` method was called, even if unsuccessful.
    public var isExecuted: Bool { block == nil }
    
    // MARK: - Private properties
    
    /// Execution block of code.
    private var block: VoidThrowsBlock?
    
    // MARK: - Life cycle
    
    public init(execute block: @escaping VoidThrowsBlock) {
        self.block = block
    }
    
    // MARK: - Methods
    
    /// Execute block of code only once or throw failure. Nothing will happen if you call this method more than one time.
    public func run() throws {
        defer { block = nil }
        try block?()
    }
}
