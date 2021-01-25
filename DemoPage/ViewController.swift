//
//  ViewController.swift
//  DemoPage
//
//  Created by Eratalar, Ali Ugur (401) on 25.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControllerHolderView: UIView!
    
    lazy var pageViewController: UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }()
    
    var controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupPageViewController()
    }
    
    func setupPageViewController() {
        
        /*
         Datasource and Delegate
         */
        self.pageViewController.delegate = self;
        self.pageViewController.dataSource = self;
        self.pageViewController.view.frame = pageControllerHolderView.bounds
        self.addChild(self.pageViewController)
        pageControllerHolderView.addSubview(self.pageViewController.view)
        
        for view in self.pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }

        /*
         Show view controller with initial page - PAGE ZERO
         */
        guard let redVC = self.storyboard?.instantiateViewController(identifier: "RedViewController") as? RedViewController else { return }
        guard let yellowVC = self.storyboard?.instantiateViewController(identifier: "YellowViewController") as? YellowViewController else { return }
        guard let greenVC = self.storyboard?.instantiateViewController(identifier: "GreenViewController") as? GreenViewController else { return }

        controllers.append(redVC)
        controllers.append(yellowVC)
        controllers.append(greenVC)

        self.pageViewController.setViewControllers([controllers[0]], direction: .forward, animated: false)
        
        /*
         Add to holder view
         */
        pageViewController.didMove(toParent: self)
        
    }
    

    @IBAction func menuButtonTapped(_ sender: UIButton) {
        let index = sender.tag - 1
        self.pageViewController.setViewControllers([controllers[index]], direction: .forward, animated: false)
                            
        
    }
    
}

extension ViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        if let index = controllers.firstIndex(of: viewController) {
//            if index > 0 {
//                return controllers[index - 1]
//            } else {
//                return nil
//            }
//        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
//        if let index = controllers.firstIndex(of: viewController) {
//            if index < controllers.count - 1 {
//                return controllers[index + 1]
//            } else {
//                return nil
//            }
//        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
       
    }
    
}

