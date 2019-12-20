//
//  Article.swift
//  App
//
//  Created by Joshua Buhler on 12/17/19.
//

import Foundation
import Vapor

struct Article:Parameter, Content {
    typealias ResolvedParameter = Article
    
    var id:Int
    var title:String
    
    init (id:String) {
        if let intID = Int(id) {
            self.id = intID
            self.title = "Custom params are spiffy"
        } else {
            self.id = 0
            self.title = "whomp womp"
        }
    }
    
    static func resolveParameter(_ parameter: String, on container: Container) throws -> Article {
        print ("Article.ResolvedParameter")
        return Article(id: parameter)
    }
    
//    static func resolveParameter(_ parameter:String, on container:Container) throws -> Future<Article?> {
//
//        print ("Future<Article?>")
//        return Future.map(on: container) { Article(id: parameter)}
//    }
}
