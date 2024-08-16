//
//  View+Ext.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation
import SwiftUI

extension View {
    func toast(message: String, isShowing: Bool, duration: TimeInterval = 2.0) -> some View {
        self.modifier(ToastView(message: message, isShowing: isShowing, duration: duration))
    }
}
