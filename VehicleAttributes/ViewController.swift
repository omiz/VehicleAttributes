//
//  ViewController.swift
//  VehicleAttributes
//
//  Created by Omar Allaham on 1/14/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UIScrollViewDelegate {

   @IBOutlet weak var refreshButton: UIButton!

   @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   @IBOutlet weak var emptyLabel: UILabel!

   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var scrollView: UIScrollView!
   @IBOutlet weak var pageControl: UIPageControl!
   @IBOutlet weak var stackView: UIStackView!

   override func viewDidLoad() {
      super.viewDidLoad()

      view.backgroundColor = UIColor.background

      titleLabel.applyTheme()
      emptyLabel.applyThemeLight()
      pageControl.applyTheme()
      activityIndicator.applyTheme()

      refreshButton.setImage(UIImage(named: "refresh"), for: .normal)

      refreshButton.tintColor = UIColor.imageTint

      clear()
   }

   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)

      load()
   }

   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)

      DataManager.attributes.cancel()
   }
   @IBAction func reload(_ sender: UIButton) {
      load()
   }

   func load() {
      guard NetworkReachabilityManager()?.isReachable ?? false else {
         return
      }

      if DataManager.attributes.load(handler: response) {
         clear()
         activityIndicator.startAnimating()
      }
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   func response(_ object: ResponseObject?, error: Error?) {

      activityIndicator.stopAnimating()

      guard error == nil else {
         print(error?.localizedDescription ?? "")
         return
      }

      guard let object = object else {
         emptyLabel.text = localize("Empty Response!")
         return
      }

      add(view: GeneralView.instance.setup(object), title: localize("General"))

      add(view: DetailView.instance.setup(.fuel, object: object), title: localize("Fuel"))

      add(view: DetailView.instance.setup(.emission, object: object), title: localize("Emission"))

      updateTitle(0)
   }

   func clear() {
      stackView.clear()

      scrollView.clear()

      pageControl.clear()
   }

   func add(view: UIView, title: String) {
      let index = pageControl.numberOfPages

      scrollView.add(view, at: index)

      pageControl.numberOfPages = index + 1

      add(button: title, selector: #selector(showIndex(_:)), index: index)
   }

   func add(button: String, selector: Selector, index: Int) {
      let uibutton = UIButton(type: .system)

      uibutton.setTitle(localize(button), for: .normal)
      uibutton.addTarget(self, action: selector, for: .touchUpInside)
      uibutton.tag = index
      uibutton.applyTheme()

      stackView.addArrangedSubview(uibutton)
   }

   //Mark: scroll hanlder

   func showIndex(_ sender: UIButton) {
      scrollView.goTo(horizantally: sender.tag)
   }

   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let pageNumber = Int(round(scrollView.contentOffset.x / view.frame.size.width))

      pageControl.currentPage = pageNumber

      updateTitle(pageNumber)
   }

   func updateTitle(_ index: Int) {
      guard stackView.arrangedSubviews.count > index else {
         titleLabel.text = localize("Vehicle Attributes")
         return
      }
      let button = stackView.arrangedSubviews[index] as! UIButton
      titleLabel.text = button.titleLabel?.text
   }
}

