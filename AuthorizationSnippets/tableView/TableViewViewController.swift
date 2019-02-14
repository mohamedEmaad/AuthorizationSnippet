
//  TableViewViewController.swift
//  Makfy
//
//  Created by Mohamed Emad on 2/9/19.
//  Copyright © 2019 Baianat. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import NewBaseFrameWork


class TableViewViewController: ParentViewController {
    
    let dataView = BehaviorRelay(value:  [TableViewObject(image: #imageLiteral(resourceName: "userIcon"), name: "first", phone: "+201010101010"), TableViewObject(image: #imageLiteral(resourceName: "courierIcon"), name: "second", phone: "+2012222222"), TableViewObject(image: #imageLiteral(resourceName: "familyIcon"), name: "third", phone: "+2012233333")])
    
    // set sections for the tableview
    private lazy var sections = BehaviorRelay(value: [
        SectionOfCustomData( items: self.dataView.value)
    ])
    
    // the dispose bag for the observables
    let disposeBag = DisposeBag()
    
    // set table view for this view controller
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeUIView()
        self.makeListenerForObservables()
    }
    
    // listen for any changes happens for the data view
    func makeListenerForObservables(){
        self.dataView.asObservable().subscribe(onNext: {[unowned self] (newValue) in
            self.sections.accept([SectionOfCustomData(items: newValue)])
        }).disposed(by: self.disposeBag)
        
        // set the data source of the tableview and listen for any changes happens for sections
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(
            configureCell: { dataSource, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath) as! TableViewCell
                cell.setupViews(viewObject: item)
                return cell
        })
        self.sections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    // make the ui view
    func makeUIView(){
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { [unowned self] (make) in
            if #available(iOS 11.0, *){
                make.edges.equalTo(self.view.safeAreaLayoutGuide)
            }else{
                make.left.right.equalToSuperview()
                make.top.equalTo(self.topLayoutGuide.snp.bottom)
                make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            }
        }
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 40
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "newCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped(){
        self.dataView.accept(self.dataView.value + [TableViewObject(image: #imageLiteral(resourceName: "editFillIcon"), name: "forth", phone: "129r71684612784681264389")])
    }
    
    class func getObject() -> TableViewViewController{
        return create(viewControllerId: "TableViewViewController", storyBoardId: "Main") as! TableViewViewController
    }

}

struct SectionOfCustomData {
    var items: [Item]
}
extension SectionOfCustomData: SectionModelType {
    
    typealias Item = TableViewObject
    
    init(original: SectionOfCustomData, items: [Item]) {
        self = original
        self.items = items
    }
}

