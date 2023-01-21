//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Evaluate

public extension LAContext {
    /// Assesses whether authentication can proceed for a given policy
    /// - Parameter policy: Policy for which the preflight check should be run.
    func canEvaluate(policy: LAPolicy) throws {
        var error: NSError?
        canEvaluatePolicy(policy, error: &error)
        if let error = error {
            throw error
        }
    }
}
