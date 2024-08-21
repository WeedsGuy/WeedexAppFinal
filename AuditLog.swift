import Foundation
import Combine

class AuditLogViewModel: ObservableObject {
    @Published var auditLogs: [AuditLog] = []
    private var cancellables = Set<AnyCancellable>()
    
    func fetchAuditLogs() {
        let url = URL(string: "https://api.samsara.com/fleet/routes/audit-logs/feed")!
        var request = URLRequest(url: url)
        request.setValue("Bearer <token>", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: AuditLogResponse.self, decoder: JSONDecoder())
            .replaceError(with: AuditLogResponse(data: [])) // Handle errors appropriately
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                self?.auditLogs = response.data
            }
            .store(in: &cancellables)
    }
}

struct AuditLogResponse: Decodable {
    let data: [AuditLog]
}

struct AuditLog: Decodable, Identifiable {
    let id: String
    let latitude: Double
    let longitude: Double
    // Include other relevant fields
}


