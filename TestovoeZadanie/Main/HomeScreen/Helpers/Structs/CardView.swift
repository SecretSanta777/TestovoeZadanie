import SwiftUI

struct CardView: View {
    @State var isLike: Bool = false
    @Binding var path: [SelectPage]
    var doctor: Doctor
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                HStack(alignment: .top) {
                    HStack(alignment: .top, spacing: 10) {
                        if let avatar = doctor.avatar, let url = URL(string: avatar) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(doctor.lastName ?? "")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.black)
                                Text(doctor.firstName ?? "")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.black) +
                                Text(" ") +
                                Text(doctor.patronymic ?? "")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.black)
                            }
                            
                            HStack {
                                ForEach(0..<5, id: \.self) { index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 12, height: 12)
                                        .foregroundStyle(index < (doctor.rank ?? 0) ? .myPink : .gray)
                                }
                            }
                            
                            if let specialization = doctor.specialization?.first?.name {
                                Text("\(specialization) ")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.gray) +
                                Text("10 лет ")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.gray)
                            } else {
                                Text("Стажа нет")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.gray)
                            }
                            
                            Text(doctorMinPrice(doctor))
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Spacer()
                }
                .padding(15)
                
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            print("Тап по кнопке лайка")
                            withAnimation {
                                isLike.toggle()
                            }
                        } label: {
                            ZStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(isLike ? .myPink : .white)
                                
                                Image(systemName: "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(isLike ? .myPink : .gray)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .contentShape(Rectangle())
                        .frame(width: 44, height: 44)
                        .zIndex(999)
                        Spacer()
                    }
                }
                .padding(.trailing, 5)
                .padding(.top, 5)
            }
            
            Button {
                print("Тап по кнопке записи к доктору \(doctor.firstName ?? "")")
                path.append(.detail(doctor))
            } label: {
                Text(doctor.rank ?? 0 > 2 ? "Записаться" : "Нет свободного расписания")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(doctor.rank ?? 0 > 2 ? .white : .black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 47)
                    .contentShape(Rectangle())
            }
            .buttonStyle(PlainButtonStyle())
            .background(doctor.rank ?? 0 > 2 ? .myPink : .appGray)
            .cornerRadius(8)
            .disabled(doctor.rank ?? 0 <= 2)
            .frame(maxWidth: .infinity)
            .frame(height: 47)
            .contentShape(Rectangle())
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
        }
        .background(.white)
        .cornerRadius(8)
        .compositingGroup()
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
    func doctorMinPrice(_ doctor: Doctor) -> String {
        let prices = [doctor.homePrice, doctor.textChatPrice, doctor.videoChatPrice]
            .compactMap { $0 }
            .filter { $0 > 0 }
        
        if let minPrice = prices.min(), minPrice > 0 {
            return "от \(minPrice) ₽"
        } else {
            return "Цена не указана"
        }
    }
}

