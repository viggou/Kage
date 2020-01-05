#line 1 "Tweak.x"

@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)exitAndRelaunch:(bool)arg1;
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBStarkIconView; @class UICoverSheetButton; @class CSTeachableMomentsContainerView; @class SBLockScreenViewControllerBase; @class CARIconView; @class SBIconView; @class SBFloatyFolderView; @class FBSystemService; @class SBDashBoardTeachableMomentsContainerView; @class SBIcon; @class SBAppSwitcherSettings; @class CSCoverSheetViewController; @class SBFolderBackgroundView; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$FBSystemService(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("FBSystemService"); } return _klass; }
#line 7 "Tweak.x"
static void RespringDevice() {
    [[_logos_static_class_lookup$FBSystemService() sharedInstance] exitAndRelaunch:YES];
}


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
static BOOL hideLabels;
static BOOL hideCarPlayLabels;
static BOOL hideFolderBadges;
static BOOL hideFolderTitle;
static BOOL hideFolderBG;

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
    NSNumber *eHideFolderTitle = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderTitle" inDomain:nsDomainString];
    NSNumber *eHideFolderBG = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideFolderBG" inDomain:nsDomainString];
    
    NSNumber *eHideCCGrabber = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"hideCCGrabber" inDomain:nsDomainString];

    enabled = (eEnabled) ? [eEnabled boolValue]:NO;
    hideQuickActionsBG = (eHideQuickActionsBG) ? [eHideQuickActionsBG boolValue]:NO;
    gridSwitcher = (eGridSwitcher) ? [eGridSwitcher boolValue]:NO;
    hideLSBatt = (eHideLSBatt) ? [eHideLSBatt boolValue]:NO;
    statusBarShowTimeLS = (eStatusBarShowTimeLS) ? [eStatusBarShowTimeLS boolValue]:NO;
    hideLabels = (eHideLabels) ? [eHideLabels boolValue]:NO;
    hideCarPlayLabels = (eHideCarPlayLabels) ? [eHideCarPlayLabels boolValue]:NO;
    hideFolderBadges = (eHideFolderBadges) ? [eHideFolderBadges boolValue]:NO;
    hideFolderTitle = (eHideFolderTitle) ? [eHideFolderTitle boolValue]:NO;
    hideFolderBG = (eHideFolderBG) ? [eHideFolderBG boolValue]:NO;
    
    hideCCGrabber = (eHideCCGrabber) ? [eHideCCGrabber boolValue]:NO;
}


#import <UIKit/UIKit.h>

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

@interface SBFolderControllerBackgroundView
@property (nonatomic, assign, readwrite) CGFloat alpha;
@end

@interface SBRootFolderView : UIView
@property (nonatomic, assign, readwrite) CGFloat alpha;
@end

@interface SBFolderIconImageView
@property (nonatomic, copy, readwrite) CALayer * layer;
@end

#ifndef kCFCoreFoundationVersionNumber_iOS_13_0
#define kCFCoreFoundationVersionNumber_iOS_13_0 1665.15
#endif

#define kSLSystemVersioniOS13 kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_13_0

static id (*_logos_orig$universal$UICoverSheetButton$_backgroundEffectsWithBrightness$)(_LOGOS_SELF_TYPE_NORMAL UICoverSheetButton* _LOGOS_SELF_CONST, SEL, double); static id _logos_method$universal$UICoverSheetButton$_backgroundEffectsWithBrightness$(_LOGOS_SELF_TYPE_NORMAL UICoverSheetButton* _LOGOS_SELF_CONST, SEL, double); static id (*_logos_orig$universal$SBIcon$badgeNumberOrString)(_LOGOS_SELF_TYPE_NORMAL SBIcon* _LOGOS_SELF_CONST, SEL); static id _logos_method$universal$SBIcon$badgeNumberOrString(_LOGOS_SELF_TYPE_NORMAL SBIcon* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$universal$SBIconView$setLabelHidden$)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$universal$SBIconView$setLabelHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherPageScale$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherPageScale$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingPortrait$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingPortrait$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingLandscape$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingLandscape$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingPortrait$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingPortrait$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingLandscape$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingLandscape$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, double); static void (*_logos_orig$universal$SBAppSwitcherSettings$setSwitcherStyle$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$universal$SBAppSwitcherSettings$setSwitcherStyle$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST, SEL, long long); static void (*_logos_orig$universal$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, bool, bool, bool); static void _logos_method$universal$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL, bool, bool, bool); static BOOL (*_logos_orig$universal$SBFloatyFolderView$_showsTitle)(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$universal$SBFloatyFolderView$_showsTitle(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$universal$SBFolderBackgroundView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBFolderBackgroundView* _LOGOS_SELF_CONST, SEL); static void _logos_method$universal$SBFolderBackgroundView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBFolderBackgroundView* _LOGOS_SELF_CONST, SEL); 



