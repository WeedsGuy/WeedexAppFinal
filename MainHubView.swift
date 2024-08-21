import SwiftUI


extension Color {
    static let weeder = Color(red: 0.0, green: 0.666, blue: 0.0)
}

struct MainHubView: View {
    @EnvironmentObject var store: BlogPostsStore
    @State private var showPodView = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background Image
                Image("street1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                // Overlay
                Color.black.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Main buttons in the middle
                    HStack(spacing: 20) {
                        // Navigation Link to Services
                        NavigationLink(destination: NavigationContainerView(content: FrameworkGridView()).navigationBarBackButtonHidden(true)) {
                            VStack {
                                Image(systemName: "camera.macro")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 80)
                                    .clipShape(Capsule())
                                    .background(Color.weeder)
                                    .cornerRadius(12.0)
                                    .shadow(color: .gray, radius: 5, x: 2, y: 2)

                                Text("Services")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(5)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                        }

                        // Button to show Podcast view
                        Button(action: {
                            showPodView.toggle()
                        }) {
                            VStack {
                                Image(systemName: "mic.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 80)
                                    .clipShape(Capsule())
                                    .background(Color.weeder)
                                    .cornerRadius(12.0)
                                    .shadow(color: .gray, radius: 5, x: 2, y: 2)

                                Text("Podcast")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(5)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                        }
                        .fullScreenCover(isPresented: $showPodView) {
                            NavigationContainerView(content: PodView())
                        }

                        // Navigation Link to News
                        NavigationLink(destination: NavigationContainerView(content: newsView()).navigationBarBackButtonHidden(true)) {
                            VStack {
                                Image(systemName:"newspaper")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 80)
                                    .clipShape(Capsule())
                                    .background(Color.weeder)
                                    .cornerRadius(12.0)
                                    .shadow(color: .gray, radius: 5, x: 2, y: 2)

                                Text("News")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(5)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
                .padding(.bottom, 50)

                // Bottom navigation buttons
                VStack {
                    Spacer()
                    HStack {
                        NavigationLink(destination: Opening().navigationBarBackButtonHidden(true)) {
                            VStack {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .cornerRadius(3.0)

                                Text("Home")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                            .padding(.bottom, 25)
                            .padding(.leading, 15)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        }
                        .padding()
                        Spacer()
                        NavigationLink(destination: InfoView().navigationBarBackButtonHidden(true)) {
                            VStack {
                                ZStack {
                                    Image(systemName: "info.bubble.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)

                                    if store.hasNewPost {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 10, height: 10)
                                            .offset(x: 15, y: -15)
                                    }
                                }

                                Text("About Us")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                            .padding()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        }
                        .padding(.bottom, 25)
                        .padding(.trailing, 15)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .onAppear {
                DispatchQueue.main.async {
                    store.hasNewPost = false
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// Navigation Container View to hide the navigation bar
struct NavigationContainerView<Content: View>: View {
    let content: Content

    var body: some View {
        NavigationView {
            content
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// Preview
struct MainHubView_Previews: PreviewProvider {
    static var previews: some View {
        MainHubView()
            .environmentObject(BlogPostsStore())
    }
}



