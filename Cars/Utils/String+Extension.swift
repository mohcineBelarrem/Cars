//
//  String+Extension.swift
//  Cars
//
//  Created by Mohcine Belarrem on 15/10/2022.
//

import Foundation

public extension String {
    func includes(_ s: String) -> Bool {
        if s.isEmpty { return true }
        else { return self.contains(s) }
    }
}
