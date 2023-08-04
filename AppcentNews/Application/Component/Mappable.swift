//
//  Mappable.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation

protocol Mappable {
    associatedtype T
    func map() -> T
}

