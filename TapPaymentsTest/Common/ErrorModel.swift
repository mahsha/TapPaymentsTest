//
//  ErrorModel.swift
//  TapPaymentsTest
//
//  Created by MahmoudShaabanAllam on 12/11/2022.
//

import Foundation

enum ErrorModel: Error {
    case network(string: String)
    case parse(string: String)
    case other(string: String)
}
