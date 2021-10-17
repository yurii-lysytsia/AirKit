//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(LocalAuthentication)
import LocalAuthentication

// MARK: - Extensions | Evaluate

public extension LAContext {
    /// Assesses whether authentication can proceed for a given policy
    /// - Parameter policy: Policy for which the preflight check should be run.
    func canEvaluate(policy: LAPolicy) throws {
        var error: NSError?
        canEvaluatePolicy(policy, error: &error)
        try error.run { throw $0 }
    }
}
#endif
