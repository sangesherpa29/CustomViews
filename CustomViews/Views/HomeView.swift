//
//  HomeView.swift
//  CustomViews
//
//  Created by Web and App on 22/01/2024.
//

import SwiftUI

struct HomeView: View {
    @State var text: String = ""
    @State var isSelected: Bool = false
    
    var rentals: [RentalProperty] = [
        RentalProperty(name: "Dreamsville House", owner: "JL Sultan Iskandar", distance: "1.8", image: "house1"),
        RentalProperty(name: "Lost Lovers Bungalow", owner: "Priscilla Villanueva", distance: "2.1", image: "house2"),
        RentalProperty(name: "Elopers Haven", owner: "Mckenzie Payne", distance: "0.1", image: "house3"),
        RentalProperty(name: "Smiley Haven", owner: "Jamarion Dennis", distance: "4.1", image: "house4"),
        RentalProperty(name: "The Spell House", owner: "Remington Lopez", distance: "2.2", image: "house5"),
        RentalProperty(name: "Comfy Stables", owner: "Ashlynn Sanders", distance: "1.5", image: "house6")
    ]
    
    var images: [String] = ["house1", "house2", "house3", "house4", "house5", "house6"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                HStack {
                    VStack(alignment: .leading, spacing: 9) {
                        Text("Location")
                            .font(.raleway_regular(size: 13))
                        
                        Text("Kathmandu")
                            .font(.raleway_medium(size: 21))
                    }
                    
                    Spacer()
                    
                    Image("notification_icon")
                }
                
                // searching and filtering
                HStack(spacing: 10) {
                    ZStack {
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                            
                            TextField("Search address, or near you", text: $text)
                                .font(.raleway_regular(size: 13))
                        }
                        .foregroundStyle(Color(uiColor: .secondaryColor))
                    }
                    .padding()
                    .padding(.vertical, 3)
                    .background(Color(uiColor: .init(hexString: "#F7F7F7")).opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    ZStack {
                        Image("filter_icon")
                            .scaleEffect(CGSize(width: 1.2, height: 1.2), anchor: .center)
                    }
                    .padding()
                    .background(.cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                // Paging Filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10) { _ in
                            SingleFilterView(text: "House", isSelected: $isSelected)
                        }
                    }
                }
                .frame(height: 40)
                .scrollTargetBehavior(.viewAligned)
                .padding(.bottom, 10)
                
                
                // Destinations
                VStack(spacing: 22) {
                    HStack {
                        Text("Near from you")
                            .font(.raleway_medium(size: 17))
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("See more")
                                .font(.raleway_regular(size: 12))
                                .foregroundStyle(Color(uiColor: .secondaryColor))
                        })
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 25) {
                            ForEach(rentals, id: \.id) { rental in
                                SingleRentalProperty(title: rental.name,
                                                     owner: rental.owner,
                                                     distance: rental.distance,
                                                     image: rental.image)
                            }
                        }
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
                
                
                // Destinations
                VStack(spacing: 22) {
                    HStack {
                        Text("Best for you")
                            .font(.raleway_medium(size: 17))
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("See more")
                                .font(.raleway_regular(size: 12))
                                .foregroundStyle(Color(uiColor: .secondaryColor))
                        })
                    }
                    
                    ForEach(rentals, id: \.id) { rental in
                        SingleRentalListView(title: rental.name,
                                             owner: rental.owner,
                                             image: rental.image)
                    }
                }
                .padding(.top)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .padding(.vertical, 1)
    }
}

struct SingleFilterView: View {
    var text: String = "Test String"
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }, label: {
            Text(text)
                .font(.raleway_regular(size: 13))
                .foregroundStyle(isSelected ? .white: Color(uiColor: .init(hexString: "#858585")))
                .padding()
                .background(isSelected ? .cyan: Color(uiColor: .init(hexString: "#F7F7F7")).opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    HomeView()
}

struct SingleRentalProperty: View {
    var title: String = ""
    var owner: String = ""
    var distance: String = ""
    var image: String = ""
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
            
            RoundedRectangle(cornerRadius: 22)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0), .black.opacity(0), .black.opacity(0), .black.opacity(0.5), .black.opacity(0.7)]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                )
            
            HStack(spacing: 5) {
                Image("location_icon")
                Text("\(distance) km")
                    .font(.raleway_regular(size: 13))
            }
            .foregroundStyle(.white)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(.black.opacity(0.24))
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .offset(CGSize(width: 55.0, height: -96.0))
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.raleway_medium(size: 17))
                    Text(owner)
                        .font(.raleway_regular(size: 12))
                }
                
                Spacer()
            }
            .padding(.leading)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .offset(CGSize(width: 0.0, height: 90.0))
        }
        .frame(width: 230, height: 270)
        .background(.cyan)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}

struct RentalProperty {
    let id = UUID()
    let name: String
    let owner: String
    let distance: String
    let image: String
}


struct SingleRentalListView: View {
    var title: String = ""
    var owner: String = ""
    var distance: String = ""
    var image: String = ""
    
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack(alignment: .top, spacing: 20) {
                Image(image)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(owner)
                        .font(.raleway_medium(size: 17))
                    
                    Text("Rs. 5,00,000 / Year")
                        .font(.raleway_regular(size: 12))
                        .foregroundStyle(Color(uiColor: .init(hexString: "#0A8ED9")))
                    
                    HStack(spacing: 12) {
                        HStack {
                            Image("bed_icon")
                            Text("6 bedrooms")
                                .font(.raleway_regular(size: 12))
                        }
                        HStack {
                            Image("shower_icon")
                            Text("5 showers")
                                .font(.raleway_regular(size: 12))
                        }
                    }
                }
                
                Spacer()
            }
        })
        .foregroundStyle(.black)
        .padding(.vertical, 5)
    }
}
