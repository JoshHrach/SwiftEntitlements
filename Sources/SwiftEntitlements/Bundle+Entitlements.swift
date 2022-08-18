//
//  Bundle+Entitlements.swift
//  
//
//  Created by Josh Hrach on 8/18/22.
//

import Foundation


public extension Bundle {

    var entitlements: Entitlements {
        guard let executableName = infoDictionary?["CFBundleExecutable"] as? String else {
            return .empty
        }
        guard let executablePath = path(forResource: executableName, ofType: nil) else {
            return .empty
        }
        do {
            return try EntitlementsReader(executablePath).readEntitlements()
        } catch {
            debugPrint("Reading entitlements failed: \(error.localizedDescription)")
            return .empty
        }
    }
}
