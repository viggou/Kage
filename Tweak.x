// Respring function
@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)exitAndRelaunch:(bool)arg1;
@end

static void RespringDevice() {
    [[%c(FBSystemService) sharedInstance] exitAndRelaunch:YES];
}

// Prefs
@interface NSUserDefaults (KagePrefs)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString *nsDomainString = @"com.yaypixxo.kage";
static NSString *nsNotificationString = @"com.yaypixxo.kage/preferences.changed";

// Declare pref things here (switches, buttons, etc.)
static BOOL enabled;
static BOOL hideQuickActionsBG;
static BOOL gridSwitcher;
static BOOL hideLSBatt;
static BOOL statusBarShowTimeLS;
static BOOL hideLabels;
//static BOOL hideCarPlayLabels;
static BOOL hideFolderBadges;
static BOOL hideFolderTitle;
static BOOL hideFolderBG;
static BOOL hideFolderBGSB;
static BOOL hideFolderDots;
static BOOL hideNoOlderNotifs;
//static BOOL hideStatusBarLS;
static BOOL hideCCGrabber;
static BOOL noBetaAlert;
static BOOL tapFolderClose;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    NSNumber *eEnabled = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];
    NSNumber *eHideQuickActionsBG = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideQuickActionsBG" inDomain:nsDomainString];
    NSNumber *eGridSwitcher = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"gridSwitcher" inDomain:nsDomainString];
    NSNumber *eHideLSBatt = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideLSBatt" inDomain:nsDomainString];
    NSNumber *eStatusBarShowTimeLS = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"statusBarShowTimeLS" inDomain:nsDomainString];
    NSNumber *eHideLabels = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideLabels" inDomain:nsDomainString];
    //NSNumber *eHideCarPlayLabels = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideCarPlayLabels" inDomain:nsDomainString];
    NSNumber *eHideFolderBadges = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderBadges" inDomain:nsDomainString];
    NSNumber *eHideFolderTitle = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderTitle" inDomain:nsDomainString];
    NSNumber *eHideFolderBG = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderBG" inDomain:nsDomainString];
    NSNumber *eHideFolderBGSB = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderBGSB" inDomain:nsDomainString];
    NSNumber *eHideFolderDots = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderDots" inDomain:nsDomainString];
    NSNumber *eHideNoOlderNotifs = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideNoOlderNotifs" inDomain:nsDomainString];
    //NSNumber *eHideStatusBarLS = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideStatusBarLS" inDomain:nsDomainString];
    NSNumber *eHideCCGrabber = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideCCGrabber" inDomain:nsDomainString];
    NSNumber *eNoBetaAlert = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"noBetaAlert" inDomain:nsDomainString];
    NSNumber *eTapFolderClose = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"tapFolderClose" inDomain:nsDomainString];

    enabled = (eEnabled) ? [eEnabled boolValue]:NO;
    hideQuickActionsBG = (eHideQuickActionsBG) ? [eHideQuickActionsBG boolValue]:NO;
    gridSwitcher = (eGridSwitcher) ? [eGridSwitcher boolValue]:NO;
    hideLSBatt = (eHideLSBatt) ? [eHideLSBatt boolValue]:NO;
    statusBarShowTimeLS = (eStatusBarShowTimeLS) ? [eStatusBarShowTimeLS boolValue]:NO;
    hideLabels = (eHideLabels) ? [eHideLabels boolValue]:NO;
    //hideCarPlayLabels = (eHideCarPlayLabels) ? [eHideCarPlayLabels boolValue]:NO;
    hideFolderBadges = (eHideFolderBadges) ? [eHideFolderBadges boolValue]:NO;
    hideFolderTitle = (eHideFolderTitle) ? [eHideFolderTitle boolValue]:NO;
    hideFolderBG = (eHideFolderBG) ? [eHideFolderBG boolValue]:NO;
    hideFolderBGSB = (eHideFolderBGSB) ? [eHideFolderBGSB boolValue]:NO;
    hideFolderDots = (eHideFolderDots) ? [eHideFolderDots boolValue]:NO;
    hideNoOlderNotifs = (eHideNoOlderNotifs) ? [eHideNoOlderNotifs boolValue]:NO;
    //hideStatusBarLS = (eHideStatusBarLS) ? [eHideStatusBarLS boolValue]:NO;
    hideCCGrabber = (eHideCCGrabber) ? [eHideCCGrabber boolValue]:NO;
    noBetaAlert = (eNoBetaAlert) ? [eNoBetaAlert boolValue]:NO;
    tapFolderClose = (eTapFolderClose) ? [eTapFolderClose boolValue]:NO;
}

