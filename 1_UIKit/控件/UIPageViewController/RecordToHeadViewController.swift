//
//  RecordToHeadViewController.swift
//  memoryTrain
//
//  Created by 刘彦玮 on 15/3/17.
//  Copyright (c) 2015年 刘彦玮. All rights reserved.
//

import UIKit

class RecordToHeadViewController: BaseViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
   
    @IBOutlet weak var ContentView: UIView!
    
    var pageController:UIPageViewController!
    var pageControl:UIPageControl!
    var currentPage:Int = 0
    var viewControllers = NSMutableArray()
    var data:NSMutableArray?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparePageController()
        preparePageControl()
        prepareData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func prepareData(){
        
        if inflateData(){
            
            //初始化要展示的Controller,自定义
            for var i = 0 ; i < data?.count ; i++ {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewControllerWithIdentifier("words") as WordsViewController
              
                vc.view.frame = ContentView.frame;
                vc.wordLabel.text = "\(i+1)"
                vc.tipsLabel.text = "tips:\(i+1)"
                vc.index = i
                
                
                
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewControllerWithIdentifier("page1") as test1ViewController
                
//                vc.view.frame = self.view.frame
                

                
                
                viewControllers.addObject(vc)
                //pViewController.numberLabel?.text = "第(currentPage+1)页"
            }
            //展示之前进行初始化第一个Controller, 单个显示放一个,两个显示则放两个,和样式有关
            pageController.setViewControllers([viewControllers.objectAtIndex(0)], direction: .Forward, animated: false) { (b:Bool) -> Void in
               
            }
            currentPage = 1

        }
    }
    //网络请求数据
    func inflateData()->Bool{
        data = ["1","2","3","4","5","6"]
        return true
    }
    
    //准备pageController
    func preparePageController(){
    
        pageController = UIPageViewController(transitionStyle:UIPageViewControllerTransitionStyle.Scroll,navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        
        
        pageController.delegate = self;//设置delegate,提供展示相关的信息和接收手势发起的转换的通知
        pageController.dataSource = self;//设置datasource,提供展示的内容
       

               //UIPageController必须放在Controller Container中
        self.addChildViewController(pageController)
        pageController.view.frame = self.ContentView.frame;
//        pageController.view.backgroundColor = UIColor.grayColor()
        self.ContentView.addSubview(pageController.view)
        
        

    }
    //准备pageControl
    func preparePageControl(){
//        pageControl = UIPageControl(frame: CGRectMake(20, 300, 200, 50))
//        pageControl.backgroundColor = UIColor.redColor()
//        self.ContentView.addSubview(pageControl)
//        pageControl.numberOfPages = 6;
//        pageControl.currentPage = 0
    }
    
    //-------------DataSource-----------------
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        
        currentPage = viewControllers.indexOfObject(viewController)-1
        
        if currentPage < 0 {
            pageControl.currentPage = 0
            return nil
        
        }
        pageControl.currentPage = currentPage+1
        return viewControllers[currentPage] as? UIViewController

    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
       
        currentPage = viewControllers.indexOfObject(viewController) + 1
    
        if currentPage == data?.count {
            pageControl.currentPage = 5
            return nil
        }
        pageControl.currentPage = currentPage-1
        
        return viewControllers[currentPage] as? UIViewController
    }
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return pageController.viewControllers.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return currentPage
//    }
//   
 
}
