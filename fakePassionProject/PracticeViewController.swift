//
//  PracticeViewController.swift
//  fakePassionProject
//
//  Created by Pursuit on 12/28/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var scrollView2: UIScrollView!

    @IBOutlet weak var scrollView3: UIScrollView!

 ////////////////////////////////////////////////////////////////////////
    
    @IBOutlet var allButtons: [UIButton]!
    
    
    
    @IBAction func SelectedMenu(_ sender: Any) {
        allButtons.forEach { (buttons) in
            UIView.animate(withDuration: 0.3, animations:  {
                buttons.isHidden = !buttons.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
        
    }
    
    @IBAction func ButtonChoices(_ sender: Any) {
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/////////////////////////////////////////////////////////////////////////
    
    
    

    var slides:[Slide] = []
    var slides2:[Slide2] = []
    var slides3:[Slide3] = []

    @objc fileprivate func autoScrolls() {
        //scrollView.contentOffset
        autoScroll()
        autoScroll1()
        autoScroll2()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        slides2 = createSlides1()
        slides3 = createSlides3()
       setupSlideScrollView(slides: slides)
       setupSlideScrollView1(slides: slides2)
       setupSlideScrollView2(slides: slides3)
        //setupSlideScrollView2(slides: slides2)


        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)

        scrollView.delegate = self
        scrollView2.delegate = self
        scrollView3.delegate = self
        self.offSet = 0
      //self.offSet = 0
        Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(autoScrolls), userInfo: nil, repeats: true)

//        autoScroll(scrollViewy: scrollView2)
//        autoScroll(scrollViewy: scrollView3)
        //self.navigationItem.titleView = UIImageView.init(image: UIImage(named: "sapcexlogo")!)
    }
var offSet: CGFloat = 0
//var offSet1: CGFloat = 0

    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true

        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

        func setupSlideScrollView1(slides : [Slide2]) {
            scrollView2.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView2.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
            scrollView2.isPagingEnabled = true

            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                scrollView2.addSubview(slides[i])
            }
    }
            
            func setupSlideScrollView2(slides : [Slide3]) {
                scrollView3.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
                scrollView3.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
                scrollView3.isPagingEnabled = true
                
                for i in 0 ..< slides.count {
                    slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
                    scrollView3.addSubview(slides[i])
                }

}

    func createSlides() -> [Slide] {

                let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slide1.imageXIB.image = UIImage(named: "blueorigin")

                let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slide2.imageXIB.image = UIImage(named: "rocket 3")

                let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slide3.imageXIB.image = UIImage(named: "rocket 5")

                let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slide4.imageXIB.image = UIImage(named: "rocket1")

                let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
                slide5.imageXIB.image = UIImage(named: "rocket2")

                return [slide1,slide2,slide3,slide4,slide5]
            }

    func createSlides1() -> [Slide2] {

        let slide1:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide1.imageXIB2.image = UIImage(named: "NASA")

        let slide2:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide2.imageXIB2.image = UIImage(named: "optin8")

        let slide3:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide3.imageXIB2.image = UIImage(named: "option3")

        let slide4:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide4.imageXIB2.image = UIImage(named: "world1")

        let slide5:Slide2 = Bundle.main.loadNibNamed("Slide2", owner: self, options: nil)?.first as! Slide2
        slide5.imageXIB2.image = UIImage(named: "maybe?")

        return [slide1,slide2,slide3,slide4,slide5]
    }


    func createSlides3() -> [Slide3] {
        
        let slide1:Slide3 = Bundle.main.loadNibNamed("Slide3", owner: self, options: nil)?.first as! Slide3
        slide1.imageXIB3.image = UIImage(named: "NASA")
        
        let slide2:Slide3 = Bundle.main.loadNibNamed("Slide3", owner: self, options: nil)?.first as! Slide3
        slide2.imageXIB3.image = UIImage(named: "optin8")
        
        let slide3:Slide3 = Bundle.main.loadNibNamed("Slide3", owner: self, options: nil)?.first as! Slide3
        slide3.imageXIB3.image = UIImage(named: "option3")
        
        let slide4:Slide3 = Bundle.main.loadNibNamed("Slide3", owner: self, options: nil)?.first as! Slide3
        slide4.imageXIB3.image = UIImage(named: "world1")
        
        let slide5:Slide3 = Bundle.main.loadNibNamed("Slide3", owner: self, options: nil)?.first as! Slide3
        slide5.imageXIB3.image = UIImage(named: "maybe?")
        
        return [slide1,slide2,slide3,slide4,slide5]
    }



    @objc func autoScroll() {
        let totalPossibleOffset = CGFloat(createSlides().count - 1) * self.view.bounds.size.width
        if offSet == totalPossibleOffset {
            offSet = 0 // come back to the first image after the last image
        }
        else {
            offSet += self.view.bounds.size.width
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0, delay: 3, options: UIView.AnimationOptions.curveEaseOut , animations: {
                self.scrollView.contentOffset.x = CGFloat(self.offSet)
            }, completion: nil)

        }
        }



    @objc func autoScroll1() {
        let totalPossibleOffset = CGFloat(createSlides().count - 1) * self.view.bounds.size.width
        if offSet == totalPossibleOffset {
            offSet = 0 // come back to the first image after the last image
        }
        else {
            offSet += self.view.bounds.size.width
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0, delay: 3, options: UIView.AnimationOptions.transitionFlipFromRight , animations: {
                self.scrollView2.contentOffset.x = CGFloat(self.offSet)
            }, completion: nil)

        }
    }

    @objc func autoScroll2() {
        let totalPossibleOffset = CGFloat(createSlides().count - 1) * self.view.bounds.size.width
        if offSet == totalPossibleOffset {
            offSet = 0 // come back to the first image after the last image
        }
        else {
            offSet += self.view.bounds.size.width
        }
        DispatchQueue.main.async() {
            UIView.animate(withDuration: 0, delay: 3, options: UIView.AnimationOptions.transitionCrossDissolve , animations: {
                self.scrollView3.contentOffset.x = CGFloat(self.offSet)
            }, completion: nil)
            
        }
    }
}
