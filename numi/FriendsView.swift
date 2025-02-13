import SwiftUI

struct FriendsView: View {
    @State private var month: String = "January"
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                    Text("Friends")
                        .font(.custom("OpenSauce-Regular", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                        .foregroundColor(.black)
                        .padding(.trailing, 10)
                        .font(.system(size: 20))
                }
                .padding(.top, -15)
                
                // Current Date
                HStack {
                    Text(getCurrentDate())
                        .font(.custom("OpenSauce-Regular", size: 20))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top, 10)
                
                // "Monthly Wrapped" Area
                VStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.1, green: 0.4, blue: 0.1),
                                    Color(red: 0.6, green: 0.8, blue: 0.5)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 375, height: 220)
                        .overlay(
                            VStack {
                                HStack {
                                    Text(month)
                                        .font(.custom("OpenSauce-Regular", size: 35))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.top, 20)
                                        .padding(.leading, -170)
                                }
                                
                                Spacer()
                                
                                Text("Monthly Wrapped")
                                    .font(.custom("OpenSauce-Regular", size: 20))
                                    .foregroundColor(.white)
                                    .padding(.top, -155)
                                    .padding(.leading, -170)
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                .padding(.top, 10)
                
                Spacer(minLength: 0) // Ensures content expands without pushing the navbar up
            }
            .padding()
            
            // Bottom Navigation Bar (Moved outside VStack to always stay at the bottom)
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        print("Home tapped") // Replace with navigation
                    } label: {
                        VStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.gray)
                            Text("Home")
                                .font(.custom("OpenSauce-Regular", size: 12))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        print("Budget tapped") // Replace with navigation
                    } label: {
                        VStack {
                            Image(systemName: "banknote.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.gray)
                            Text("Budget")
                                .font(.custom("OpenSauce-Regular", size: 12))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = scene.windows.first {
                            window.rootViewController = UIHostingController(rootView: AddTransactionsView())
                            window.makeKeyAndVisible()
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color(red: 57/255, green: 121/255, blue: 47/255))
                                .frame(width: 60, height: 60)
                                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                            
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    


                    Button { // STOP IT IM SCARED
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = scene.windows.first {
                            window.rootViewController = UIHostingController(rootView: GoalsView())
                            window.makeKeyAndVisible()
                        }
                    } label: {
                        VStack {
                            Image(systemName: "target")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.gray)
                            Text("Goals")
                                .font(.custom("OpenSauce-Regular", size: 12))
                                .foregroundColor(.gray)
                        }
                    }


                    
                    Spacer()
                    
                    Button { // STOP IT IM SCARED
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = scene.windows.first {
                            window.rootViewController = UIHostingController(rootView: FriendsView())
                            window.makeKeyAndVisible()
                        }
                    } label: {
                        VStack {
                            Image(systemName: "person.2.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.gray)
                            Text("Friends")
                                .font(.custom("OpenSauce-Regular", size: 12))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                }
                .frame(height: 80)
                .background(Color.white)
                .clipShape(Rectangle())
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -3)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }
    
    
    func navButton(icon: String, label: String) -> some View {
        Button {
            print("\(label) tapped") // Replace with navigation
        } label: {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.gray)
                
                Text(label)
                    .font(.custom("OpenSauce-Regular", size: 12))
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    FriendsView()
}
