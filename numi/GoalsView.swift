import SwiftUI

struct GoalsView: View {
    
    var body: some View {
        ZStack {
            Color(red: 57/255, green: 121/255, blue: 47/255)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                    Text("Goals")
                        .font(.custom("OpenSauce-Regular", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                        .font(.system(size: 20))
                }
                .padding(.top, -15)
                
                HStack {
                    Text("Total Savings:")
                        .font(.custom("OpenSauce-Regular", size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .padding(.leading, 30)
                    Spacer()
                }
                .padding(.top, 20)
                
                
                Spacer()
            }
            .padding()
            
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width, height: 550)
                    .padding(.horizontal, 20)
                    .overlay(
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Filters")
                                    .font(.custom("OpenSauce-Regular", size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.leading, 10)
                                
                                Text("View All")
                                    .font(.custom("OpenSauce-Regular", size: 18))
                                    .foregroundColor(Color(red: 115/255, green: 203/255, blue: 102/255))
                                    .padding(.leading, 225)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                            .padding(.top, 10)
                            .padding(.bottom, 15)
                            
                            ScrollView {
                                VStack(spacing: 20) {
                                    ForEach(1...20, id: \.self) { item in
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.gray, lineWidth: 1)
                                            .background(Color.white.cornerRadius(15))
                                            .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
                                            .frame(width: UIScreen.main.bounds.width - 30, height: 80)
                                            .overlay(
                                                HStack {
                                                    Text("Transaction \(item)")
                                                        .foregroundColor(.black)
                                                        .font(.custom("OpenSauce-Regular", size: 16))
                                                        .padding(.leading, 15)
                                                    Spacer()
                                                    Text("$\(Double(item) * 5, specifier: "%.2f")")
                                                        .foregroundColor(.black)
                                                        .font(.custom("OpenSauce-Regular", size: 16))
                                                        .padding(.trailing, 15)
                                                }
                                            )
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    Spacer().frame(height: 50)
                                }
                                .padding(.top, 5)
                            }
                            .frame(height: 450)
                        }
                    )
            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = scene.windows.first {
                            window.rootViewController = UIHostingController(rootView: ContentView())
                            window.makeKeyAndVisible()
                        }
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
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                           let window = scene.windows.first {
                            window.rootViewController = UIHostingController(rootView: AddTransactionsView())
                            window.makeKeyAndVisible()
                        }
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
                    
                    Button {
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
                    
                    Button {
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
                .padding(.horizontal, 20)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}


#Preview {
    GoalsView()
}
