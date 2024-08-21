import Foundation

class VideoLoader: ObservableObject {
    @Published var loadedVideos = Set<String>()
    
    init(videoLinks: [(String, String)]) {
        loadVideos(videoLinks)
    }
    
    private func loadVideos(_ videoLinks: [(String, String)]) {
        DispatchQueue.global(qos: .background).async {
            for link in videoLinks.map({ $0.0 }) {
                Thread.sleep(forTimeInterval: 1) // Simulate network loading
                DispatchQueue.main.async {
                    self.loadedVideos.insert(link)
                }
            }
        }
    }
}


