//
//  QSSearchBar.m
//  SydneyToday
//
//  Created by Qson on 2018/7/2.
//  Copyright © 2018年 Qson. All rights reser
//

#import "QSSearchBar.h"
#import "UIView+Extension.h"
#import "NSString+AttributedString.h"
#import "QSMacro.h"

@interface QSSearchBar () <UITextFieldDelegate>
@property (nonatomic, weak) UIView *contentView;
/**搜索框*/
@property (nonatomic, weak) UITextField *searchBarText;
@property (nonatomic, weak) UIView *lineView;

@property (nonatomic, weak) UIButton *leftButton;
@property (nonatomic, weak) UIButton *rightButton;

@end

@implementation QSSearchBar

+ (instancetype)defaultSearchBar
{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)dealloc
{
    QSLog(@"%s",__func__);
}

#pragma mark - 初始化
- (void)initData
{
    _topMargin = kStatusBarHeight;
    
    self.searchBarItem = ({
        QSSearchBarSearchItem *item = [QSSearchBarSearchItem defaultSearchBarSearchItem];
        item;
    });
    
    self.leftButtonItem = ({
        QSSearchBarButtonItem *item = [QSSearchBarButtonItem defaultSearchBarButtonItem];
        item;
    });
    
    self.rightButtonItem = ({
        QSSearchBarButtonItem *item = [QSSearchBarButtonItem defaultSearchBarButtonItem];
        item;
    });
    
    self.lineColor = QSColor(239, 239, 239, 1.0);
}

- (void)setupFrame
{
    CGFloat x = 0,y = 0,w = 0,h = 0;
    h = _topMargin + kSearchBarH;
    w = kScreenWidth;
    self.frame = CGRectMake(self.x, self.y, w, h);
    
    y = _topMargin;
    w = kScreenWidth;
    h = kSearchBarH;
    self.contentView.frame = CGRectMake(x, y, w, h);
    
    y = self.contentView.height - 1;
    w = kScreenWidth;
    h = 1;
    self.lineView.frame = CGRectMake(x, y, w, h);
    
    if(_rightButtonItem.title.length || _rightButtonItem.image) {
        w = self.rightButton.width;
        h = kSearchBarTextH;
        x = kScreenWidth - w  - _rightButtonItem.marginEdge.right;
        y = (kSearchBarH * 0.5 - h * 0.5);
        self.rightButton.frame = CGRectMake(x, y, w, h);
    }
    else {
        self.rightButton.frame = CGRectZero;
    }
    
    if(_leftButtonItem.title.length || _leftButtonItem.image) {
        w = self.leftButton.width;
        h = kSearchBarTextH;
        x = _leftButtonItem.marginEdge.left;
        y = (kSearchBarH * 0.5 - h * 0.5);
        self.leftButton.frame = CGRectMake(x, y, w, h);
    }
    else {
        self.leftButton.frame = CGRectZero;
    }
    
    x = CGRectGetMaxX(self.leftButton.frame) + _leftButtonItem.marginEdge.right + _searchBarItem.searchBarMargin;
    w = self.contentView.width - x - _searchBarItem.searchBarMargin - self.rightButton.width - _rightButtonItem.marginEdge.right - _rightButtonItem.marginEdge.left;
    h = kSearchBarTextH;
    y = (self.contentView.height - h) * 0.5;
    self.searchBarText.frame = CGRectMake(x, y, w, h);
}

#pragma mark - 外部方法
- (void)setSearchBarItem:(QSSearchBarSearchItem *)searchBarItem
{
    _searchBarItem = searchBarItem;
    
    UIButton * searchBarLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBarLeftBtn setImage:searchBarItem.leftImage forState:UIControlStateNormal];
    [searchBarLeftBtn setContentEdgeInsets:searchBarItem.leftImageViewEdge];
    [searchBarLeftBtn sizeToFit];
    self.searchBarText.leftView = searchBarLeftBtn;
    [self.searchBarText.leftView setFrame:CGRectMake(0, 0, searchBarLeftBtn.width, searchBarLeftBtn.height)];
    self.searchBarText.leftViewMode = UITextFieldViewModeAlways;
    
    if (searchBarItem.placeholder.length) {
        UIFont *font = searchBarItem.placeholderFont;
        
        CGFloat w = self.contentView.width - self.contentView.x - _searchBarItem.searchBarMargin - self.rightButton.width - self.searchBarText.leftView.width;
        CGSize size = CGSizeMake(w, font.lineHeight);
        [searchBarItem.placeholder sizeWithMaxSize:size font:font color:searchBarItem.placeholderColor lineSpaced:0 lineBreakMode:(NSLineBreakByTruncatingTail) completed:^(NSAttributedString *attributedString, CGSize size) {
            
            NSMutableAttributedString *stringM = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
            self.searchBarText.attributedPlaceholder = stringM;
        }];
    }
    
    self.searchBarText.text = searchBarItem.title;
    self.searchBarText.textColor = searchBarItem.titleColor;
    self.searchBarText.font = searchBarItem.titlerFont;
    self.searchBarText.layer.cornerRadius = searchBarItem.cornerRadius;
    self.searchBarText.backgroundColor = searchBarItem.backgroundColor;
    
    [self setupFrame];
}

