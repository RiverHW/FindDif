import UIKit
import StoreKit
import AudioToolbox

private let reuseIdentifier = "XXXCollectionViewCell"


class FirstViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    

    var xxxdataRandomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()

        view.addSubview(mainCollectionView)
        
        self.mainCollectionView.backgroundColor = .black
        
    }
    
    
    // MARK: - Netdata
    
    func loadData() {
        
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            xxxspace = 100.1
            xxxspaceOther = 100.1
            mainCollectionView.isScrollEnabled = false
        }
        
        itemColor = self.randomColor()
        itemIndex = self.randomIndex()
        xxxdataRandomNumber = Int(arc4random() % UInt32(xxxdataArray.count))
        
        mainCollectionView.reloadData()
    }
    
    var xxxspace = 5.1
    var number = 2
    let xxxnumberOther = 3
    
    // MARK: - collectionview
    
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collview = UICollectionView.init(frame: view.bounds, collectionViewLayout: layout)
        collview.delegate = self
        collview.dataSource = self
        collview.backgroundColor = .systemGray6
        collview.register(UINib(nibName: "XXXCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
        return collview
        
    }()
    
    
  
    var xxxspaceOther = 30.0
    var xxxmarkText = ""
    
    let xxxdataArray = [["3","8"],["未","末"],["a","s"],["人","入"],["人","入"],["孑","孓"],["巳","己"],["弋","戈"],["乜","也"],["艮","良"],["茶","荼"],["芊","竿"],["春","眷"],["一","二"],["崇","祟"],["即","既"],["0","o"],["汩","汨"],["汆","氽"],["戍","戌"],["口","囗"],["鹜","骛"],["垚","壵"],["妹","妺"],["E","e"],["M","m"],["p","β"],["a","α"],["1","2"]] as! [Any]
       
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if (section == 0){
            return number*number
        }else if section == 1{
            return xxxnumberOther
        }else if section == 2{
            return 1
        }
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        
        return 3
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! XXXCollectionViewCell
        cell.L.textAlignment = .center
        cell.L.textColor = .black
        cell.L.adjustsFontSizeToFitWidth = true

        if indexPath.section == 0{
            NSLog("%ld", xxxdataRandomNumber)
            
            let array = xxxdataArray[xxxdataRandomNumber] as! NSArray

            if indexPath.row == itemIndex {
                cell.L.text = array[0] as? String
                xxxmarkText = (array[0] as? String)!
            }else{
                cell.L.text = array[1] as? String
            }
            UIView.animate(withDuration: 0.5) {
                cell.transform = CGAffineTransform.init(scaleX: 0.92, y: 0.92)
            }
            
            
            
            cell.backgroundColor = .white
            cell.L.alpha = 0.81
            cell.layer.cornerRadius = 10
        }else if indexPath.section == 1{
            cell.backgroundColor = .systemGray5
            cell.layer.cornerRadius = 10
            if indexPath.row == 0{
                
                cell.L.text = "重新开始"
            }else if indexPath.row == 2{
                cell.L.text = "赞"
               
            }else if indexPath.row == 3{
                
                cell.L.text = xxxmarkText
                cell.L.textColor = .orange
                cell.L.font = UIFont.systemFont(ofSize: 35, weight: .bold)
            }else if indexPath.row == 1{
                cell.L.text = String.init(format: "当前关卡\n%ld", number - 1)

            }
            
        }else if indexPath.section == 2{
            let array = xxxdataArray[xxxdataRandomNumber] as! NSArray
            cell.L.textColor = .white
            cell.backgroundColor = .clear
            cell.L.text = String.init(format: "%@", array[0] as! String)
            cell.L.backgroundColor = .clear
        }
        
        
        return cell
    }
    
    
    
    
    // MARK: - UICollectionViewFlowLayout
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if section == 0 {
            return xxxspace
        }else{
            return xxxspaceOther
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return xxxspace
        }else{
            return xxxspaceOther
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize.init(width: (Int(view.bounds.width) - Int(xxxspace)*(number + 2))/number, height: (Int(view.bounds.width) - Int(xxxspace)*(number + 2))/number)

        }else if indexPath.section == 1{
            return CGSize.init(width: (Int(view.bounds.width) - Int(xxxspaceOther)*(xxxnumberOther + 2))/xxxnumberOther, height: (Int(view.bounds.width) - Int(xxxspaceOther)*(xxxnumberOther + 2))/xxxnumberOther)
        }else{
            return CGSize.init(width: view.bounds.size.width - 19.5, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        if section == 0 {
            return UIEdgeInsets.init(top: 50, left: xxxspace, bottom: xxxspace, right: xxxspace)
        }else if section == 1{
            return UIEdgeInsets.init(top: 50, left: xxxspaceOther, bottom: 10, right: xxxspaceOther)
        }else{
            return UIEdgeInsets.init(top: 10, left: xxxspaceOther, bottom: 10, right: xxxspaceOther)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if indexPath.row == itemIndex {
                number = number + 1
                
                let generator = UIImpactFeedbackGenerator(style: .light)
                   generator.impactOccurred()
//                AudioServicesPlaySystemSound(1519)
                self.loadData()
            }else{
                
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                   generator.impactOccurred()
                
                
                let defeat = "挑战失败"
                let level = "当前分数 : %ld"
                let restart =  "重新开始"
                

                
                
                let alertController = UIAlertController.init(title: defeat, message: String.init(format: level, number), preferredStyle: .alert)
//                let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
                        let okAction = UIAlertAction(title: restart, style: .default, handler: {
                            action in
                            self.number = 2
                            self.loadData()
                        })
//                alertController.addAction(cancelAction)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }else if indexPath.section == 1{
            if indexPath.row == 0 {
                number = 2
                self.loadData()
            }else if indexPath.row == 1{
                
            }else if indexPath.row == 2{
                SKStoreReviewController .requestReview()
            }
        }else{
            
        }
    }
    

    
    var itemIndex = 0
    func randomIndex() -> Int{
        let random = arc4random() % UInt32(number*number)
        return Int(random)
    }
    
    
    
    func randomColor() -> UIColor {
        let color = UIColor.init(red: randomNumber()/255.0, green: randomNumber()/255.0, blue: randomNumber()/255.0, alpha: 1)
        return color
    }
    
    var itemColor = UIColor.init()
    func randomNumber() -> CGFloat{
        let random = arc4random() % 100 + 150
        return CGFloat(random)
    }


}

