import SwiftUI

struct CardView: View {
    @State var isLike: Bool = false
    @Binding var path: [SelectPage]
    var doctor: Doctor
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                HStack(alignment: .top, spacing: 10) {
                    if doctor.avatar != nil {
                        AsyncImage(url: URL(string: doctor.avatar ?? ""))
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading,spacing: 5) {
                            Text(doctor.lastName ?? "")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(.black)
                            Text(doctor.firstName ?? "")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(.black) + Text(" ") + Text(doctor.patronymic ?? "")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundStyle(.black)
                        }
                        HStack {
                            ForEach(Array(Array(0...4).enumerated()), id: \.offset) { index, _ in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(index <= doctor.rank ?? 0 ? .myPink : .gray)
                            }
                        }
                        
                        if doctor.specialization?.first?.name != nil {
                            Text("\(doctor.specialization!.first!.name!) ")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.gray) + Text("10 лет ")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.gray)
                        }
                        Text("от 600 ₽")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.black)
                    }
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        isLike.toggle()
                    }
                } label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(isLike ? .myPink : .white)
                        .overlay {
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(isLike ? .myPink : .gray)
                        }
                }
            }
            .padding(15)
            
            Button {
                path.append(.detail(doctor))
            } label: {
                Text(doctor.rank ?? 0 > 2 ? "Записаться" : "Нет свободного расписания") // Условия про расписание к сожалению нету
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(doctor.rank ?? 0 > 2 ? .white : .black)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 47)
            .background(doctor.rank ?? 0 > 2 ? .myPink : .appGray)
            .cornerRadius(8)
            .disabled(doctor.rank ?? 0 <= 2)
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
        }
        .background(.white)
        .cornerRadius(8)
    }
}

#Preview {
  
}
