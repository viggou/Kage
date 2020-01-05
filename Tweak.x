// respring function
@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)exitAndRelaunch:(bool)arg1;
@end

static void RespringDevice() {
    [[%c(FBSystemService) sharedInstance] exitAndRelaunch:YES];
}

// prefs
@interface NSUserDefaults (KagePrefs)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString *nsDomainString = @"com.yaypixxo.kage";
static NSString *nsNotificationString = @"com.yaypixxo.kage/preferences.changed";

// declare pref things here (switches, buttons, etc.)
static BOOL enabled;
static BOOL hideQuickActionsBG;
static BOOL gridSwitcher;
static BOOL hideLSBatt;
static BOOL statusBarShowTimeLS;
static BOOL hideLabels;
static BOOL hideCarPlayLabels;
static BOOL hideFolderBadges;
//static BOOL hideStatusBarLS;
static BOOL hideCCGrabber;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    NSNumber *eEnabled = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];
    NSNumber *eHideQuickActionsBG = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideQuickActionsBG" inDomain:nsDomainString];
    NSNumber *eGridSwitcher = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"gridSwitcher" inDomain:nsDomainString];
    NSNumber *eHideLSBatt = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideLSBatt" inDomain:nsDomainString];
    NSNumber *eStatusBarShowTimeLS = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"statusBarShowTimeLS" inDomain:nsDomainString];
    NSNumber *eHideLabels = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideLabels" inDomain:nsDomainString];
    NSNumber *eHideCarPlayLabels = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideCarPlayLabels" inDomain:nsDomainString];
    NSNumber *eHideFolderBadges = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderBadges" inDomain:nsDomainString];
    //NSNumber *eHideStatusBarLS = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideStatusBarLS" inDomain:nsDomainString];
    NSNumber *eHideCCGrabber = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideCCGrabber" inDomain:nsDomainString];

    enabled = (eEnabled) ? [eEnabled boolValue]:NO;
    hideQuickActionsBG = (eHideQuickActionsBG) ? [eHideQuickActionsBG boolValue]:NO;
    gridSwitcher = (eGridSwitcher) ? [eGridSwitcher boolValue]:NO;
    hideLSBatt = (eHideLSBatt) ? [eHideLSBatt boolValue]:NO;
    statusBarShowTimeLS = (eStatusBarShowTimeLS) ? [eStatusBarShowTimeLS boolValue]:NO;
    hideLabels = (eHideLabels) ? [eHideLabels boolValue]:NO;
    hideCarPlayLabels = (eHideCarPlayLabels) ? [eHideCarPlayLabels boolValue]:NO;
    hideFolderBadges = (eHideFolderBadges) ? [eHideFolderBadges boolValue]:NO;
    //hideStatusBarLS = (eHideStatusBarLS) ? [eHideStatusBarLS boolValue]:NO;
    hideCCGrabber = (eHideCCGrabber) ? [eHideCCGrabber boolValue]:NO;
}

// headers and hooks
#import <UIKit/UIKit.h>

@interface SBIconView : UIView
-(void)setLabelHidden:(BOOL)hidden;
@end

@interface SBIcon : NSObject
-(id)badgeNumberOrString;
@end

@interface CSTeachableMomentsContainerView {

}

@property (nonatomic,retain) UIView * controlCenterGrabberView;
@end

@interface SBDashBoardTeachableMomentsContainerView {
    
}

@property (nonatomic,retain) UIView * controlCenterGrabberView;
@end

#ifndef kCFCoreFoundationVersionNumber_iOS_13_0
#define kCFCoreFoundationVersionNumber_iOS_13_0 1665.15
#endif

#define kSLSystemVersioniOS13 kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_13_0

%group universal

// QUICK ACTIONS BG START //
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
// QUICK ACTIONS BG END //

// HIDE FOLDER BADGE TEXT START //
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
// HIDE FOLDER BADGE TEXT END //

// HIDE LABELS START //
%hook SBIconView
-(void)setLabelHidden:(BOOL)hidden {
    if (enabled && hideLabels) {
        hidden = YES;
    }
    %orig;
}
%end
// HIDE LABELS END //

// GRID SWITCHER START //
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
// GRID SWITCHER END //

// NO LS BATTERY START //
%hook CSCoverSheetViewController
- (void)_transitionChargingViewToVisible:(bool)arg1 showBattery:(bool)arg2 animated:(bool)arg3 {
    if (enabled && hideLSBatt) {
        arg1 = 0;
    }
    %orig;
}
%end
// NO LS BATTERY END //

%end // end universal group

// stuff that only works on iOS 13
%group ios13

// SHOW TIME IN LS STATUSBAR START //
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
// SHOW TIME IN LS STATUSBAR END //

// HIDE CC GRABBER START //
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
// HIDE CC GRABBER END //

// HIDE CARPLAY LABELS START //
%hook CARIconView
+(CGSize)maxLabelSizeForIconImageSize:(CGSize)imageSize {
    if (enabled && hideCarPlayLabels) {
        return CGSizeZero;
    }
    else {
        return %orig;
    }
}
%end
// HIDE CARPLAY LABELS END //

%end // end ios13 group

// stuff that only works on iOS 12
%group ios12

// SHOW TIME IN LS STATUSBAR START //
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
// SHOW TIME IN LS STATUSBAR END //

// HIDE CC GRABBER START //
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
// HIDE CC GRABBER END //

// HIDE CARPLAY LABELS START //
%hook SBStarkIconView
+(CGSize)maxLabelSize {
    if (enabled && hideCarPlayLabels) {
        return CGSizeZero;
    }
    else {
        return %orig;
    }
}
%end
// HIDE CARPLAY LABELS END //

%end // end ios12 group

// LISTENERS
%ctor {
    %init(universal);
    // check iOS version
    if (kSLSystemVersioniOS13) {
        %init(ios13);
    }
    else {
        %init(ios12);
    }

    // prefs changed listener
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);

    // respring listener
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)RespringDevice, CFSTR("com.yaypixxo.kage/respring"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}