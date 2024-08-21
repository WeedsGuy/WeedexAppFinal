import SwiftUI
import WebKit

struct PodView: View {
    let videoLinks = VideoInfo.videoLinks
    @State private var loadedVideos = Set<String>()
    @Environment(\.presentationMode) var presentationMode
    
    func loadVideo(_ link: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            loadedVideos.insert(link)
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(videoLinks, id: \.0) { link, description in
                                VideoCard(url: link, description: description, isLoaded: loadedVideos.contains(link))
                                    .frame(height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 3))
                                    .shadow(radius: 10)
                                    .padding(.horizontal, 2)
                                    .onAppear {
                                        loadVideo(link)
                                    }
                            }
                        }
                    }
                    .padding(.bottom, 10)
                }
                .background(
                    Image("street") // Replace "street" with the name of your image asset
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )

                VStack {
                    Spacer()
                    HStack {
                        NavigationLink(destination: MainHubView()
                                        .edgesIgnoringSafeArea(.all)
                                        .navigationBarHidden(true)
                                        .navigationBarBackButtonHidden(true)) {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                                .padding()
                        }
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct VideoCard: View {
    let url: String
    let description: String
    let isLoaded: Bool

    var body: some View {
        HStack {
            if isLoaded {
                WebViewer(urlString: convertToEmbedURL(url))
                    .aspectRatio(16/9, contentMode: .fit)
                    .frame(width: 130)
                    .clipped()
                    .padding(.leading, 1)
            } else {
                ZStack {
                    Color.gray.opacity(0.3)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .aspectRatio(16/9, contentMode: .fit)
                .frame(width: 160)
                .padding(.leading, 4)
            }

            VStack(alignment: .leading) {
                Text(description)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(10)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.leading, 8)
        }
        .padding()
        .background(Color.white.opacity(0.6))
        .cornerRadius(20)
    }

    func convertToEmbedURL(_ url: String) -> String {
        if let videoID = url.components(separatedBy: "v=").last?.components(separatedBy: "&").first {
            return "https://www.youtube.com/embed/\(videoID)"
        }
        return url
    }
}

struct PodView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PodView()
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct WebViewer: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}


