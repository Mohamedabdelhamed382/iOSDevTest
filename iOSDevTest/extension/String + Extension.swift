//
//  String + Extension.swift
//  iOSDevTest
//
//  Created by MohamedAbdelhamed on 25/09/2022.
//

import Foundation
extension String{
    var asUrl: URL?{
        return URL(string: self)
    }
}