static id _logos_method$universal$UICoverSheetButton$_backgroundEffectsWithBrightness$(_LOGOS_SELF_TYPE_NORMAL UICoverSheetButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
    if (enabled && hideQuickActionsBG) {
        return 0;
    }
    else {
        return _logos_orig$universal$UICoverSheetButton$_backgroundEffectsWithBrightness$(self, _cmd, arg1);
    }
}





static id _logos_method$universal$SBIcon$badgeNumberOrString(_LOGOS_SELF_TYPE_NORMAL SBIcon* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && hideFolderBadges) {
        return @"";
    }
    else {
        return _logos_orig$universal$SBIcon$badgeNumberOrString(self, _cmd);
    }
}





static void _logos_method$universal$SBIconView$setLabelHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL hidden) {
    if (enabled && hideLabels) {
        hidden = YES;
    }
    _logos_orig$universal$SBIconView$setLabelHidden$(self, _cmd, hidden);
}





static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherPageScale$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
    if (enabled && gridSwitcher) {
       arg1 = 0.4; 
    }
    _logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherPageScale$(self, _cmd, arg1);
}

static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingPortrait$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
    if (enabled && gridSwitcher) {
        arg1 = 25.5;
    }
    _logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingPortrait$(self, _cmd, arg1);
}

static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingLandscape$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
    if (enabled && gridSwitcher) {
        arg1 = 11.6;
    }
    _logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingLandscape$(self, _cmd, arg1);
}

static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingPortrait$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
    if (enabled && gridSwitcher) {
        arg1 = 42;
    }
    _logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingPortrait$(self, _cmd, arg1);
}

static void _logos_method$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingLandscape$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
    if (enabled && gridSwitcher) {
        arg1 = 38;
    }
    _logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingLandscape$(self, _cmd, arg1);
}

static void _logos_method$universal$SBAppSwitcherSettings$setSwitcherStyle$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    if (enabled && gridSwitcher) {
        arg1 = 2;
    }
    _logos_orig$universal$SBAppSwitcherSettings$setSwitcherStyle$(self, _cmd, arg1);
}





static void _logos_method$universal$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool arg1, bool arg2, bool arg3) {
    if (enabled && hideLSBatt) {
        arg1 = 0;
    }
    _logos_orig$universal$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$(self, _cmd, arg1, arg2, arg3);
}





static BOOL _logos_method$universal$SBFloatyFolderView$_showsTitle(_LOGOS_SELF_TYPE_NORMAL SBFloatyFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && hideFolderTitle) {
        return NO;
    }
    else {
        return _logos_orig$universal$SBFloatyFolderView$_showsTitle(self, _cmd);
    }
}





    static void _logos_method$universal$SBFolderBackgroundView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBFolderBackgroundView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        _logos_orig$universal$SBFolderBackgroundView$layoutSubviews(self, _cmd);
        if (enabled && hideFolderBG) {
            UIImageView * tintView = MSHookIvar<UIImageView *>(self, "_tintView");
            tintView.alpha = 0; 
        }
    }



 


static bool (*_logos_orig$ios13$CSCoverSheetViewController$shouldShowLockStatusBarTime)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL); static bool _logos_method$ios13$CSCoverSheetViewController$shouldShowLockStatusBarTime(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ios13$CSTeachableMomentsContainerView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL CSTeachableMomentsContainerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$CSTeachableMomentsContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CSTeachableMomentsContainerView* _LOGOS_SELF_CONST, SEL); static CGSize (*_logos_meta_orig$ios13$CARIconView$maxLabelSizeForIconImageSize$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, CGSize); static CGSize _logos_meta_method$ios13$CARIconView$maxLabelSizeForIconImageSize$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, CGSize); 



static bool _logos_method$ios13$CSCoverSheetViewController$shouldShowLockStatusBarTime(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && statusBarShowTimeLS) {
        return YES;
    }
    else {
        return _logos_orig$ios13$CSCoverSheetViewController$shouldShowLockStatusBarTime(self, _cmd);
    }
}





static void _logos_method$ios13$CSTeachableMomentsContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CSTeachableMomentsContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && hideCCGrabber) {
        [self.controlCenterGrabberView setHidden:YES];
    }
    else {
        [self.controlCenterGrabberView setHidden:NO];
    }
    return _logos_orig$ios13$CSTeachableMomentsContainerView$layoutSubviews(self, _cmd);
}





static CGSize _logos_meta_method$ios13$CARIconView$maxLabelSizeForIconImageSize$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGSize imageSize) {
    if (enabled && hideCarPlayLabels) {
        return CGSizeZero;
    }
    else {
        return _logos_meta_orig$ios13$CARIconView$maxLabelSizeForIconImageSize$(self, _cmd, imageSize);
    }
}



 


