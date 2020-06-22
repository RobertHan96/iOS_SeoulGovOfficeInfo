import UIKit

import Then
import FirebaseAnalytics
import SnapKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
    let ad = UIApplication.shared.delegate as? AppDelegate
    
    let mainTitleImg = UIImageView().then {
        $0.image = UIImage(named: "office")
    }
    let headerIcon = UIImageView().then {
        $0.image = UIImage(named: "korea")
        $0.layer.backgroundColor = UIColor(red: 236/255, green: 184/255, blue: 140/255, alpha: 1.0).cgColor
    }
    let mainTitile = UILabel().then {
        $0.text = "mainViewTitle".localized
        $0.font = UIFont.boldSystemFont(ofSize: 26)
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
//        $0.setTitle("guOfficeIntroBtnTitle".localized, for: .normal)
//        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
//        $0.titleLabel?.adjustsFontSizeToFitWidth = true
//        $0.setTitleColor(.lightGray, for: .normal)
//        $0.layer.cornerRadius = 10
//        $0.backgroundColor = .white
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
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 208/255, green: 201/255, blue: 201/255, alpha: 1.0)
        view.addSubview(mainTitleImg)
        view.addSubview(headerIcon)
        view.addSubview(mainTitile)
        view.addSubview(btnContainer)
        view.addSubview(btnGotoTaxOffice)
        btnGotoTaxOffice.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoGuOffice.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoGuOfficeIntro.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)
        btnGotoTaxOfficeIntro.addTarget(self, action: #selector(gotoInfoView(_:)), for: .touchUpInside)

        view.addSubview(btnGotoGuOffice)
        view.addSubview(btnGotoGuOfficeIntro)
        view.addSubview(btnGotoTaxOfficeIntro)
        view.addSubview(guofficeListCaption)
        view.addSubview(guofficeTaskCaption)
        view.addSubview(contactLabel)
        view.addSubview(taxofficeListCaption)
        view.addSubview(taxofficeTaskCaption)
    }
    
    func makeConstraints() {
        mainTitile.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.height.equalTo(view.layer.bounds.height/4-100)
            make.left.equalTo(headerIcon.snp.right).offset(0)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(0)
        }
        headerIcon.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.height.equalTo(view.layer.bounds.height/4-100)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(0)
            make.width.equalTo(view.layer.bounds.width/4)
        }
        mainTitleImg.snp.makeConstraints { (make) in
            make.top.equalTo(mainTitile.snp.bottom).offset(0)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(0)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(0)
            make.bottom.equalTo(self.btnContainer.snp.top).offset(-10)
            make.height.equalTo(self.view.layer.bounds.height/2-100)
        }

        btnContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(view.layer.bounds.height/2)
        }
        
        btnGotoTaxOffice.snp.makeConstraints { (make) in
            make.top.equalTo(btnContainer).offset(20)
            make.width.equalTo(75)
            make.height.equalTo(75)
            make.centerX.equalTo(taxofficeListCaption)
        }
        btnGotoTaxOfficeIntro.snp.makeConstraints { (make) in
            make.top.equalTo(btnContainer).offset(20)
            make.width.equalTo(75)
            make.height.equalTo(75)
            make.centerX.equalTo(taxofficeTaskCaption)
        }
        
        taxofficeListCaption.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoTaxOffice.snp.bottom).offset(5)
            make.left.equalTo(btnContainer).offset(0)
            make.height.equalTo(20)
            make.width.equalTo(btnContainer.snp.width).dividedBy(2)
        }
        taxofficeTaskCaption.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoTaxOfficeIntro.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(btnContainer.snp.width).dividedBy(2)
            make.left.equalTo(taxofficeListCaption.snp.right).offset(0)
            make.right.equalTo(btnContainer.snp.right).offset(-1)
        }

        btnGotoGuOffice.snp.makeConstraints { (make) in
            make.top.equalTo(taxofficeListCaption.snp.bottom).offset(30)
            make.centerX.equalTo(guofficeListCaption)
            make.width.equalTo(75)
            make.height.equalTo(75)

        }
        btnGotoGuOfficeIntro.snp.makeConstraints { (make) in
            make.top.equalTo(taxofficeTaskCaption.snp.bottom).offset(30)
            make.centerX.equalTo(guofficeTaskCaption)
            make.width.equalTo(75)
            make.height.equalTo(75)
        }
        
        guofficeListCaption.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoGuOffice.snp.bottom).offset(5)
            make.left.equalTo(btnContainer).offset(0)
            make.width.equalTo(btnContainer.snp.width).dividedBy(2)
            make.height.equalTo(20)
            make.bottom.equalTo(btnContainer.snp.bottom).offset(-20)
        }
        guofficeTaskCaption.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoGuOfficeIntro.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.width.equalTo(btnContainer.snp.width).dividedBy(2)
            make.left.equalTo(guofficeListCaption.snp.right).offset(0)
            make.right.equalTo(btnContainer.snp.right).offset(0)
            make.bottom.equalTo(btnContainer.snp.bottom).offset(-20)
        }
        
        contactLabel.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.top.equalTo(btnContainer.snp.bottom).offset(10)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(0)
        }
    }

        
}

