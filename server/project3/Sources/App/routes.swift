import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    router.get("hello") { req in
        return "Hello, world!"
    }
    router.get("hello", "world") { req in
        return "Hello, world! 2"
    }
    
    router.get("greetings", String.parameter) { req -> String in
        let name = try req.parameters.next(String.self)
        return "Hello, \(name)"
    }
    
    router.get("read", Int.parameter) { req -> String in
        let number = try req.parameters.next(Int.self)
        return "Now it's time for page \(number)"
    }
    
    router.get("posts", Int.parameter, String.parameter) { req -> String in
        let id = try req.parameters.next(Int.self)
        let title = try req.parameters.next(String.self)
        return "Loading article: \(id) - \(title)"
    }
    
    router.post("posts", Int.parameter, String.parameter) { req -> String in
        let id = try req.parameters.next(Int.self)
        let title = try req.parameters.next(String.self)
        return "Saving article: \(id) - \(title)"
    }
    
    router.get("articles", Article.parameter) { req -> Future<Article> in
        let article = try req.parameters.next(Article.self)
        
        return article.map(to: Article.self) { article in
            guard let article = article else {
                throw Abort(.badRequest)
            }
            
            return article
        }
        
    }
}
