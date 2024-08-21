import SwiftUI

struct PurchaseView: View {
    var framework: Framework
    @Binding var isShowingPurchaseView: Bool
    
    var body: some View {
        VStack {
            Text("Purchase \(framework.name)")
                .font(.title)
            Text("Price: $\(framework.price, specifier: "%.2f")")
                .font(.headline)
            
            Button("Confirm Purchase") {
                // Handle purchase confirmation logic here
                print("Purchase confirmed for \(framework.name)")
                isShowingPurchaseView = false
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            Button("Cancel") {
                isShowingPurchaseView = false
            }
            .padding()
        }
        .padding()
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}


struct PurchaseView_Previews: PreviewProvider {
    @State static var isShowingPurchaseView = true
    
    static var previews: some View {
        PurchaseView(
            framework: Framework(
                id: UUID(),
                name: "Test Framework",
                imageName: "test_image",
                urlString: "https://www.example.com",
                description: "This is a test framework.",
                price: 99.99,
                serviceType: .insectControl,
            backgroundImages: "sun2"),
            
            isShowingPurchaseView: $isShowingPurchaseView
        )
    }
}


