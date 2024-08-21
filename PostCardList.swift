import SwiftUI
import SDWebImageSwiftUI

struct BlogPostCardList: View {
    
    var blogPost: BlogPost
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: blogPost.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .frame(maxWidth: UIScreen.main.bounds.width - 60)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            VStack(spacing: 6) {
                HStack {
                    Text(blogPost.title)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(Font.title2.bold())
                        .foregroundColor(.black) // Set text color to black
                    Spacer()
                }

                HStack {
                    Text(blogPost.subtitle)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                        .foregroundColor(.black) // Set text color to black
                    Spacer()
                }
            }
            .padding(.horizontal) // Add padding to inner VStack
        }
        .background(Color.white) // Set background color to white
        .cornerRadius(20) // Add corner radius to outer VStack
        .shadow(radius: 5) // Optional: add shadow for better separation
        .frame(maxWidth: UIScreen.main.bounds.width - 60, alignment: .leading)
        .padding()
    }
}

struct BlogPostCardList_Previews: PreviewProvider {
    static let store = BlogPostsStore()
    static let placeholder = BlogPost(title: "This is a placeholder", subtitle: "A subtitle for the placeholder", image: URL(string: "https://media.nature.com/lw800/magazine-assets/d41586-020-03053-2/d41586-020-03053-2_18533904.jpg"), blogpost: "Blog post")
    
    static var previews: some View {
        BlogPostCardList(blogPost: placeholder)
            .environmentObject(store)
        
        BlogPostCardList(blogPost: placeholder)
            .environmentObject(store)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}



