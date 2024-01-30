//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by Richard Uzor on 30/01/2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigationView() -> some View {
        return NavigationView{ self }
    }
}
