import SwiftUI

struct MainView: View {
    @State var selectedTab: String = "house.fill"
    @Binding var path: [SelectPage]
    let items: [(icon: String, title: String)] = [
        ("house.fill", "Главная"),
        ("calendar", "Приёмы"),
        ("message.fill", "Чат"),
        ("person.fill", "Профиль")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView(path: $path)
                    .tag("house.fill")
                Text("Text1")
                    .tag("calendar")
                Text("Text2")
                    .tag("message.fill")
                Text("Text3")
                    .tag("person.fill")
            }
            .toolbar(.hidden, for: .tabBar)
            
            HStack(spacing: 50) {
                ForEach(items, id: \.icon) { item in
                    MyButton(path: $selectedTab, image: item.icon, text: item.title)
                }

            }
            .padding(.top, 20)
            .frame(maxWidth: .infinity)
            .background(.white)
        }
    }
}

