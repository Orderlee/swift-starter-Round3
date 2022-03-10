enum Coffee {
    case americano
    case latte
    case cappuccino
    case coldBrew
}

class Person {
    var money: Int
    var feeling: String?
    let name: String
    
    func buyCoffee(_ coffee: Coffee) {
        print("안녕하세요. \(coffee) 한 잔 주시겠어요?")
    }
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money  
    }
}

class CoffeeShop {
    var sales: Int = 0
    var pickUpTable: Coffee? = nil {
        didSet {
             guard let pickuptable = pickUpTable, let name = self.customer?.name else { return }
             print("\(name)님의 \(pickuptable)가 준비되었습니다. 픽업대에서 가져가주세요.")
         }
     }
    var menu : [Coffee: Int] = [.americano: 1500, .latte: 3000, .cappuccino: 3500, .coldBrew: 4000]
    var barista: Person
    var customer: Person?
    
    func orderCoffee(_ coffee: Coffee) {
        print("\(coffee) 주문 받았습니다.")
        
        if coffee == .americano {
            print("주문하신 \(coffee)는 5분 후에 나옵니다.")
        } else {
            print("주문하신 \(coffee)는 10분 후에 나옵니다.")
        }
    }
    
    func makeCoffee(_ coffee: Coffee) {
        if coffee == .americano {
            print("제조중 :: 컵에 얼음과 물을 가득 담은 후 샷 부어주기")
        } else if coffee == .latte {
            print("제조중 :: 컵에 얼음과 우유를 가득 담은 후 샷 부어주기")
        } else if coffee == .cappuccino {
            print("제조중 :: 컵에 얼음과 우유를 2/3 담은 후 거품을 올리고 샷 부어주기")
        } else {
            print("제조중 :: 컵에 얼음을 가득 담고 콜드브루 원액을 부어주기")
        }
    }
    
    func pickUp(by customer: Person, coffee: Coffee) {
        yagombucks.customer = customer
        yagombucks.pickUpTable = coffee
    }
    
    init(sales: Int, barista: Person, pickUpTable: Coffee?) {
        self.sales = sales
        self.barista = barista
        self.pickUpTable = pickUpTable
    }
}

func hasAsset(of customer: Person, for coffee: Coffee) -> Bool {
    if let assetOfYagombucks = yagombucks.menu[coffee] {
        if customer.money < assetOfYagombucks {
            print("잔액이 \(assetOfYagombucks)원만큼 부족합니다.")
            return false
        } else {
            customer.money -= assetOfYagombucks
            yagombucks.sales += assetOfYagombucks
        }
    }
    return true
}
