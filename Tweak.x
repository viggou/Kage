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

static BOOL enabled;
static BOOL hideQuickActionsBG;
static BOOL gridSwitcher;
static BOOL hideLSBatt;
static BOOL statusBarShowTimeLS;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    NSNumber *eEnabled = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];
    NSNumber *eHideQuickActionsBG = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideQuickActionsBG" inDomain:nsDomainString];
    NSNumber *eGridSwitcher = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"gridSwitcher" inDomain:nsDomainString];
    NSNumber *eHideLSBatt = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideLSBatt" inDomain:nsDomainString];
    NSNumber *eStatusBarShowTimeLS = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"statusBarShowTimeLS" inDomain:nsDomainString];

    enabled = (eEnabled) ? [eEnabled boolValue]:NO;
    hideQuickActionsBG = (eHideQuickActionsBG) ? [eHideQuickActionsBG boolValue]:NO;
    gridSwitcher = (eGridSwitcher) ? [eGridSwitcher boolValue]:NO;
    hideLSBatt = (eHideLSBatt) ? [eHideLSBatt boolValue]:NO;
    statusBarShowTimeLS = (eStatusBarShowTimeLS) ? [eStatusBarShowTimeLS boolValue]:NO;
}

// hooks and stuff
#import <UIKit/UIKit.h>

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

%ctor {
    // prefs changed listener
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);

    // respring listener
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)RespringDevice, CFSTR("com.yaypixxo.kage/respring"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}