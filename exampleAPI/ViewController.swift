////
////  ViewController.swift
////  앱개발 숙련 개인과제
////
////  Created by t2023-m0078 on 2023/08/28.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//    var user:FifaUser?
//    var userDeal:FifaDeal?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        URLManager.shared.getJsonData(name:"wurihyung") {result in
//            switch result {
//            case .success(let data):
//                print("suc")
//                self.user = try? JSONDecoder().decode(FifaUser.self, from: data)
//                self.user?.show()
//            case .failure(let error):
//                print("fail",error)
//            }
//        }
//        
//    }
//    
//    @IBAction func btnclk(_ sender: Any) {
//        URLManager.shared.getJsonDataDeal(id: user?.accessId ?? "") {result in
//            switch result {
//            case .success(let data):
//                self.userDeal = try? JSONDecoder().decode(FifaDeal.self, from: data)
//                var num:Int = 0
//                for i in self.userDeal! {
//                    
//                    num += i.value
//                }
//                print("최근 거래내역 100건 구입 총 BP : ",num/100000000,"억")
//                
//            case .failure(let error):
//                print("fail",error)
//            }
//        }
//    }
//    
//}
//    
//    
//struct FifaUser:Decodable{
//    let accessId:String
//    let nickname:String
//    let level:Int
//    
//    func show(){
//        print(accessId,nickname,level)
//    }
//}
//
//struct FifaDealElement: Decodable {
//    let tradeDate, saleSn: String
//    let spid, grade, value: Int
//    func show(){
//        print(tradeDate,saleSn,spid,grade,value)
//    }
//}
//
//typealias FifaDeal = [FifaDealElement]
