import Foundation
import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {

    router.post(Poll.self,
                at: "polls", "create") { req, poll -> Future<Poll> in
                    
                    return poll.save(on: req)
    }
    
    router.get("polls", "list") { req -> Future<[Poll]> in
        return Poll.query(on: req).all()
    }
    
    router.get("polls", "single", UUID.parameter) { req -> Future<Poll> in
        let id = try req.parameters.next(UUID.self)
        return Poll.find(id, on: req).map(to: Poll.self) { poll in
            guard let poll = poll else {
                throw Abort(.notFound)
            }
            
            return poll
        }
    }
    
    router.delete("polls", UUID.parameter) { req -> Future<Poll> in
        let id = try req.parameters.next(UUID.self)
        
        return Poll.find(id, on: req).flatMap { poll in
            guard let poll = poll else {
                throw Abort(.notFound)
            }
            
            return poll.delete(on: req).map {
                return poll
            }
        }
    }
    
    
    router.post("polls", "vote", UUID.parameter, Int.parameter) { req -> Future<Poll> in
        let id = try req.parameters.next(UUID.self)
        let vote = try req.parameters.next(Int.self)
        print ("pollID: \(id)")
        
        return try Poll.find(id, on: req).flatMap(to: Poll.self) { poll in
            guard var poll = poll else {
                throw Abort(.notFound)
            }
            
            if (vote == 1) {
                poll.votes1 += 1
            } else {
                poll.votes2 += 1
            }
            
            return poll.save(on: req)
        }
    }
}
