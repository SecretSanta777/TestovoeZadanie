import SwiftUI

struct HeaderButtonView: View {
    var text: String
    @Binding var categoryBtn: CategoryBtn
    var category: CategoryBtn
    @State var changeList: Bool = false
    var body: some View {
        Button {
            withAnimation {
                categoryBtn = category
                changeList.toggle()
            }
        } label: {
            HStack() {
                Text(text)
                    .font(.system(size: 14))
                    .foregroundStyle(categoryBtn == category ? .white : .gray)
                    .fixedSize()
                if categoryBtn == category && !changeList {
                    Image(systemName: "arrow.down")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 5, height: 10)
                        .foregroundStyle(.white)
                } else if categoryBtn == category && changeList {
                    Image(systemName: "arrow.up")
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