// Headers 
#import <UIKit/UIKit.h>

@interface SBFloatyFolderView : UIView
@end

@interface SBIconView : UIView
-(void)setLabelHidden:(BOOL)hidden;
@end

@interface SBIcon : NSObject
-(id)badgeNumberOrString;
@end

@interface CSTeachableMomentsContainerView
@property (nonatomic,retain) UIView * controlCenterGrabberView;
@end

@interface SBDashBoardTeachableMomentsContainerView
@property (nonatomic,retain) UIView * controlCenterGrabberView;
@end

@interface SBFolderIconImageView : UIView 
@property (nonatomic, retain) UIView *backgroundView;
@end

@interface SBIconListPageControl
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

@interface SBIconController : NSObject
+(id)sharedInstance;
-(void)_closeFolderController:(id)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

@interface SBUILegibilityLabel : UIView
@property (nonatomic,copy) NSString *string;
@end

@interface NCNotificationListSectionRevealHintView : UIView 
@property (nonatomic,retain)SBUILegibilityLabel *revealHintTitle;
@end

/*@interface SBFloatyFolderView : SBFolderView
-(void)_handleOutsideTap:(id)arg1 ;
@end

@interface SBFolderController : UIViewController
@property (nonatomic,readonly) UIView * containerView;
@end

@interface SBFloatyFolderScrollView : UIScrollView
-(void)closeFolder:(id)selector;
-(id)_viewControllerForAncestor;
@end*/

#ifndef kCFCoreFoundationVersionNumber_iOS_13_0
#define kCFCoreFoundationVersionNumber_iOS_13_0 1665.15
#endif

#define kSLSystemVersioniOS13 kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_13_0

%group universal // Stuff that works on both iOS 12 & iOS 13 (and some things 9+)

// Hide no older notifications
%hook NCNotificationListSectionRevealHintView

-(void)didMoveToWindow {
    %orig;
    if (enabled && hideNoOlderNotifs) {
        self.revealHintTitle.string = @"";
    }
}

%end

// Hide quick actions BG
%hook UICoverSheetButton
-(id)_backgroundEffectsWithBrightness:(double)arg1 {
    if (enabled && hideQuickActionsBG) {
        return 0;
    }
    else {
        return %orig;
    }
}
%end

// Hide folder badges text
%hook SBIcon
-(id)badgeNumberOrString {
    if (enabled && hideFolderBadges) {
        return @"";
    }
    else {
        return %orig;
    }
}
%end

// Hide icon labels
%hook SBIconView
-(void)setLabelHidden:(BOOL)hidden {
    if (enabled && hideLabels) {
        hidden = YES;
    }
    %orig;
}
%end

// Grid switcher
%hook SBAppSwitcherSettings
- (void)setGridSwitcherPageScale:(double)arg1 {
    if (enabled && gridSwitcher) {
       arg1 = 0.4; 
    }
    %orig;
}

- (void)setGridSwitcherHorizontalInterpageSpacingPortrait:(double)arg1 {
    if (enabled && gridSwitcher) {
        arg1 = 25.5;
    }
    %orig;
}

- (void)setGridSwitcherHorizontalInterpageSpacingLandscape:(double)arg1 {
    if (enabled && gridSwitcher) {
        arg1 = 11.6;
    }
    %orig;
}

- (void)setGridSwitcherVerticalNaturalSpacingPortrait:(double)arg1 {
    if (enabled && gridSwitcher) {
        arg1 = 42;
    }
    %orig;
}

- (void)setGridSwitcherVerticalNaturalSpacingLandscape:(double)arg1 {
    if (enabled && gridSwitcher) {
        arg1 = 38;
    }
    %orig;
}

- (void)setSwitcherStyle:(long long)arg1 {
    if (enabled && gridSwitcher) {
        arg1 = 2;
    }
    %orig;
}
%end

