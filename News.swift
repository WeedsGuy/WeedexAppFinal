import SwiftUI

struct newsView: View {
    @EnvironmentObject var store: BlogPostsStore

    var featuredPosts: [BlogPost] {
        return store.blogPosts.filter { $0.featured == true }
    }

    @State private var isAtBottom: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background image with black opacity overlay
                Image("guy0")
                    .resizable()
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.3))
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) { // Remove any default spacing
                        GeometryReader { geometry in
                            Color.clear
                                .frame(height: 1) // Set a minimal frame height
                                .onAppear {
                                    checkIfAtBottom(geometry: geometry)
                                }
                                .onChange(of: geometry.frame(in: .global).minY) { newValue, oldValue in
                                    checkIfAtBottom(geometry: geometry)
                                }
                        }
                                                    
                        .frame(height: 1) // Ensure the height is minimal

                        // Featured article
                        if featuredPosts.count > 0 {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Featured Post")
                                    .font(.title.bold())
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.white.opacity(0.5))
                                    .cornerRadius(8)
                                    .foregroundColor(.black)
                                    .padding(.leading, 125)

                                LazyVStack {
                                    ForEach(featuredPosts) { post in
                                        NavigationLink(destination: BlogPostView(blogPost: post)) {
                                            BlogPostCardMain(blogPost: post)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 1)
                            .padding(.vertical, 20)
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Recently Added")
                                .font(.title.bold())
                                .padding(.horizontal, 16)
                                .padding(.vertical, 2)
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(8)
                                .foregroundColor(.black)
                                .padding(.leading, 90)

                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 10) {
                                    if store.blogPosts.count >= 3 {
                                        ForEach(store.blogPosts[0...2]) { post in
                                            NavigationLink(destination: BlogPostView(blogPost: post)) {
                                                BlogPostCardMain(blogPost: post)
                                            }
                                        }
                                    } else {
                                        ForEach(store.blogPosts[0..<store.blogPosts.count]) { post in
                                            NavigationLink(destination: BlogPostView(blogPost: post)) {
                                                BlogPostCardMain(blogPost: post)
                                            }
                                        }
                                    }
                                }
                                .padding(.leading, 1)
                            }
                            .frame(height: 420)
                        }
                        .padding(.horizontal, 1)
                        .padding(.vertical, 15) // Reduced padding

                        // Spacer to push content above the buttons
                        Spacer()
                        
                        if isAtBottom {
                            HStack {
                               
                                Button(action: {
                                   
                                    if let window = UIApplication.shared.windows.first {
                                        window.rootViewController = UIHostingController(rootView: MainHubView().environmentObject(store))
                                        window.makeKeyAndVisible()
                                    }
                                })
                                {
                                    Image(systemName: "arrow.left.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding()
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom, 10)
                                .transition(.opacity)

                                Spacer()

                                Button(action: { store.refreshView() }) {
                                    Image(systemName: "arrow.clockwise.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding()
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom, 10)
                                .transition(.opacity)
                            }
                        }
                    }
                    .padding(.bottom, 55) // Add bottom padding to ensure buttons are visible
                }
                .navigationBarHidden(true)
            }
        }
    }

    private func checkIfAtBottom(geometry: GeometryProxy) {
        DispatchQueue.main.async {
            let maxY = geometry.frame(in: .global).maxY
            let screenHeight = UIScreen.main.bounds.height

            if maxY <= screenHeight + 20 {
                withAnimation {
                    isAtBottom = true
                }
            } else {
                withAnimation {
                    isAtBottom = false
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        newsView()
            .environmentObject(BlogPostsStore())
    }
}


