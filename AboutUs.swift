import SwiftUI

struct InfoView: View {
    
    private let imageNames = ["weedex3", "weedex0"]
    private let imageOffsets: [CGFloat] = [-110, 50]
    private let buttonImageNames = ["instagram", "facebook", "Twitter", "tiktok"] // Replace with your actual image names
    private let buttonURLs = [
        URL(string: "https://www.instagram.com/weedexlawncare/")!,
        URL(string: "https://www.facebook.com/weedexlawn")!,
        URL(string: "https://www.twitter.com/weedexlawncare")!,
        URL(string: "https://www.tiktok.com/@weedexlawn")!
    ] // Replace with your actual URLs
    
    @State private var currentImageIndex = 0
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            // Background image
            Image(imageNames[currentImageIndex])
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(x: imageOffsets[currentImageIndex])
                .onAppear {
                    // Start the timer to cycle images
                    timer = Timer.scheduledTimer(withTimeInterval: 7, repeats: true) { _ in
                        withAnimation(.easeInOut(duration: 1)) {
                            currentImageIndex = (currentImageIndex + 1) % imageNames.count
                        }
                    }
                }
                .onDisappear {
                    timer?.invalidate()
                }
            
            
            VStack {
                Spacer()
                
                VStack(alignment: .center) {
                    Text("We're Family Owned")
                        .font(.largeTitle) // Slightly larger text
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding([.leading, .trailing, .top], 10)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text(LongTextProvider.longText)
                                .foregroundColor(.black) // Set text color to black
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                                .padding([.leading, .trailing], 10) // Add padding to the text container
                        }
                    }
                    .frame(width: 360, height: 400) // Set the height of the scroll view
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 0) // Shift the scroll view down slightly
                }
                
                HStack {
                    ForEach(0..<buttonImageNames.count, id: \.self) { index in
                        Button(action: {
                            // Open the corresponding URL
                            if let url = buttonURLs[safe: index] {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Image(buttonImageNames[index])
                                .resizable()
                                .scaledToFill() // Ensure the image fills the frame
                                .frame(width: 50, height: 50) // Adjust size as needed
                                .clipShape(Circle()) // Clip image to circle
                                .overlay(Circle().stroke(Color.white, lineWidth: 2)) // Optional: add a border
                                .padding()
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(360)
                        }
                    }
                }
                .padding(.top, 10) // Adjust top padding between scroll view and buttons
                
                Spacer() // Add spacer here
                
                HStack {
                    NavigationLink(destination: MainHubView().navigationBarHidden(true)) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(360)
                    }
                    .padding(.bottom, 5) // Add padding to the bottom of the button
                  // Add padding to the bottom of the button
                }
            }
            .padding(.top, 20) // Optional: add padding to the top to create space from the top edge
        }
        .navigationBarHidden(true)
    }
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}



