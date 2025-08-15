import SwiftUI

struct MyButton: View {
    @Binding var path: String
    var image: String
    var text: String
    var body: some View {
        Button {
            path = image
        } label: {
            VStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(path == image ? .pink : .gray)
                Text(text)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
            }
        }
    }
}
