//
//  ViewController.swift
//  FloatButton
//
//  Created by Ivan Vavilov on 26/03/16.
//  Copyright © 2016 Ivan Vavilov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cellsData = ["Cool service for everyone", "", "Cool service for everyone dsf df sd fds f sdf sdf s df sd", "fds f sdf sdf s df sd fsdflwr klwre kwlerk wlerklwerkwle ewr ewsdf sdf sd f", "klwre kwlerk wlerklwerkwle ewr ewsdf sdf sd f suiuiuiwrqe qweqwoiuousdf dsfouof jnxbnvcb zzfbsdfbsdfbn", "f suiuiuiwrqe qweqwoiuousdf dsfouof jnxbnvcb zzfbsdfbsdfbn", "f suiuiuiwrqe qweqwoiuousdf dsfouof jnxbnvcb zzfbsdfbsdfbn jnxbnvcb zzfbsdfbsdfbn jnxbnvcb zzfbsdfbsdfbn jnxbnvcb zzfbsdfbsdfbn f suiuiuiwrqe qweqwoiuousdf dsfouof", "zzfbsdfbsdfbn jnxbnvcb zzfbsdfbsdfbn jnxbnvcb zzfbsdfbsdfbn jnxbnvcb", "asfj slsjlg slsdjl jdgl jlsdfjg lkdsjlg jsdg jdfls jgdlf jlsk jglkfjgl jslj glsd jgldsjg lksdj glsj glksj glksdj lgjsl gjsl gjsdl jglsj gls g", "re kwlerk wlerklwerkwle ewr ewsdf sdf sd re kwlerk wlerklwerkwle ewr ewsdf sdf sd re kwlerk wlerklwerkwle ewr ewsdf sdf sd re kwlerk wlerklwerkwle ewr ewsdf sdf sd re kwlerk wlerklwerkwle ewr ewsdf sdf sd re kwlerk wlerklwerkwle ewr ewsdf sdf sd"]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pinnedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            return tableView.dequeueReusableCellWithIdentifier("ButtonCell")!
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TextCell") as! TextTableViewCell
            cell.mainLabel.text = cellsData[indexPath.row]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.row == 1 ? 110 : UITableViewAutomaticDimension
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as? ButtonTableViewCell {
            let buttonFrame = cell.actionButton.convertRect(cell.actionButton.bounds, toView: tableView)
//            print("Offset = \(scrollView.contentOffset.y), frame = \(CGRectGetMinY(buttonFrame))")
            
            let offset = scrollView.contentOffset.y
            let buttonY = CGRectGetMinY(buttonFrame)
            
            cell.actionButton.hidden = offset > buttonY
            pinnedButton.hidden = !cell.actionButton.hidden
        }
    }
}