static bool (*_logos_orig$ios12$SBLockScreenViewControllerBase$shouldShowLockStatusBarTime)(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST, SEL); static bool _logos_method$ios12$SBLockScreenViewControllerBase$shouldShowLockStatusBarTime(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ios12$SBDashBoardTeachableMomentsContainerView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardTeachableMomentsContainerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios12$SBDashBoardTeachableMomentsContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBDashBoardTeachableMomentsContainerView* _LOGOS_SELF_CONST, SEL); static CGSize (*_logos_meta_orig$ios12$SBStarkIconView$maxLabelSize)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static CGSize _logos_meta_method$ios12$SBStarkIconView$maxLabelSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); 



static bool _logos_method$ios12$SBLockScreenViewControllerBase$shouldShowLockStatusBarTime(_LOGOS_SELF_TYPE_NORMAL SBLockScreenViewControllerBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && statusBarShowTimeLS) {
        return YES;
    }
    else {
        return _logos_orig$ios12$SBLockScreenViewControllerBase$shouldShowLockStatusBarTime(self, _cmd);
    }
}





static void _logos_method$ios12$SBDashBoardTeachableMomentsContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBDashBoardTeachableMomentsContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && hideCCGrabber) {
        [self.controlCenterGrabberView setHidden:YES];
    }
    else {
        [self.controlCenterGrabberView setHidden:NO];
    }
    return _logos_orig$ios12$SBDashBoardTeachableMomentsContainerView$layoutSubviews(self, _cmd);
}





static CGSize _logos_meta_method$ios12$SBStarkIconView$maxLabelSize(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && hideCarPlayLabels) {
        return CGSizeZero;
    }
    else {
        return _logos_meta_orig$ios12$SBStarkIconView$maxLabelSize(self, _cmd);
    }
}



 


