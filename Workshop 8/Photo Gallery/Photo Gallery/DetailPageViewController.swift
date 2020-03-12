//
//  DetailPageViewController.swift
//  Photo Gallery
//
//  Created by Martin Mikusovic on 12/03/2020.
//  Copyright © 2020 Martin Mikusovic. All rights reserved.
//

import UIKit

class DetailPageViewController: UIPageViewController {
    
    public var currentIndex = 0
    public var images = [Image]()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setViewControllers([getVC(with: currentIndex)], direction: .forward, animated: true, completion: nil)
    }
    
    private func getVC(with index: Int) -> DetailViewController {
        currentIndex = index
        let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as! DetailViewController
        vc.image = images[currentIndex]
        vc.pageIndex = currentIndex
        return vc
    }
}

extension DetailPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = (viewController as! DetailViewController).pageIndex
        if index <= 0 { return nil }
        return getVC(with: index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = (viewController as! DetailViewController).pageIndex
        if index + 1 >= images.count { return nil }
        return getVC(with: index + 1)
    }
}
