//
//  Poll.swift
//  App
//
//  Created by Joshua Buhler on 12/12/19.
//

import Foundation
import Vapor

struct Poll:Content {
    var id:UUID?
    var title:String
    var option1:String
    var option2:String
    var votes1:Int
    var votes2:Int
}
