import SwiftUI

struct DetailView: View {
    var dataFromHomeView: Doctor
    @Binding var path: [SelectPage]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 15) {
                if dataFromHomeView.avatar != nil {
                    AsyncImage(url: URL(string: dataFromHomeView.avatar ?? ""))
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
                VStack(alignment: .leading) {
                    Text(dataFromHomeView.last_name ?? "")
                        .font(.system(size: 16, weight: .bold))
                    Text(dataFromHomeView.first_name ?? "").font(.system(size: 16, weight: .bold)) + Text(" ") + Text(dataFromHomeView.patronymic ?? "").font(.system(size: 16, weight: .bold))
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                DetailViewHStackBtnAndText(image: "gauge.with.needle", text: "Опыт работы: 27 лет")
                DetailViewHStackBtnAndText(image: "bag.fill", text: "Врач высшей категории")
                DetailViewHStackBtnAndText(image: "graduationcap", text: dataFromHomeView.specialization?.first?.name ?? "")
                DetailViewHStackBtnAndText(image: "drop", text: "Детская клиника РебёнОк")
            }
            
            HStack() {
                Text("Стоимость услуг")
                    .padding(.leading, 10)
                Spacer()
                Text("От 600 р")
                    .padding(.trailing, 15)
            }
            .font(.system(size: 16, weight: .bold))
            .frame(height: 60)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .background(.white)
            
            Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                .font(.system(size: 14))
            
            Spacer()
            
            Button {
                path.append(.price(dataFromHomeView))
            } label: {
                Text("Записаться")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
            }
            .frame(height: 56)
            .frame(maxWidth: .infinity)
            .background(.myPink)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.bottom, 10)
            
        }
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity)
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
            ToolbarItem(placement: .principal) {
                Text("Педиатр")
            }
        }
        .navigationBarBackButtonHidden()
    }
}