- (void)setLeftButtonItem:(QSSearchBarButtonItem *)leftButtonItem
{
    _leftButtonItem = leftButtonItem;
    
    [self.leftButton setTitle:leftButtonItem.title forState:(UIControlStateNormal)];
    [self.leftButton setTitleColor:leftButtonItem.titleColor forState:UIControlStateNormal];
    self.leftButton.titleLabel.font = leftButtonItem.titlerFont;
    [self.leftButton setImage:leftButtonItem.image forState:UIControlStateNormal];
    [self.leftButton setContentEdgeInsets:leftButtonItem.contentEdge];
    [self.leftButton addTarget:leftButtonItem.target action:leftButtonItem.action forControlEvents:(UIControlEventTouchUpInside)];
    [self.leftButton setBackgroundColor:leftButtonItem.backgroundColor];
    self.leftButton.layer.cornerRadius = leftButtonItem.cornerRadius;
    
    [self.leftButton sizeToFit];
    [self setupFrame];
}

- (void)setRightButtonItem:(QSSearchBarButtonItem *)rightButtonItem
{
    _rightButtonItem = rightButtonItem;
    
    [self.rightButton setTitle:rightButtonItem.title forState:(UIControlStateNormal)];
    self.rightButton.titleLabel.font = rightButtonItem.titlerFont;
    [self.rightButton setTitleColor:rightButtonItem.titleColor forState:UIControlStateNormal];
    [self.rightButton setImage:rightButtonItem.image forState:UIControlStateNormal];
    [self.rightButton setContentEdgeInsets:rightButtonItem.contentEdge];
    [self.rightButton addTarget:rightButtonItem.target action:rightButtonItem.action forControlEvents:(UIControlEventTouchUpInside)];
    [self.rightButton setBackgroundColor:rightButtonItem.backgroundColor];
    self.rightButton.layer.cornerRadius = rightButtonItem.cornerRadius;
    
    [self.rightButton sizeToFit];
    [self setupFrame];
}

- (void)setTopMargin:(CGFloat)topMargin
{
    _topMargin = topMargin;
    
    [self setupFrame];
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    
    self.lineView.backgroundColor = QSColor(239, 239, 239, 1.0);
}

- (void)setSearchWord:(NSString *)searchWord
{
    _searchBarItem.title = searchWord;
    _searchBarText.text = searchWord;
}

- (void)becomeFirstResponder
{
    [self.searchBarText becomeFirstResponder];
}

#pragma mark - 事件

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField isEqual:self.searchBarText]) {
        textField.autocorrectionType = UITextAutocorrectionTypeNo; // 取消联想
    }
}

-(void)cancleClick:(UIButton *)sender
{
    [self.searchBarText endEditing:YES];
    [self.topViewController.navigationController popViewControllerAnimated:YES];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if(!textField.text.length) {
        if([_delegate respondsToSelector:@selector(clearSearch:)]) {
            [_delegate clearSearch:self];
        }
    }
    
    if(!_searchBarItem.lengthMax) {
        [self setSearchWord:textField.text];
    }
    else {
        bool isChinese;//判断当前输入法是否是中文
        NSArray *currentar = [UITextInputMode activeInputModes];
        UITextInputMode *current = [currentar firstObject];
        if ([current.primaryLanguage isEqualToString: @"en-US"]) {
            isChinese = false;
        }else{
            isChinese = true;
        }
        
        if(textField == self.searchBarText) {
            NSString *toBeString = textField.text;
            if (isChinese) { //中文输入法下
                UITextRange *selectedRange = [textField markedTextRange];
                //获取高亮部分
                UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
                // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
                if (!position) {
                    [self setupLimits:toBeString];
                }
            }else{
                [self setupLimits:toBeString];
            }
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if ([string isEqualToString:@" "] || [string isEqualToString:@"\n"]) {
        return NO;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(!textField.text.length) return NO;
    
    [textField endEditing:YES];
    _searchBarItem.title = textField.text;
    
    if([_delegate respondsToSelector:@selector(searchBar:beginSearchWord:)]) {
        [_delegate searchBar:self beginSearchWord:_searchBarItem.title];
    }
    
    QSLog(@"点击了搜索");
    return YES;
}

// 限制字数
-(void)setupLimits:(NSString *)toBeString
{
    if (toBeString.length == 0) {
        _searchBarItem.title = toBeString;
        return;
    }
    
    //不区分中英文
    if (_searchBarItem.lengthMax > 0) {
        if (toBeString.length > _searchBarItem.lengthMax) {
            NSString *clipText = [toBeString substringToIndex:_searchBarItem.lengthMax];
            [self setSearchWord:clipText];
        }
        else _searchBarItem.title = toBeString;
    }
}

#pragma mark - 懒加载
- (UITextField *)searchBarText
{
    if(_searchBarText == nil) {
        UITextField *searchBarText = [[UITextField alloc] init];
        searchBarText.borderStyle = UITextBorderStyleNone;
        searchBarText.delegate = self;
        searchBarText.clearButtonMode = UITextFieldViewModeWhileEditing;
        searchBarText.enablesReturnKeyAutomatically = YES; // 无内容时变灰不能点
        searchBarText.returnKeyType = UIReturnKeySearch;
        [searchBarText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [self.contentView addSubview:searchBarText];
        
        _searchBarText = searchBarText;
    }
    return _searchBarText;
}

- (UIView *)lineView
{
    if(_lineView == nil) {
        UIView *lineView = [[UIView alloc] init];
        [self.contentView addSubview:lineView];
        _lineView = lineView;
    }
    return _lineView;
}

- (UIButton *)leftButton
{
    if(_leftButton == nil) {
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.clipsToBounds = YES;
        [self.contentView addSubview:leftButton];
        _leftButton = leftButton;
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if(_rightButton == nil) {
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        rightButton.clipsToBounds = YES;
        [self.contentView addSubview:rightButton];
        _rightButton = rightButton;
    }
    return _rightButton;
}

- (UIView *)contentView
{
    if(_contentView == nil) {
        UIView *contentView = [[UIView alloc] init];
        [self addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

@end
