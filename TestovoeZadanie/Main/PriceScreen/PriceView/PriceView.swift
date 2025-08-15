import SwiftUI

struct PriceView: View {
    @Binding var path: [SelectPage]
    var doctor: Doctor
    var body: some View {
        VStack() {
            PriceMenu(doctor: doctor)
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 15)
        .background(.appGray)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    path.removeLast()
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 12, height: 20.5)
                        .foregroundStyle(.gray)
                }
            }
        }
        .navigationTitle("Стоимость услуг")
        .navigationBarBackButtonHidden()
    }
}

