import SwiftUI
import Contentful
import Foundation

// change to your spaceID and accessToken
// you can find these in Settings -> API keys on Contentful
let spaceId = "2qox4i1rz8rc"
let accessToken = "HLz-MKVaZxqFtCFiSkoOaMdV2Tu-Pho7wqRpYSZgl6Q"

let client = Client(spaceId: spaceId, accessToken: accessToken)

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    try! query.order(by: Ordering(sys: .createdAt, inReverse: true)) // ordering the list of articles by created date
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .failure(let error):
            print(error)
        }
    }
}

class BlogPostsStore: ObservableObject {
    @Published var blogPosts: [BlogPost] = articleList
    @Published var hasNewPost: Bool = false
    private var lastPostCount: Int = 0
    
    init() {
        DispatchQueue.main.async {
            self.refreshView()
        }
    }
    
    func refreshView() {
        blogPosts = []
        DispatchQueue.main.async {
            getArray(id: "swiftBlog") { items in
                items.forEach { item in
                    self.blogPosts.append(
                        BlogPost(
                            title: item.fields["title"] as! String,
                            subtitle: item.fields["subtitle"] as! String,
                            image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: ""),
                            blogpost: item.fields["blogpost"] as? String ?? "",
                            featured: item.fields["featured"] as? Bool ?? false
                        )
                    )
                }
                self.checkForNewPosts()
            }
        }
    }
    
    private func checkForNewPosts() {
        let currentPostCount = blogPosts.count
        if currentPostCount > lastPostCount {
            hasNewPost = true
        } else {
            hasNewPost = false
        }
        lastPostCount = currentPostCount
    }
}




