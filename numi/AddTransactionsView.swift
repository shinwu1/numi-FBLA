import SwiftUI

struct AddTransactionsView: View {
    @State private var amount: String = ""
    @State private var memo: String = ""
    
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
                    
                    Text("$0 over budget")
                        .font(.custom("OpenSauce-Regular", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                        .foregroundColor(.white)
                        .padding(.trailing, 30)
                        .font(.system(size: 20))
                }
                .padding(.top)
                
                Text("$\(amount.isEmpty ? "0.00" : amount)")
                    .font(.custom("OpenSauce-Regular", size: 50))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 10)
                
                Text("Write a memo")
                    .font(.custom("OpenSauce-Regular", size: 18))
                    .foregroundColor(.white)
                
                Spacer()
                
                            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width, height: 630)
                    .padding(.horizontal, 20)
                    .overlay(
                        VStack {
                            HStack {
                                Spacer()
                                Text("Categories")
                                    .font(.custom("OpenSauce-Regular", size: 18))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 200)
                                
                                Button(action: {
                                    
                                    print("View All tapped")
                                }) {
                                    Text("View All")
                                        .font(.custom("OpenSauce-Regular", size: 16))
                                        .foregroundColor(.green)
                                        .padding(.trailing, 40)
                                }
                            }
                            .padding(.top, 40)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(["Groceries", "Eating Out", "Healthcare"], id: \.self) { category in
                                        Button(action: {
                                            
                                            print("\(category) tapped")
                                        }) {
                                            HStack {
                                                Image(systemName: "cart.fill")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 20, height: 40)
                                                    .foregroundColor(.black)
                                                
                                                Text(category)
                                                    .font(.custom("OpenSauce-Regular", size: 16))
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.horizontal, 30)
                                            .padding(.vertical, 10)
                                            .background(Color.white)
                                            .cornerRadius(20)
                                            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 3)
                                        }
                                    }
                                }
                                .padding(.horizontal, 10)
                                .frame(height: 85)
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 9)
                            Spacer().frame(height: 0)
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3), spacing: 10) {
                                    ForEach(["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "⌫"], id: \.self) { key in
                                        Button(action: {
                                            if key == "⌫" {
                                                if !amount.isEmpty { amount.removeLast() }
                                            } else {
                                                amount.append(key)
                                            }
                                        }) {
                                            Text(key)
                                                .font(.custom("OpenSauce-Regular", size: 32))
                                                .frame(width: 80, height: 80)
                                                .background(Color.white)
                                                .foregroundColor(.black)
                                                .cornerRadius(40)
                                                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
                                        }
                                    }
                                }
                                .frame(width: 350, height: 350)
                            }
                        }
                    )
            }




 //vstack



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
                .padding(.horizontal, 20)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    AddTransactionsView()
}
