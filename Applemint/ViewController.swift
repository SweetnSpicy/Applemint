//
//  ViewController.swift
//  Applemint
//
//  Created by Apple on 1/30/16.
//  Copyright © 2016 Applemint. All rights reserved.
//


import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    @IBOutlet weak var pageViewOutlet: UIView!
    // MARK: - Variables
    private var pageViewController: UIPageViewController?
    
    let pageControl = UIPageControl()
    
    // Initialize it right away here
    private let contentImages = ["happybg.png",
        "sadbg.png"];
    private let contentFile = ["happy", "sad"]
    
    private let contentText = ["Compliments Page, tap to refresh!", "Insults page, tap to refresh!"];
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        setupPageControl()
    }
    
    private func createPageViewController() {
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        pageController.dataSource = self
        
        if contentImages.count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        pageViewController?.delegate = self
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        self.pageViewController?.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height + 44)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        //let appearance = UIPageControl.appearance()
        //appearance.pageIndicatorTintColor = UIColor.grayColor()
        //appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        //appearance.backgroundColor = UIColor.darkTextColor()
        
    
        //appearance.alpha = 0.5
        
        pageControl.frame = CGRectMake(0, self.view.bounds.height-44, self.view.bounds.width, 44)
        pageControl.numberOfPages = contentImages.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.backgroundColor = UIColor.clearColor()
        
        self.view.addSubview(pageControl)
        self.view.bringSubviewToFront(pageControl)
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        for vc in pendingViewControllers as! [PageItemController] {
            let currentIndex = vc.itemIndex
            pageControl.currentPage = currentIndex
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex > 0 {
            return getItemController(itemController.itemIndex-1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let itemController = viewController as! PageItemController
        
        if itemController.itemIndex+1 < contentImages.count {
            return getItemController(itemController.itemIndex+1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> PageItemController? {
        
        if itemIndex < contentImages.count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("ItemController") as! PageItemController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            pageItemController.pageText = contentText[itemIndex]
            pageItemController.file = contentFile[itemIndex]
            return pageItemController
        }
        
        return nil
    }
    
    // MARK: - Page Indicator
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return contentImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