// Hide LS battery
%hook CSCoverSheetViewController
- (void)_transitionChargingViewToVisible:(bool)arg1 showBattery:(bool)arg2 animated:(bool)arg3 {
    if (enabled && hideLSBatt) {
        arg1 = 0;
    }
    %orig;
}
%end

// Hide folder title
%hook SBFloatyFolderView
-(BOOL)_showsTitle {
    if (enabled && hideFolderTitle) {
        return NO;
    }
    else {
        return %orig;
    }
}
%end

// Hide folder backgrounds
%hook SBFloatyFolderView
-(void)setBackgroundAlpha:(CGFloat)arg1 {
    if (enabled && hideFolderBG) {
        %orig(0.0);
    }
    else {
        %orig;
    }
}
%end

%hook SBFolderIconImageView
-(void)layoutSubviews {
    %orig;
    if (enabled && hideFolderBGSB) {
        self.backgroundView.alpha = 0;
        self.backgroundView.hidden = 1;
    }
}
%end

// Close folder when tapped inside
%hook SBFloatyFolderView
-(BOOL)_tapToCloseGestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2 {
	%orig;
	if (enabled && tapFolderClose) {
		return YES;
	}
	else {
		return %orig;
	}
}
%end

// Hide folder dots
%hook SBIconListPageControl
-(void)layoutSubviews {
    if (enabled && hideFolderDots) {
        self.hidden = YES;
    }
    else {
        %orig;
    }
}
%end

// Hide beta alert

// iOS 9-10
%hook SBIconController
-(void)showDeveloperBuildExpirationAlertIfNecesarryFromLockscreen:(BOOL)arg1 toLauncher:(BOOL)arg2 {
	if (enabled && noBetaAlert) {

	}
	else {
		%orig;
	}
}
%end

// iOS 11-13
%hook SBDeveloperBuildExpirationTrigger
-(void)showDeveloperBuildExpirationAlertIfNecesarryFromLockscreen:(BOOL)arg1 toLauncher:(BOOL)arg2 {
	if (enabled && noBetaAlert) {

	}
	else {
		%orig;
	}
}
%end

%end // End universal group

// Stuff that only works on iOS 13
%group ios13

// Show time in LS statusbar 
%hook CSCoverSheetViewController
- (bool)shouldShowLockStatusBarTime {
    if (enabled && statusBarShowTimeLS) {
        return YES;
    }
    else {
        return %orig;
    }
}
%end

// Hide CC LS grabber 
%hook CSTeachableMomentsContainerView
- (void)layoutSubviews {
    if (enabled && hideCCGrabber) {
        [self.controlCenterGrabberView setHidden:YES];
    }
    else {
        [self.controlCenterGrabberView setHidden:NO];
    }
    return %orig;
}
%end

// Hide CarPlay labels 
/*%hook CARIconView
+(CGSize)maxLabelSizeForIconImageSize:(CGSize)imageSize {
    if (enabled && hideCarPlayLabels) {
        return CGSizeZero;
    }
    else {
        return %orig;
    }
}
%end*/

%end // End ios13 group

// Stuff that only works on iOS 12
%group ios12

// Show time in LS statusbar
%hook SBLockScreenViewControllerBase
- (bool)shouldShowLockStatusBarTime {
    if (enabled && statusBarShowTimeLS) {
        return YES;
    }
    else {
        return %orig;
    }
}
%end

// Hide CC LS grabber
%hook SBDashBoardTeachableMomentsContainerView
- (void)layoutSubviews {
    if (enabled && hideCCGrabber) {
        [self.controlCenterGrabberView setHidden:YES];
    }
    else {
        [self.controlCenterGrabberView setHidden:NO];
    }
    return %orig;
}
%end

// Hide CarPlay labels
/*%hook SBStarkIconView
+(CGSize)maxLabelSize {
    if (enabled && hideCarPlayLabels) {
        return CGSizeZero;
    }
    else {
        return %orig;
    }
}
%end*/

%end // End ios12 group

// Listeners
%ctor {
    %init(universal);
    // Check iOS version
    if (kSLSystemVersioniOS13) {
        %init(ios13);
    }
    else {
        %init(ios12);
    }

    // Prefs changed listener
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);

    // Respring listener
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)RespringDevice, CFSTR("com.yaypixxo.kage/respring"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
