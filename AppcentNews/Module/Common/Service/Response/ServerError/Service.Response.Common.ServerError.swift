//
//  Service.Response.Common.ServerError.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

extension Service.Response.Common {
    struct ServerError : Codable, Mappable {
        var status: String
        var code : String
        var message : String
        typealias T = Service.Model.Common.ServerError
        func map() -> T {
            return T(status: status, code: code, message: message)
        }
    }
}

