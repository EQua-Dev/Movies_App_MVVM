//
//  String+Extension.swift
//  MoviesApp
//
//  Created by Richard Uzor on 30/01/2024.
//  Copyright © 2024 Richard Uzor. All rights reserved.
//

import Foundation

extension String {
    
    //extension function to trim spaces in a given string and replace with percents for network queries
    //Lord of the Rings becomes Lord%20of%20the%20Rings
    
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in:
                .whitespacesAndNewlines)
        return
        trimmedString
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
