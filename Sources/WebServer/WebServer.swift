import Hummingbird

@main
struct WebServer {
    static func main() async throws {
        let router = Router()
        router.get("/") { request, _ -> String in
            return "Hello"
        }
        let app = Application(
            router: router, configuration: .init(address: .hostname("0.0.0.0", port: 8080))
        )
        try await app.runService()
    }
}
