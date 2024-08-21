import Foundation


struct Framework: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let imageName: String
    let urlString: String
    let description: String
    let price: Double
    let serviceType: ServiceType
    let backgroundImages: String

}

enum ServiceType: String, CaseIterable {
    case lawnHealth = "Lawn Health"
    case lawnDisease = "Lawn Disease"
    case summerGrassyWeeds = "Summer Grassy Weeds"
    case treeAndShrub = "Tree and Shrub"
    case insectControl = "Insect Control"
   
    var defaultBackgroundImageName: String {
           switch self {
           case .lawnHealth:
               return "health"
           case .lawnDisease:
               return "spray"
           case .summerGrassyWeeds:
               return "hands"
           case .treeAndShrub:
               return "shrub"
           case .insectControl:
               return "pest"
          
           }
       }
   }
    
    struct MockData {
        
        static let sampleFramework = Framework (name: "Chinch Bug",
                                                imageName: "chinch",
                                                urlString: "https://weedexlawn.com/lawn-care-services/#chinch-bug-control",
                                                description: "Our chinch bug control treatments eliminate chinch bugs from your lawn. If you have them on your property, then our team will deploy a potent insecticide treatment to knock them out.",
                                                price: 100,
                                                serviceType:.insectControl,
                                                backgroundImages: "sun2")
        
        
        static let frameworks = [
            Framework(name: "Bermuda Mite",
                      imageName: "bermuda",
                      urlString: "https://weedexlawn.com/lawn-care-services/#bermuda-mite-control",
                      description: "Protect your bermudagrass from mites with our bermuda mite control treatments. We will cover your lawn with a targeted insecticide that will kill any bermuda mites tucked away in your lawn.",
                      price: 74.99,
                      serviceType: .insectControl,
                      backgroundImages: "sun2"),
            
            Framework(name: "Chinch Bug",
                      imageName: "chinch",
                      urlString: "https://weedexlawn.com/lawn-care-services/#chinch-bug-control",
                      description: "Our chinch bug control treatments eliminate chinch bugs from your lawn. If you have them on your property, then our team will deploy a potent insecticide treatment to knock them out.",
                      price: 23 ,
                      serviceType: .insectControl,
                      backgroundImages: "sun2"),
            
            Framework(name: "Tree & Shrub",
                      imageName: "trees",
                      urlString: "https://weedexlawn.com/tree-shrub-care",
                      description: "Your trees and shrubs require some TLC if you want them to thrive on your property. Our team at Weedex Lawn Care is here to give your plants just that. Since 2001, we have provided first-class tree and shrub care services to residential property owners in Dallas, TX, and surrounding cities like Fort Worth and Arlington. Our services include highly impactful tree and shrub fertilization, disease control, and insect control treatments — all of which are available as part of our 7-step ornamental tree and shrub care program. If you're ready to watch your trees and shrubs take off, call us today at (972) 635-4935 to sign up for our services!",
                      price: 1,
                      serviceType:.treeAndShrub,
                      backgroundImages: "sun2"),
            
            Framework(name: "Core Aeration",
                      imageName: "core",
                      urlString: "https://weedexlawn.com/core-aeration/",
                      description: "Over time, your soil will likely become compacted due to various factors like foot traffic, the weight of lawn mowers, rain, and more. If the soil on your lawn is compacted, it can severely inhibit your turf's health. Fortunately, that's where we come in! At Weedex Lawn Care, we can help your lawn breathe and grow again with our core aeration service, which we perform in the spring, from February until May, to best suit the warm-season grasses here. We'll pass over your lawn with our commercial-grade aerator to pull up cores of soil, creating tiny holes in the surface that act as passageways for sunlight, water, air, and nutrients to access the roots of your grass. Then, we'll leave the cores on your lawn to let them return nutrients to the soil as they break down.",
                      price: 1,
                      serviceType: .lawnHealth,
                      backgroundImages: "sun2"),
            
            Framework(name: "Fertilization",
                      imageName: "fert",
                      urlString: "https://weedexlawn.com/lawn-fertilization",
                      description: "Lawns in Texas need water, oxygen, and sunlight just to stay alive. In order to thrive, however, they need a nutrient boost that only fertilizer can provide. At Weedex Lawn Care, we offer a top-notch lawn fertilization service that will help your grass become healthier and look better than ever before. Our fertilization service is part of our comprehensive lawn care program that includes 8 fertilization and weed control treatments throughout the year.",
                      price: 1,
                      serviceType: .lawnHealth,
                      backgroundImages: "sun2"),
            
            Framework(name: "Weed Control",
                      imageName: "weeds",
                      urlString: "https://weedexlawn.com/weed-control",
                      description: "Not only are weeds an eyesore, but they steal much-needed nutrients from your grass for themselves. At Weedex Lawn Care, we'll help you say goodbye to a weed-ridden lawn and say hello to a healthy, weed-free one with our weed control service! Throughout the year, we'll apply our pre- and post-emergent weed control treatments multiple times to prevent weeds from sprouting and to eliminate any that have already surfaced. What's more, our weed control program also includes fertilization treatments to supply your lawn with all the nutrients it needs to thrive! You can trust that your turf is in good hands and that we'll deliver the results you expect every time.",
                      price:1,
                      serviceType: .lawnHealth,
                      backgroundImages: "sun2"),
            
            Framework(name: "Dallisgrass",
                      imageName: "dali",
                      urlString: "https://weedexlawn.com/dallisgrass-control",
                      description: "Dallisgrass is a persistent, grassy weed that becomes quite a nuisance for your lawn, but it won't stand a chance against us! We use highly effective non-selective herbicide post-emergent dallisgrass control treatments to eliminate this pesky weed. Our dallisgrass control treatments are available as an add-on to our lawn care program. This program includes fertilization and pre- and post-emergent weed control treatments throughout the year; during these routine visits, our team at Weedex Lawn Care will keep an eye open for dallisgrass and advise treatment if we spot any.",
                      price: 1,
                      serviceType: .summerGrassyWeeds,
                      backgroundImages: "sun2"),
            
            Framework(name: "Nutsedge",
                      imageName: "nuts",
                      urlString: "https://weedexlawn.com/nutsedge-control",
                      description: "Nutsedge is nothing to mess around with. This grassy, weed-like plant can spread like wildfire across your lawn, impacting its health and reducing your curb appeal. Nutsedge can be very difficult to get rid of, too. At Weedex Lawn Care, we offer a professional nutsedge control service to residents in Dallas, Fort Worth, Arlington, TX, and surrounding cities.",
                      price:1,
                      serviceType: .summerGrassyWeeds,
                      backgroundImages: "sun2"),
            
            Framework(name: "Lawn Disease",
                      imageName: "lawndis",
                      urlString: "https://weedexlawn.com/lawn-disease-control",
                      description: "Lawn diseases can cause serious damage to your grass. If left untreated, they are capable of turning a beautiful, green lawn into a wasteland of dead turf. But your property doesn't have to be the next victim of lawn disease. At Weedex Lawn Care, we provide professional lawn disease control treatments to residents in Dallas, Fort Worth, Arlington, TX, and surrounding areas.",
                      price:1,
                      serviceType: .lawnDisease,
                      backgroundImages: "sun2"),
            
            Framework(name: "Lawn Insect",
                      imageName: "inse",
                      urlString: "https://weedexlawn.com/lawn-insect-control",
                      description: "Neither you nor your lawn wants to deal with lawn insects; they're a pain to get rid of and can cause damage to your turf. However, hope is not lost - we're here to help eliminate these pesky insects with our lawn insect control service, which we offer to property owners in and around Dallas, TX, including Fort Worth and Arlington. We'll apply our curative treatments to eliminate an infestation, the most common ones we target being chinch bugs and bermudagrass mites. While these treatments are highly effective, they don't repair the damage your lawn sustained; you can help your turf recover and even help prevent a future infestation with various lawn care services, including fertilization and aeration.",
                      price: 0,
                      serviceType: .insectControl,
                      backgroundImages: "sun2"),
            
            Framework(name: "Fire Ants",
                      imageName: "fires",
                      urlString: "https://weedexlawn.com/lawn-insect-control/fire-ant-control/",
                      description: "Though tiny, fire ants live up to their name and pack a fiery bite. However, we can eliminate fire ants from your property with our fire ant control treatment! At Weedex Lawn Care, we use a highly effective granular product specially made for a broadcast application, meaning we'll spread it over your entire lawn to ensure that fire ants have nowhere to hide on your property. This treatment will actively control the population over an extended amount of time; only one application will protect you from fire ants for an entire year! Gone are the days of looking where you're walking to avoid stepping on a mound!",
                      price:1,
                      serviceType: .insectControl,
                      backgroundImages: "sun2"),
            
            Framework(name: "Grub Control",
                      imageName: "grubs",
                      urlString: "https://weedexlawn.com/lawn-insect-control/grub-control",
                      description: "Has your lawn been overtaken by grubs? Grubs are white, C-shaped beetle larvae that live in your soil and feed on the roots of your grass. In Texas, grubs are most active in the late summer to early fall and can cause extensive damage to your turf. At Weedex Lawn Care, we offer both preventative and curative grub control treatments to protect your residential property from grubs. Our preventative treatments stop grubs from ever injuring your lawn, while our curative treatments eliminate grubs once they have caused damage.",
                      price:1,
                      serviceType: .insectControl,
                      backgroundImages: "sun2"),
            
            Framework(name: "Soil Care",
                      imageName: "soils",
                      urlString: "https://weedexlawn.com/soil-care-program",
                      description: "Drought is a common environmental condition in our area, and while it's inevitable, it can stress out your lawn and cause it to struggle. However, hope is not lost - we can improve the quality of your soil and help it combat drought stress with our soil care program! Our program includes four highly effective soil care treatments throughout the year, which contains a combination of four different products that increase your turf's water retention, extend the nutritional value of fertilization, and combat negative stressors - including drought. With these treatments, you'll notice a vast improvement in your lawn's health and its ability to withstand even the harshest environmental conditions.",
                      price:1,
                      serviceType: .lawnHealth,
                      backgroundImages: "sun2"),
            
            Framework(name: "Brown Patch",
                      imageName: "browns",
                      urlString: "https://weedexlawn.com/lawn-disease-control/brown-patch-control",
                      description: "Brown patch is a lawn disease that commonly affects lawns in Texas. This disease presents itself as brown, circular patches in your turf, and it can cause significant damage to your lawn if not dealt with. At Weedex Lawn Care, we offer a brown patch control service that is designed to protect your turf from this lawn disease. We offer preventative treatments to help prevent this disease from infecting your lawn in the first place, and curative treatments to eliminate existing infections. What's more, we can also help your lawn recover from brown patch and build up its resistance to this disease in the future with our lawn care services.",
                      price:1,
                      serviceType: .lawnDisease,
                      backgroundImages: "sun2"),
            
            Framework(name: "Take-All Rot",
                      imageName: "takes",
                      urlString: "https://weedexlawn.com/lawn-disease-control/take-all-root-rot-control/",
                      description: "Take-all root rot is a lawn disease that commonly affects lawns here in Texas. This disease can cause serious damage to your turf if left untreated, which is where we come in! At Weedex Lawn Care, we offer both preventative and curative take-all root rot treatments so you can get ahead of this lawn disease before it gets a foothold on your property or eliminate an existing infestation. We offer our preventative treatments in spring and early fall, as these are the best times to get ahead of this disease, and our curative treatments can be scheduled any time they are needed! What's more, our take-all root rot control treatments are also effective against a variety of other lawn diseases like brown patch, gray leaf spot, and dollar spot.",
                      price:1,
                      serviceType: .lawnDisease,
                      backgroundImages: "sun2"),
            
            Framework(name: "Gray Leaf Spot",
                      imageName: "grays",
                      urlString: "https://weedexlawn.com/lawn-disease-control/gray-leaf-spot-control/",
                      description: "Gray leaf spot is a lawn disease that commonly affects lawns in Texas. If it infects your turf, it can cause serious damage to your grass, and possibly even kill it if the infection is severe enough. At Weedex Lawn Care, we can help protect your turf from this lawn disease via our gray leaf spot control service. We offer both preventative and curative gray leaf spot control treatments, so we can tackle this disease from every angle. The fungicide we use for this service is also effective against various other lawn diseases like brown patch, dollar spot, and take-all root rot. If this disease causes damage to your lawn, we can help nurse it back to health with our various lawn care services.",
                      price:1,
                      serviceType: .lawnDisease,
                      backgroundImages: "sun2"),
        ]
        
    }
    



