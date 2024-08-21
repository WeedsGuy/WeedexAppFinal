import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    @State private var isShowingPurchaseView = false
    
    var body: some View {
        VStack {
            // Close button
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black) // Set the color to black
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
            .padding()
            
            Spacer()
            
            // Framework title and description
            FrameworkTitleView(framework: framework)
                .foregroundColor(.black) // Set the color to black
            Text(framework.description)
                .font(.body)
                .foregroundColor(.black) // Set the color to black
                .padding()
            
            Spacer()
            
            // Learn More button
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
                    .padding(.bottom,40)
            }
            .sheet(isPresented: $isShowingSafariView) {
                SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://www.weedexlawn.com")!)
            }
        }
        .background(Color.white) // Set the background color to white
        .edgesIgnoringSafeArea(.all) // Ensure the background covers the entire screen
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(true))
    }
}




