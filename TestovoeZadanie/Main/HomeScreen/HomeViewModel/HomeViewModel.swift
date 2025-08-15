import Foundation

class HomeViewModel: ObservableObject {
    var networkManager: NetworkManager = NetworkManager()
    @Published var doctors: DataUsers?
    func getDoctors() {
        self.doctors = networkManager.loadJSONFromBundle("test", as: DataUsers.self)
    }
}


