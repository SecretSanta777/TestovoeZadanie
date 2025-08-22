import Foundation

class HomeViewModel: ObservableObject {
    var networkManager: NetworkManager = NetworkManager()
    @Published var doctors: DataUsers?
    //@Published var originalDoctors: DataUsers?
    @Published var searchText: String = ""
    
    @Published var currentSort: SortType = .none
    @Published var isAscending: Bool = false
    
    enum SortType {
        case price, rating, experience, none
    }
    
    func getDoctors() {
        let loadedDoctors = networkManager.loadJSONFromBundle("test", as: DataUsers.self)
        self.doctors = loadedDoctors
        //self.originalDoctors = loadedDoctors
    }
    
    var filterDoctors: [Doctor] {
        guard let allDoctors = doctors?.data?.users else { return [] }
        if searchText.isEmpty {
            return allDoctors
        } else {
            return allDoctors.filter { doctor in
                let fullName = "\(doctor.firstName ?? "") \(doctor.lastName ?? "") \(doctor.patronymic ?? "")"
                                    .lowercased()
                                    .trimmingCharacters(in: .whitespaces)
                return fullName.contains(searchText.lowercased())
            }
        }
    }
    
    func sortDoctors(by type: SortType) {
        var users = filterDoctors
        
        if currentSort == type {
            isAscending.toggle()
        } else {
            currentSort = type
            isAscending = false
        }
        
        switch type {
        case .price:
            users.sort {
                let price1 = [($0.homePrice ?? 0), ($0.textChatPrice ?? 0), ($0.videoChatPrice ?? 0)].filter { $0 > 0 }.min() ?? 0
                let price2 = [($1.homePrice ?? 0), ($1.textChatPrice ?? 0), ($1.videoChatPrice ?? 0)].filter { $0 > 0 }.min() ?? 0
                return isAscending ? price1 < price2 : price1 > price2
            }
            
        case .rating:
            users.sort {
                let rank1 = $0.rank ?? 0
                let rank2 = $1.rank ?? 0
                return isAscending ? rank1 < rank2 : rank1 > rank2
            }
            
        case .experience:
            users.sort {
                let exp1 = $0.seniority ?? 0
                let exp2 = $1.seniority ?? 0
                return isAscending ? exp1 < exp2 : exp1 > exp2
            }
            
        case .none:
            print("123")
//            if let originalUsers = originalDoctors?.data?.users {
//                users = originalUsers
//            }
        }
        
        doctors?.data?.users = users
    }
    
    func sortIcon(for type: SortType) -> String {
        guard currentSort == type else { return "" }
        return isAscending ? "arrow.up" : "arrow.down"
    }
}
