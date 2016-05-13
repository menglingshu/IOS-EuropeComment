//
//  LoginViewController.swift
//  EuropeCommend
//  Created by MacBook on 16/04/01.
//  Copyright (c) 2016年 MENG All rights reserved.
//  登陆控制器

import UIKit

public let SD_UserLogin_Notification = "SD_UserLogin_Notification"
public let SD_UserDefaults_Account = "SD_UserDefaults_Account"
public let SD_UserDefaults_Password = "SD_UserDefaults_Password"

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    var bottomView: UIView!
    var backScrollView: UIScrollView!
    var topView: UIView!
    var emailTextField: UITextField!
    var psdTextField: UITextField!
    var loginImageView: UIImageView!
    var quickLoginBtn: UIButton!
    var forgetPasswordBtn: UIButton!
    var registerImageView: UIImageView!
    let textCoclor: UIColor = UIColor.colorWith(50, green: 50, blue: 50, alpha: 1)
    let loginW: CGFloat = 250
    private var iconView: IconView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "登录"
        view.backgroundColor = theme.SDWebViewBacagroundColor
        //添加scrollView
        addScrollView()
        // 添加手机文本框和密码文本框
        addTextField()
        // 添加登录View
        addLoginImageView()
        // 添加快捷登录按钮
        addForgetPasswordBtn()
        // 添加忘记密码按钮
        addQuictLoginBtn()
        // 添加键盘通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillChangeFrameNotification:", name:UIKeyboardWillChangeFrameNotification, object: nil)
        let image = UIImage(named:"me")
        let imageView = UIImageView(frame:CGRect(x:165,y:70,width:image!.size.width-510,height:image!.size.height-510))
        imageView.image = image
        self.view.addSubview(imageView)
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func addScrollView() {
        backScrollView = UIScrollView(frame: view.bounds)
        backScrollView.backgroundColor = theme.SDWebViewBacagroundColor
        backScrollView.alwaysBounceVertical = true
        let tap = UITapGestureRecognizer(target: self, action: "backScrollViewTap")
        backScrollView.addGestureRecognizer(tap)
        view.addSubview(backScrollView)
    }
    
    
    func addLoginImageView() {
        let loginH: CGFloat = 50
        loginImageView = UIImageView(frame: CGRectMake((AppWidth - loginW) * 0.5, CGRectGetMaxY(topView!.frame) + 10, loginW, loginH))
        loginImageView.userInteractionEnabled = true
        loginImageView.image = UIImage(named: "signin_1")
        
        let loginLabel = UILabel(frame: loginImageView.bounds)
        loginLabel.text = "登  录"
        loginLabel.textAlignment = .Center
        loginLabel.textColor = textCoclor
        loginLabel.font = UIFont.systemFontOfSize(22)
        loginImageView.addSubview(loginLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: "loginClick")
        loginImageView.addGestureRecognizer(tap)
        
        backScrollView.addSubview(loginImageView)
    }
    
    func addTextField() {
        let textH: CGFloat = 50
        let leftMargin: CGFloat = 30
        let alphaV: CGFloat = 0.2
        
        
        topView = UIView(frame: CGRectMake(0, 200, AppWidth, textH * 2))
        topView?.backgroundColor = UIColor.clearColor()
        backScrollView.addSubview(topView!)
        
        let line1 = UIView(frame: CGRectMake(10, 0, AppWidth, 1))
        line1.backgroundColor = UIColor.clearColor()
        line1.alpha = alphaV
        topView!.addSubview(line1)
        
        emailTextField = UITextField()
        emailTextField?.keyboardType = UIKeyboardType.NumberPad
        addTextFieldToTopViewWiht(emailTextField!, frame: CGRectMake(leftMargin, 0, AppWidth - leftMargin - 30, textH - 10), placeholder: "请输入用户名或邮箱")
        
        let line2 = UIView(frame: CGRectMake(5, textH, AppWidth, 1))
        line2.backgroundColor = UIColor.clearColor()
        line2.alpha = alphaV
        topView!.addSubview(line2)
        
        psdTextField = UITextField()
        addTextFieldToTopViewWiht(psdTextField!, frame: CGRectMake(leftMargin, textH + 1, AppWidth - leftMargin - 30, textH - 10), placeholder: "密码")
    }
    
    func addQuictLoginBtn() {
        quickLoginBtn = UIButton()
        quickLoginBtn.setTitle("使用第三方账号登录", forState: .Normal)
        quickLoginBtn.titleLabel?.sizeToFit()
        quickLoginBtn.contentMode = .Right
        let quickW: CGFloat = quickLoginBtn.titleLabel!.width
        quickLoginBtn.frame = CGRectMake(AppWidth - quickW - 10, CGRectGetMaxY(loginImageView.frame) + 10, quickW, 30)
        quickLoginBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        quickLoginBtn.addTarget(self, action: "quickLoginClick", forControlEvents: .TouchUpInside)
        quickLoginBtn.setTitleColor(textCoclor, forState: .Normal)
        quickLoginBtn.setTitleColor(UIColor.lightGrayColor(), forState: .Highlighted)
        backScrollView.addSubview(quickLoginBtn)
    }
    
    func addForgetPasswordBtn() {
        forgetPasswordBtn = UIButton()
        forgetPasswordBtn.setTitle("忘记密码", forState: .Normal)
        forgetPasswordBtn.titleLabel?.sizeToFit()
        forgetPasswordBtn.contentMode = .Left
        let forgetW: CGFloat = forgetPasswordBtn.titleLabel!.width
        forgetPasswordBtn.frame = CGRectMake(AppWidth - forgetW - 315, CGRectGetMaxY(loginImageView.frame) + 10, forgetW, 30)
        forgetPasswordBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        forgetPasswordBtn.addTarget(self, action: "forgetPasswordClick", forControlEvents: .TouchUpInside)
        forgetPasswordBtn.setTitleColor(textCoclor, forState: .Normal)
        forgetPasswordBtn.setTitleColor(UIColor.lightGrayColor(), forState: .Highlighted)
        backScrollView.addSubview(forgetPasswordBtn)
    }
    
    func addTextFieldToTopViewWiht(textField: UITextField ,frame: CGRect, placeholder: String) {
        textField.frame = frame
        textField.autocorrectionType = .No
        textField.clearButtonMode = .Always
        textField.backgroundColor = UIColor.whiteColor()
        textField.placeholder = placeholder
        topView!.addSubview(textField)
    }
    
    
    
    /// 登录按钮被点击
    func loginClick() {
        
        if !emailTextField.text!.validateEmail() {
            SVProgressHUD.showErrorWithStatus("请输入正确的邮箱地址", maskType: SVProgressHUDMaskType.Black)
            return
        } else if psdTextField.text!.isEmpty {
            SVProgressHUD.showErrorWithStatus("密码不能为空", maskType: SVProgressHUDMaskType.Black)
            return
        }
        
        //将用户的账号和密码暂时保存到本地,实际开发中光用MD5加密是不够的,需要多重加密
        let account = emailTextField.text
        let psdMD5 = psdTextField.text!.md5
        NSUserDefaults.standardUserDefaults().setObject(account, forKey: SD_UserDefaults_Account)
        NSUserDefaults.standardUserDefaults().setObject(psdMD5, forKey: SD_UserDefaults_Password)
        if NSUserDefaults.standardUserDefaults().synchronize() {
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
    /// 快捷登录点击
    func quickLoginClick() {
        print("快捷登陆", terminator: "")
    }
    /// 忘记密码点击
    func forgetPasswordClick() {
        print("忘记密码", terminator: "")
    }
    /*/// 右侧注册按钮   ---------------------------------------------------------
    private func setSignUpBtn() {
        view.addSubview(SignUpNav)
        //添加返回按钮
        setButton(signUpBtn, CGRectMake(AppWidth - 54, 20, 44, 44), "back_0", "back_2", "signUpClick")
        view.addSubview(signUpBtn)
    }
    */
    //-------------------------------------------------------------------------
    func signUpClick() {
        let signUp = SettingViewController()
        navigationController?.pushViewController(signUp, animated: true)
    }
    
    func keyboardWillChangeFrameNotification(note: NSNotification) {
        // TODO 添加键盘弹出的事件
        let userinfo = note.userInfo!
        let rect = userinfo[UIKeyboardFrameEndUserInfoKey]!.CGRectValue
        var boardH = AppHeight - rect.origin.y
        if boardH > 0 {
            boardH = boardH + NavigationH
        }
        backScrollView.contentSize = CGSizeMake(0, view.height + boardH)
    }
    
    func backScrollViewTap() {
        view.endEditing(true)
    }
}
