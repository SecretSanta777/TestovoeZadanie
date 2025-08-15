import SwiftUI

struct HeaderView: View {
    var textBtn: [String] = ["По цене","По стажу","По рейтингу"]
    @State var category: CategoryBtn = .none
    
    @State var searchText: String = ""
    var body: some View {
        VStack(spacing: 15) {
            Text("Педиатры")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.black)
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray)
                }
                .padding(.leading, 10)
                
                TextField("Поиск", text: $searchText)
            }
            .frame(height: 36)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 20)
            
            
            HStack(spacing: 0) {
                ForEach(CategoryBtn.allCases.dropLast(), id: \.self) { item in
                    HeaderButtonView(text: item.rawValue, categoryBtn: $category, category: item)
                    if item != CategoryBtn.allCases.dropLast().last {
                        Divider()
                            .frame(height: 30)
                    }
                }
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal, 20)

            
        }
        .frame(maxWidth: .infinity)
        .background(.appGray)
        .zIndex(1)
    }
}
