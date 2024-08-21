import SwiftUI
import SafariServices

struct Opening: View {

    private let imageNames = ["weedex4"] // Add your image names here
    private let imageOffsets: [CGFloat] = [-300, -110, 50]
    @State private var showSafari = false
    @State private var currentImageIndex = 0
    @State private var showMainHubView = false // Add your desired offsets for each image here

    var body: some View {
        ZStack {
            // White background
            Color.white
                .edgesIgnoringSafeArea(.all)

  
            Image(imageNames[currentImageIndex])
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(x: imageOffsets[currentImageIndex])
                .onAppear {
                    // Start the timer to cycle images
                    Timer.scheduledTimer(withTimeInterval: 7, repeats: true) { _ in
                        withAnimation {
                            currentImageIndex = (currentImageIndex + 1) % imageNames.count
                        }
                    }
                }

            VStack {
                Spacer()

                // Navigation button to MainHubView
                Button(action: {
                    showMainHubView = true
                }) {
                    Text("Explore")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.weeder) // Changed color for clarity
                        .cornerRadius(15)
                        .shadow(radius: 15)
                }
                .fullScreenCover(isPresented: $showMainHubView) {
                    MainHubView()
                }

                // Button to open SafariView
                Button(action: {
                    showSafari = true
                }) {
                    Text("Manage Account")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.weeder) // Changed color for clarity
                        .cornerRadius(15)
                        .shadow(radius: 15)
                }
                .sheet(isPresented: $showSafari) {
                    SafariView(url: URL(string: "https://www.lawngateway.com/Weedex/Login_New.aspx")!) // Use your existing SafariView
                }
                .padding(.bottom, 15)

                // VStack with 3 lines of text
                VStack(alignment: .center) {
                    Text("Request an estimate:")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .shadow(radius: 10)

                    Text("972-727-9207")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .shadow(radius: 15)
                        .onTapGesture {
                            if let url = URL(string: "tel://9727279207") {
                                UIApplication.shared.open(url)
                            }
                        }

                    Text("Monday to Friday: 7:00am - 5:00pm")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                }
                .padding(.top, 10)
                .padding(.bottom, 15)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}



@main
struct Frameworks_BETAApp: App {
    @StateObject private var blogPostsStore = BlogPostsStore()
    @StateObject private var videoLoader = VideoLoader(videoLinks: VideoInfo.videoLinks)
    var body: some Scene {
        WindowGroup {
           Opening()
                .environmentObject(blogPostsStore)
        }
    }
}



