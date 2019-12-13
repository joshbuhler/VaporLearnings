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
}
