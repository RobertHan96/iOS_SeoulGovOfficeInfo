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
    let mainTitile = UILabel().then {
        $0.text = "mainViewTitle".localized
        $0.font = UIFont.boldSystemFont(ofSize: 34)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.backgroundColor = .black
        $0.alpha = 0.8
        $0.adjustsFontSizeToFitWidth = true
    }
    let btnContainer = UIView()
    let btnGotoTaxOffice = UIButton().then {
        $0.setTitle("taxOfficeListBtnTitle".localized, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.lightGray, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets.left = 10
        $0.contentEdgeInsets.right = 10
    }
    let btnGotoGuOffice = UIButton().then {
        $0.setTitle("guOfficeListBtnTitle".localized, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.lightGray, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets.left = 10
        $0.contentEdgeInsets.right = 10
    }
    let btnGotoTaxOfficeIntro = UIButton().then {
        $0.setTitle("taxOfficeIntroBtnTitle".localized, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.lightGray, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets.left = 10
        $0.contentEdgeInsets.right = 10
    }
    let btnGotoGuOfficeIntro = UIButton().then {
        $0.setTitle("guOfficeIntroBtnTitle".localized, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.lightGray, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.darkGray.cgColor
        $0.contentEdgeInsets.left = 10
        $0.contentEdgeInsets.right = 10
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
        view.backgroundColor = .groupTableViewBackground
        view.addSubview(mainTitleImg)
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
        view.addSubview(contactLabel)
    }
    
    func makeConstraints() {
        mainTitleImg.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(0)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(0)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(0)
            make.bottom.equalTo(self.btnContainer.snp.top).offset(-10)
            make.height.equalTo(self.view.layer.bounds.height/2-100)
        }
        mainTitile.snp.makeConstraints { (make) in
            make.centerY.equalTo(mainTitleImg)
            make.height.equalTo(view.layer.bounds.height/4-100)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(0)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(0)
        }
        btnContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(view.layer.bounds.height/2)
        }
        btnGotoTaxOffice.snp.makeConstraints { (make) in
            make.top.equalTo(btnContainer)
            make.left.equalTo(btnContainer)
            make.right.equalTo(btnGotoTaxOfficeIntro.snp.left).offset(-10)
            make.width.equalTo(btnGotoTaxOfficeIntro.snp.width)
            make.height.equalTo(btnGotoGuOffice.snp.height)
        }
        btnGotoTaxOfficeIntro.snp.makeConstraints { (make) in
            make.top.equalTo(btnContainer)
            make.right.equalTo(btnContainer)
            make.width.equalTo(btnGotoTaxOffice.snp.width)
            make.height.equalTo(btnGotoGuOfficeIntro.snp.height)
        }
        btnGotoGuOffice.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoTaxOffice.snp.bottom).offset(10)
            make.bottom.equalTo(btnContainer)
            make.left.equalTo(btnContainer)
            make.right.equalTo(btnGotoGuOfficeIntro.snp.left).offset(-10)
            make.width.equalTo(btnGotoTaxOfficeIntro.snp.width)
            make.height.equalTo(btnGotoTaxOffice.snp.height)
        }
        btnGotoGuOfficeIntro.snp.makeConstraints { (make) in
            make.top.equalTo(btnGotoTaxOfficeIntro.snp.bottom).offset(10)
            make.bottom.equalTo(btnContainer)
            make.right.equalTo(btnContainer)
            make.width.equalTo(btnGotoGuOffice.snp.width)
            make.height.equalTo(btnGotoTaxOfficeIntro.snp.height)
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

