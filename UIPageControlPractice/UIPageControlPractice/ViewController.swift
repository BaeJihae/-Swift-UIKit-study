//
//  ViewController.swift
//  UIPageControlPractice
//
//  Created by 배지해 on 4/18/24.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var pages: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupPages()
        configueScrollView()
        
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
    }
    
    func setupPages() {
        let page1 = UIView()
        page1.backgroundColor = .black
        let page2 = UIView()
        page2.backgroundColor = .gray
        let page3 = UIView()
        page3.backgroundColor = .lightGray
        
        pages = [page1, page2, page3]
    }
    
    func configueScrollView() {
        scrollView.delegate = self
        
        // 스크롤 뷰 내에서의 페이징 활성화 -> 스크롤 뷰의 내용이 페이지의 경계에서 멈추도록 함
        scrollView.isPagingEnabled = true
        
        // scrollView 내의 contentView의 사이즈 설정 ( 높이 고정 ( 좌우로 스와이프 )
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count),
                                        height: scrollView.frame.height)
        
        // x와 y는 각 view의 위치 설정
        // width와 height의 각 view의 크기 설정
        for (index, page) in pages.enumerated() {
            page.frame = CGRect(x: view.frame.width * CGFloat(index),
                                y: 0, 
                                width: view.frame.width,
                                height: scrollView.frame.height)
            scrollView.addSubview(page)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }


}
