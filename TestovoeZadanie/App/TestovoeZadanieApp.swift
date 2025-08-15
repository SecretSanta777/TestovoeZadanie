import SwiftUI

@main
struct TestovoeZadanieApp: App {
    @State var selectPage: [SelectPage] = []
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $selectPage) {
                MainView(path: $selectPage)
                    .navigationDestination(for: SelectPage.self) { page in
                        switch page {
                        case .detail(let data):
                            DetailView(dataFromHomeView: data, path: $selectPage)
                        case .price(let data):
                            PriceView(path: $selectPage, doctor: data)
                        }
                    }
            }
        }
    }
}

enum SelectPage: Hashable {
    case detail(Doctor)
    case price(Doctor)
}
