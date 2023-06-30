//
//  UIApllication + Extension.swift
//  ContactListRealm
//
//  Created by Val Po on 18.06.2023.
//

import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive}
            .first ( where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
