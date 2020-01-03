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
    NSNumber *eHideFolderBadges = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderBadges" inDomain:nsDomainString];
    //NSNumber *eHideStatusBarLS = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideStatusBarLS" inDomain:nsDomainString];
    NSNumber *eHideCCGrabber = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideCCGrabber" inDomain:nsDomainString];

    enabled = (eEnabled) ? [eEnabled boolValue]:NO;
    hideQuickActionsBG = (eHideQuickActionsBG) ? [eHideQuickActionsBG boolValue]:NO;
    gridSwitcher = (eGridSwitcher) ? [eGridSwitcher boolValue]:NO;
    hideLSBatt = (eHideLSBatt) ? [eHideLSBatt boolValue]:NO;
    statusBarShowTimeLS = (eStatusBarShowTimeLS) ? [eStatusBarShowTimeLS boolValue]:NO;
    hideLabels = (eHideLabels) ? [eHideLabels boolValue]:NO;
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

// HIDE BADGE TEXT START //
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
// HIDE BADGE TEXT END //

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

// SHOW TIME IN LS STATUSBAR START //
%hook CSCoverSheetViewController
- (bool)shouldShowLockStatusBarTime {
    if (enabled && statusBarShowTimeLS) {
        return 1;
    }
    else {
        return %orig;
    }
}
%end
// SHOW TIME IN LS STATUSBAR END //

// LISTENERS
%ctor {
    // prefs changed listener
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);

    // respring listener
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)RespringDevice, CFSTR("com.yaypixxo.kage/respring"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}