import SwiftUI

struct HeaderButtonView: View {
    var text: String
    @Binding var categoryBtn: CategoryBtn
    var category: CategoryBtn
    var body: some View {
        Button {
            withAnimation {
                categoryBtn = category
            }
        } label: {
            HStack() {
                Text(text)
                    .font(.system(size: 14))
                    .foregroundStyle(categoryBtn == category ? .white : .gray)
                    .fixedSize()
                if categoryBtn == category {
                    Image(systemName: "arrow.down")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 5, height: 10)
                        .foregroundStyle(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(minHeight: 30)
            .padding(.horizontal, 15)
            .padding(.vertical, 3)
            .background(categoryBtn == category ? .myPink : .white)
        }
    }
}