static __attribute__((constructor)) void _logosLocalCtor_69dc0f6b(int __unused argc, char __unused **argv, char __unused **envp) {
    {Class _logos_class$universal$UICoverSheetButton = objc_getClass("UICoverSheetButton"); MSHookMessageEx(_logos_class$universal$UICoverSheetButton, @selector(_backgroundEffectsWithBrightness:), (IMP)&_logos_method$universal$UICoverSheetButton$_backgroundEffectsWithBrightness$, (IMP*)&_logos_orig$universal$UICoverSheetButton$_backgroundEffectsWithBrightness$);Class _logos_class$universal$SBIcon = objc_getClass("SBIcon"); MSHookMessageEx(_logos_class$universal$SBIcon, @selector(badgeNumberOrString), (IMP)&_logos_method$universal$SBIcon$badgeNumberOrString, (IMP*)&_logos_orig$universal$SBIcon$badgeNumberOrString);Class _logos_class$universal$SBIconView = objc_getClass("SBIconView"); MSHookMessageEx(_logos_class$universal$SBIconView, @selector(setLabelHidden:), (IMP)&_logos_method$universal$SBIconView$setLabelHidden$, (IMP*)&_logos_orig$universal$SBIconView$setLabelHidden$);Class _logos_class$universal$SBAppSwitcherSettings = objc_getClass("SBAppSwitcherSettings"); MSHookMessageEx(_logos_class$universal$SBAppSwitcherSettings, @selector(setGridSwitcherPageScale:), (IMP)&_logos_method$universal$SBAppSwitcherSettings$setGridSwitcherPageScale$, (IMP*)&_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherPageScale$);MSHookMessageEx(_logos_class$universal$SBAppSwitcherSettings, @selector(setGridSwitcherHorizontalInterpageSpacingPortrait:), (IMP)&_logos_method$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingPortrait$, (IMP*)&_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingPortrait$);MSHookMessageEx(_logos_class$universal$SBAppSwitcherSettings, @selector(setGridSwitcherHorizontalInterpageSpacingLandscape:), (IMP)&_logos_method$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingLandscape$, (IMP*)&_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherHorizontalInterpageSpacingLandscape$);MSHookMessageEx(_logos_class$universal$SBAppSwitcherSettings, @selector(setGridSwitcherVerticalNaturalSpacingPortrait:), (IMP)&_logos_method$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingPortrait$, (IMP*)&_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingPortrait$);MSHookMessageEx(_logos_class$universal$SBAppSwitcherSettings, @selector(setGridSwitcherVerticalNaturalSpacingLandscape:), (IMP)&_logos_method$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingLandscape$, (IMP*)&_logos_orig$universal$SBAppSwitcherSettings$setGridSwitcherVerticalNaturalSpacingLandscape$);MSHookMessageEx(_logos_class$universal$SBAppSwitcherSettings, @selector(setSwitcherStyle:), (IMP)&_logos_method$universal$SBAppSwitcherSettings$setSwitcherStyle$, (IMP*)&_logos_orig$universal$SBAppSwitcherSettings$setSwitcherStyle$);Class _logos_class$universal$CSCoverSheetViewController = objc_getClass("CSCoverSheetViewController"); MSHookMessageEx(_logos_class$universal$CSCoverSheetViewController, @selector(_transitionChargingViewToVisible:showBattery:animated:), (IMP)&_logos_method$universal$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$, (IMP*)&_logos_orig$universal$CSCoverSheetViewController$_transitionChargingViewToVisible$showBattery$animated$);Class _logos_class$universal$SBFloatyFolderView = objc_getClass("SBFloatyFolderView"); MSHookMessageEx(_logos_class$universal$SBFloatyFolderView, @selector(_showsTitle), (IMP)&_logos_method$universal$SBFloatyFolderView$_showsTitle, (IMP*)&_logos_orig$universal$SBFloatyFolderView$_showsTitle);Class _logos_class$universal$SBFolderBackgroundView = objc_getClass("SBFolderBackgroundView"); MSHookMessageEx(_logos_class$universal$SBFolderBackgroundView, @selector(layoutSubviews), (IMP)&_logos_method$universal$SBFolderBackgroundView$layoutSubviews, (IMP*)&_logos_orig$universal$SBFolderBackgroundView$layoutSubviews);}
    
    if (kSLSystemVersioniOS13) {
        {Class _logos_class$ios13$CSCoverSheetViewController = objc_getClass("CSCoverSheetViewController"); MSHookMessageEx(_logos_class$ios13$CSCoverSheetViewController, @selector(shouldShowLockStatusBarTime), (IMP)&_logos_method$ios13$CSCoverSheetViewController$shouldShowLockStatusBarTime, (IMP*)&_logos_orig$ios13$CSCoverSheetViewController$shouldShowLockStatusBarTime);Class _logos_class$ios13$CSTeachableMomentsContainerView = objc_getClass("CSTeachableMomentsContainerView"); MSHookMessageEx(_logos_class$ios13$CSTeachableMomentsContainerView, @selector(layoutSubviews), (IMP)&_logos_method$ios13$CSTeachableMomentsContainerView$layoutSubviews, (IMP*)&_logos_orig$ios13$CSTeachableMomentsContainerView$layoutSubviews);Class _logos_class$ios13$CARIconView = objc_getClass("CARIconView"); Class _logos_metaclass$ios13$CARIconView = object_getClass(_logos_class$ios13$CARIconView); MSHookMessageEx(_logos_metaclass$ios13$CARIconView, @selector(maxLabelSizeForIconImageSize:), (IMP)&_logos_meta_method$ios13$CARIconView$maxLabelSizeForIconImageSize$, (IMP*)&_logos_meta_orig$ios13$CARIconView$maxLabelSizeForIconImageSize$);}
    }
    else {
        {Class _logos_class$ios12$SBLockScreenViewControllerBase = objc_getClass("SBLockScreenViewControllerBase"); MSHookMessageEx(_logos_class$ios12$SBLockScreenViewControllerBase, @selector(shouldShowLockStatusBarTime), (IMP)&_logos_method$ios12$SBLockScreenViewControllerBase$shouldShowLockStatusBarTime, (IMP*)&_logos_orig$ios12$SBLockScreenViewControllerBase$shouldShowLockStatusBarTime);Class _logos_class$ios12$SBDashBoardTeachableMomentsContainerView = objc_getClass("SBDashBoardTeachableMomentsContainerView"); MSHookMessageEx(_logos_class$ios12$SBDashBoardTeachableMomentsContainerView, @selector(layoutSubviews), (IMP)&_logos_method$ios12$SBDashBoardTeachableMomentsContainerView$layoutSubviews, (IMP*)&_logos_orig$ios12$SBDashBoardTeachableMomentsContainerView$layoutSubviews);Class _logos_class$ios12$SBStarkIconView = objc_getClass("SBStarkIconView"); Class _logos_metaclass$ios12$SBStarkIconView = object_getClass(_logos_class$ios12$SBStarkIconView); MSHookMessageEx(_logos_metaclass$ios12$SBStarkIconView, @selector(maxLabelSize), (IMP)&_logos_meta_method$ios12$SBStarkIconView$maxLabelSize, (IMP*)&_logos_meta_orig$ios12$SBStarkIconView$maxLabelSize);}
    }

    
    notificationCallback(NULL, NULL, NULL, NULL, NULL);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);

    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)RespringDevice, CFSTR("com.yaypixxo.kage/respring"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
