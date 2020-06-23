import UIKit
import Then
import FirebaseAnalytics
import SnapKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    let mainTitleImg = UIImageView().then {
        let userLanguage = Locale.current.languageCode
        if userLanguage == "ko" { $0.image = UIImage(named: "office_main_img_kr") }
        else { $0.image = UIImage(named: "office_main_img_en") }
    }
    let headerIcon = UIImageView().then {
        $0.image = UIImage(named: "korea")
        $0.layer.backgroundColor = UIColor(red: 236/255, green: 184/255, blue: 140/255, alpha: 1.0).cgColor
    }
    let mainTitile = UILabel().then {
        var titleFontSize = 24
        if UIDevice.current.userInterfaceIdiom == .pad { titleFontSize = 40 }
        $0.text = "mainViewTitle".localized
        $0.font = UIFont.boldSystemFont(ofSize: CGFloat(titleFontSize))
        $0.textAlignment = .center
        $0.textColor = .black
        $0.layer.backgroundColor = UIColor(red: 236/255, green: 184/255, blue: 140/255, alpha: 1.0).cgColor
        $0.adjustsFontSizeToFitWidth = true
    }
    let btnContainer = UIView().then {
        $0.backgroundColor = .clear
    }
    let btnGotoTaxOffice = UIButton().then {
        $0.setImage(UIImage(named: "taxoffice_list"), for: .normal)
    }
    let taxofficeListCaption = UILabel().then {
        $0.text = "taxOfficeListBtnTitle".localized
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 14)

    }
    let taxofficeTaskCaption = UILabel().then {
        $0.text = "taxOfficeIntroBtnTitle".localized
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 14)

    }
    let guofficeListCaption = UILabel().then {
        $0.text = "guOfficeListBtnTitle".localized
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 14)

    }
    let guofficeTaskCaption = UILabel().then {
        $0.text = "guOfficeIntroBtnTitle".localized
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 14)
    }

    let btnGotoGuOffice = UIButton().then {
        $0.setImage(UIImage(named: "gu_office_list"), for: .normal)
    }
    let btnGotoTaxOfficeIntro = UIButton().then {
        $0.setImage(UIImage(named: "taxoffice_task"), for: .normal)
    }
    let btnGotoGuOfficeIntro = UIButton().then {
        $0.setImage(UIImage(named: "gu_office_task"), for: .normal)
//        $0.layer.cornerRadius = 10
//        $0.layer.borderWidth = 1.0
//        $0.layer.borderColor = UIColor.darkGray.cgColor
//        $0.contentEdgeInsets.left = 10
//        $0.contentEdgeInsets.right = 10
    }
    let contactLabel = PaddingLabel(withInsets: 0, 0, 10, 0).then {
        $0.text = "contact".localized
        $0.backgroundColor = .darkGray
        $0.textColor = .white
        $0.numberOfLines = 2
    }
    
    @objc func gotoInfoView(_ sender : UIButton!) {

        if sender == btnGotoGuOfficeIntro {
            let officeTaskVC = OfficeIntroViewController()
            ad?.officeID = 1
            logSelectedItem(item: "구청업무조회")
            self.navigationController?.pushViewController(officeTaskVC, animated: true)
        } else if sender == btnGotoTaxOfficeIntro {
            let officeTaskVC = OfficeIntroViewController()
            ad?.officeID = 2
            logSelectedItem(item: "세무서업무조회")
            self.navigationController?.pushViewController(officeTaskVC, animated: true)
        } else if sender == btnGotoGuOffice {
            let officeListVC = OfficeListViewController()
            ad?.officeID = 1
            logSelectedItem(item: "구청리스트조회")
            self.navigationController?.pushViewController(officeListVC, animated: true)
        } else if sender == btnGotoTaxOffice {
            let officeListVC = OfficeListViewController()
            ad?.officeID = 2
            logSelectedItem(item: "세무서리스트조회")
            self.navigationController?.pushViewController(officeListVC, animated: true)
        }
    }
            
}

