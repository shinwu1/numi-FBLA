import SwiftUI

struct BudgetView: View {
    @State private var month: String = "January"
    private let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
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
                        .onTapGesture {
                            moveToPreviousMonth()
                        }
                    
                    Spacer()
                    
                    Text("Budget")
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
                
                // Month Display
                VStack {
                    HStack {
                        Button(action: {
                            moveToPreviousMonth()
                        }) {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }
                        
                        Text("\(month)")
                            .font(.custom("OpenSauce-Regular", size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            moveToNextMonth()
                        }) {
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                        }
                    }
                    .padding(.top, 5)
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    // Functions to change the month
    private func moveToPreviousMonth() {
        if let currentIndex = months.firstIndex(of: month), currentIndex > 0 {
            month = months[currentIndex - 1]
        } else {
            month = months.last! // Wrap to December if it's January
        }
    }
    
    private func moveToNextMonth() {
        if let currentIndex = months.firstIndex(of: month), currentIndex < months.count - 1 {
            month = months[currentIndex + 1]
        } else {
            month = months.first! // Wrap to January if it's December
        }
    }
}

#Preview {
    BudgetView()
}
