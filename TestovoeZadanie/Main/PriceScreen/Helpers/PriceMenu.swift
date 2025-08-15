import SwiftUI

struct PriceMenu: View {
    var doctor: Doctor
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading) {
                Text("Видеоконсультация")
                    .font(.system(size: 16, weight: .bold))
                HStack {
                    Text("30 мин")
                        .font(.system(size: 16))
                        .padding(.leading, 10)
                    Spacer()
                    Text("\(doctor.video_chat_price ?? 0) ₽")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.trailing, 10)
                    
                }
                .frame(height: 56)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            VStack(alignment: .leading) {
                Text("Чат с врачом")
                    .font(.system(size: 16, weight: .bold))
                HStack {
                    Text("30 мин")
                        .font(.system(size: 16))
                        .padding(.leading, 10)
                    Spacer()
                    Text("\(doctor.text_chat_price ?? 0) ₽")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.trailing, 10)
                    
                }
                .frame(height: 56)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            VStack(alignment: .leading) {
                Text("Приём в клинике")
                    .font(.system(size: 16, weight: .bold))
                HStack {
                    Text("В клинике")
                        .font(.system(size: 16))
                        .padding(.leading, 10)
                    Spacer()
                    Text("\(doctor.home_price ?? 0) ₽")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.trailing, 10)
                }
                .frame(height: 56)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}
