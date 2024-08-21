import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    @State private var expandedSections: [ServiceType: Bool] = ServiceType.allCases.reduce(into: [:]) { $0[$1] = false }
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        NavigationBarConfigurator.configureAppearance()
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomLeading) {
                Image("guy")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(ServiceType.allCases, id: \.self) { serviceType in
                                VStack(alignment: .leading) {
                                    SectionHeaderView(serviceType: serviceType, isExpanded: expandedSections[serviceType] ?? false) {
                                        withAnimation {
                                            expandedSections[serviceType]?.toggle()
                                        }
                                    }
                                    
                                    if expandedSections[serviceType] ?? false {
                                        ZStack {
                                            Rectangle()
                                                .fill(Color.white.opacity(0.5))
                                                .cornerRadius(20)
                                                .padding(.bottom, 30)
                                            
                                            LazyVGrid(columns: columns, spacing: 16) {
                                                ForEach(MockData.frameworks.filter { $0.serviceType == serviceType }.sorted { $0.name < $1.name }) { framework in
                                                    FrameworkTitleView(framework: framework)
                                                        .onTapGesture {
                                                            viewModel.selectedFramework = framework
                                                        }
                                                }
                                            }
                                            .padding()
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .background(Color.weeder)
                                .cornerRadius(15)
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 120)
                    }
                    .opacity(0.9)
                    .padding(.bottom, 10)
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding([.leading, .bottom], 10)
                .padding(.bottom, 10) // Add additional padding to ensure it isn't cut off
            }
            .ignoresSafeArea(edges: .top) // Ensures the top of the stack ignores the safe area
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
}

struct SectionHeaderView: View {
    let serviceType: ServiceType
    let isExpanded: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(serviceType.rawValue)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 2, y: 2)
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .padding()
                    .foregroundColor(.black)
                   
            }
            .contentShape(Rectangle()) // Ensures the entire HStack is tappable
            .padding(.vertical, 10) // Add vertical padding
            .background(Color.clear)
        }
        .background(Color.white.opacity(0.001)) // Make sure the Button has a background for better touch detection
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
                .cornerRadius(20.0)
                .padding()
            
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(width: 90, height: 20) // Ensure the text container width is controlled
                .minimumScaleFactor(0.5)
                .lineLimit(nil)
                .foregroundColor(.black)
        }
        .padding()
        .contentShape(Rectangle())
    }
}


