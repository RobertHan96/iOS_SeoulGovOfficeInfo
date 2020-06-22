import UIKit

import Then
import SnapKit

class OfficeIntroViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstrains()
        
    }
    
    let ad = UIApplication.shared.delegate as? AppDelegate

    let officeTaskTable : UITableView = UITableView().then {
        $0.separatorStyle = .none
        $0.separatorInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        $0.backgroundColor = .groupTableViewBackground
        $0.allowsSelection = false
        $0.isScrollEnabled = false
        $0.register(UINib(nibName: "OfficeTaskTableViewCell", bundle: nil), forCellReuseIdentifier: "officeTaskItemCell")
    }
    let btnTitle = UIButton().then {
        $0.setTitle("officeIntroViewTitle".localized, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        $0.titleLabel?.adjustsFontSizeToFitWidth = true
        $0.setTitleColor(.black, for: .normal)
//        $0.layer.cornerRadius = 10
//        $0.backgroundColor = UIColor(displayP3Red: 93, green: 81, blue: 81, alpha: 1)
//        $0.layer.borderWidth = 1.0
//        $0.layer.borderColor = UIColor.darkGray.cgColor
//        $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ad?.officeID == 1 {
            return DatafetchManager.shared.guItems.count
        } else {
            return DatafetchManager.shared.taxItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let officeTaskCell = tableView.dequeueReusableCell(withIdentifier: "officeTaskItemCell", for: indexPath) as? OfficeTaskTableViewCell else {return UITableViewCell()}
        officeTaskCell.backgroundColor = .groupTableViewBackground
        if ad?.officeID == 1 {
            officeTaskCell.labelOfficeTask.text = DatafetchManager.shared.guItems[indexPath.row]
        } else {
            officeTaskCell.labelOfficeTask.text = DatafetchManager.shared.taxItems[indexPath.row]
        }
        return officeTaskCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }

    func setupUI() {
        view.backgroundColor = .groupTableViewBackground
        view.addSubview(btnTitle)
        view.addSubview(officeTaskTable)
        officeTaskTable.delegate = self
        officeTaskTable.dataSource = self
    }
    
    func makeConstrains()  {
        btnTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(30)
            make.right.lessThanOrEqualTo(self.view.safeAreaLayoutGuide.snp.right).offset(-30)
        }
        
        officeTaskTable.snp.makeConstraints { (make) in
            make.top.equalTo(btnTitle.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(50)
        }
    }

}
