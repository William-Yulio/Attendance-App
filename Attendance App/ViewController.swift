//
//  ViewController.swift
//  Attendance App
//
//  Created by William Yulio on 10/06/23.
//

import UIKit

class ViewController: UIPageViewController {
    
    var pages = [UIViewController]()
        
        let skipButton = UIButton()
        let nextButton = UIButton()
        let pageControl = UIPageControl()
        let loginButton = UIButton()
        let signupButton = UIButton()
        let initialPage = 0

        // animations
        var pageControlBottomAnchor: NSLayoutConstraint?
        var skipButtonTopAnchor: NSLayoutConstraint?
        var nextButtonTopAnchor: NSLayoutConstraint?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setup()
            style()
            layout()
        }
    }

    extension ViewController {
        
        func setup() {
            dataSource = self
            delegate = self
            
            pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)

            let page1 = OnboardingViewController(imageName: "time",
                                                 titleText: "DIGITAL ABSENSI",
                                                 subtitleText: "Kehadiran sistem absensi digital merupakan penemuan yang mampu menggantikan pencatatan data kehadiran secara manual")
            let page2 = OnboardingViewController(imageName: "employee",
                                                 titleText: "ATTENDANCE SYSTEM",
                                                 subtitleText: "Pengelolaan karyawan di era digital yang baik, menghasilkan karyawan terbaik pula, salah satunya absensi karyawan")
            let page3 = OnboardingViewController(imageName: "mask1",
                                                 titleText: "SELALU PAKAI MASKER",
                                                 subtitleText: "Guna mencegah penyebaran virus Covid-19, Pemerintah telah mengeluarkan kebijakan Physical Distancing serta kebijakan bekerja, belajar, dan beribadah dari rumah.")
//            let page4 = LoginViewController()
            
            pages.append(page1)
            pages.append(page2)
            pages.append(page3)
//            pages.append(page4)
            
            setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        }
        
        func style() {
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            pageControl.currentPageIndicatorTintColor = UIColor(rgb: 0x042C5C)
            pageControl.pageIndicatorTintColor = UIColor(rgb: 0x77869E)

            pageControl.numberOfPages = pages.count
            pageControl.currentPage = initialPage

            skipButton.translatesAutoresizingMaskIntoConstraints = false
            skipButton.setTitleColor(UIColor(rgb: 0x77869E), for: .normal)
            skipButton.setTitle("SKIP", for: .normal)
            skipButton.addTarget(self, action: #selector(skipTapped(_:)), for: .primaryActionTriggered)

            loginButton.translatesAutoresizingMaskIntoConstraints = false
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.setTitle("Login", for: .normal)
            loginButton.backgroundColor = UIColor(rgb: 0x0063C6)
            loginButton.roundCorners(corners: [.topRight, .topLeft, .bottomLeft, .bottomRight], amount: 10)
            loginButton.addTarget(self, action: #selector(goToLoginPage(_:)), for: .primaryActionTriggered)
            
            signupButton.translatesAutoresizingMaskIntoConstraints = false
            signupButton.setTitleColor(.white, for: .normal)
            signupButton.setTitle("Sign Up", for: .normal)
            signupButton.backgroundColor = UIColor(rgb: 0x0063C6)
            signupButton.roundCorners(corners: [.topRight, .topLeft, .bottomLeft, .bottomRight], amount: 10)
            signupButton.addTarget(self, action: #selector(goToSignUpPage(_:)), for: .primaryActionTriggered)
        }
        
        func layout() {
            view.addSubview(pageControl)
//            view.addSubview(nextButton)
            view.addSubview(skipButton)
            view.addSubview(loginButton)
            view.addSubview(signupButton)
            
            NSLayoutConstraint.activate([
                pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
                pageControl.heightAnchor.constraint(equalToConstant: 20),
                pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pageControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 280),
                
                loginButton.widthAnchor.constraint(equalToConstant: 156),
                loginButton.heightAnchor.constraint(equalToConstant: 48),
                loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
                
                signupButton.widthAnchor.constraint(equalToConstant: 156),
                signupButton.heightAnchor.constraint(equalToConstant: 48),
                signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                signupButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
//                pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
//                loginButton.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor),
                
//                loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),

                
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: skipButton.trailingAnchor, multiplier: 2),
            ])
            
            // for animations
            pageControlBottomAnchor = view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 2)
            skipButtonTopAnchor = skipButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
//            nextButtonTopAnchor = nextButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
            
            pageControlBottomAnchor?.isActive = true
            skipButtonTopAnchor?.isActive = true
//            nextButtonTopAnchor?.isActive = true
        }
    }

    // MARK: - DataSource

    extension ViewController: UIPageViewControllerDataSource {
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

            guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
            
            if currentIndex == 0 {
                return pages.last               // wrap last
            } else {
                return pages[currentIndex - 1]  // go previous
            }
        }
            
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

            if currentIndex < pages.count - 1 {
                return pages[currentIndex + 1]  // go next
            } else {
                return pages.first              // wrap first
            }
        }
    }

    // MARK: - Delegates

    extension ViewController: UIPageViewControllerDelegate {
        
        // How we keep our pageControl in sync with viewControllers
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            guard let viewControllers = pageViewController.viewControllers else { return }
            guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
            
            pageControl.currentPage = currentIndex
//            animateControlsIfNeeded()
        }
        
        private func animateControlsIfNeeded() {
            let lastPage = pageControl.currentPage == pages.count - 1
            
            if lastPage {
                hideControls()
            } else {
                showControls()
            }

            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        private func hideControls() {
            pageControlBottomAnchor?.constant = -80
            skipButtonTopAnchor?.constant = -80
//            nextButtonTopAnchor?.constant = -80
        }

        private func showControls() {
            pageControlBottomAnchor?.constant = 16
            skipButtonTopAnchor?.constant = 16
//            nextButtonTopAnchor?.constant = 16
        }
    }

    // MARK: - Actions

    extension ViewController {

        @objc func pageControlTapped(_ sender: UIPageControl) {
            setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
            animateControlsIfNeeded()
        }

        @objc func skipTapped(_ sender: UIButton) {
//            let lastPage = pages.count - 1
//            pageControl.currentPage = lastPage
//
//            goToSpecificPage(index: lastPage, ofViewControllers: pages)
//            animateControlsIfNeeded()
            let nextPage = LoginViewController()
            let navVC = UINavigationController(rootViewController: nextPage)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
        
//        @objc func nextTapped(_ sender: UIButton) {
//            pageControl.currentPage += 1
//            goToNextPage()
//            animateControlsIfNeeded()
//        }
        
        @objc func goToLoginPage(_ sender: UIButton){
            let nextPage = LoginViewController()
            let navVC = UINavigationController(rootViewController: nextPage)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
        
        @objc func goToSignUpPage(_ sender: UIButton){
            let nextPage = SignUpViewController()
            let navVC = UINavigationController(rootViewController: nextPage)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    }

    // MARK: - Extensions

    extension UIPageViewController {

        func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
            guard let currentPage = viewControllers?[0] else { return }
            guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
            
            setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
        }
        
        func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
            guard let currentPage = viewControllers?[0] else { return }
            guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
            
            setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
        }
        
        func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
            setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
        }
    }
