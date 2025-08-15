import SwiftUI

struct DetailViewHStackBtnAndText: View {
    var image: String
    var text: String
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray)
            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(.gray)
        }
    }
}
