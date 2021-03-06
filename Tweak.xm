#include <Cephei/HBPreferences.h>
#include <CSColorPicker/CSColorPicker.h>
#include "Tweak.h"

#define PLIST_PATH @"/User/Library/Preferences/com.thomz.foldy.plist"

inline NSString *StringForPreferenceKey(NSString *key) {
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] ? : [NSDictionary new];
    return prefs[key];
}

HBPreferences *preferences;
BOOL isEnabled;

BOOL clearMode;

BOOL titleFontSize;
double customTitleFontSize;
BOOL hideTitle;
//BOOL boldTitle;
BOOL enableTitleTextAlignment;
int titleTextAlignment;
BOOL enableTextColor;
NSString *customTextColor;
BOOL enableBackgroundTitle;
NSString *colorBackgroundTitle;
double cornerRadiusBackgroundTitle;

BOOL cornerRadius;
double customCornerRadius;

BOOL backgroundAlpha;
double customBackgroundAlpha;

BOOL enableBackgroundColor;
BOOL backgroundColor;
NSString *customBackgroundColor;
BOOL gradientBackgroundColor;
NSString *customGradientBackgroundColor;
BOOL verticalGradient;

BOOL enableFolderBackgroundColor;
BOOL folderBackgroundColor;
NSString *customFolderBackgroundColor;
BOOL gradientFolderBackgroundColor;
NSString *customGradientFolderBackgroundColor;
BOOL verticalFolderGradient;

BOOL enableCustomFrame;
BOOL completelyCustomFrame;
BOOL fullSizeFolder;
BOOL centeredCustomFrame;

BOOL enableCustomLayout;
BOOL enableCustomPremadeLayout;
BOOL enableCustomCustomLayout;
int rows;
int columns;
int numberOfRowsColumns;

BOOL hidePageDots;

void prefs(){

	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.thomz.foldyprefs"];
        [preferences registerDefaults:@{
            @"isEnabled": @YES,

            @"clearMode": @NO,

            @"titleFontSize": @NO,
            @"customTitleFontSize": @20,
            @"hideTitle": @NO,
            //@"boldTitle":@NO,
            @"enableTitleTextAlignment": @NO,
            @"titleTextAlignment": @1,
            @"enableTextColor": @NO,
            @"customTextColor": @2,
            @"enableBackgroundTitle": @NO,
            @"colorBackgroundTitle": @2,
            @"cornerRadiusBackgroundTitle": @1,

            @"cornerRadius": @NO,
            @"customCornerRadius": @5,

            @"backgroundAlpha": @NO,
            @"customBackgroundAlpha": @1,

            @"enableBackgroundColor": @NO,
            @"backgroundColor": @NO,
            @"customBackgroundColor": @2,
            @"gradientBackgroundColor": @NO,
            @"customGradientBackgroundColor": @2,
            @"verticalGradient": @NO,

            @"enableFolderBackgroundColor": @NO,
            @"folderBackgroundColor": @NO,
            @"customFolderBackgroundColor": @2,
            @"gradientFolderBackgroundColor": @NO,
            @"customGradientFolderBackgroundColor": @2,
            @"verticalFolderGradient": @NO,

            @"enableCustomFrame": @NO,
            @"completelyCustomFrame": @NO,
            @"fullSizeFolder": @NO,
            @"centeredCustomFrame": @NO,

            @"enableCustomLayout": @NO,
            @"enableCustomPremadeLayout": @NO,
            @"enableCustomCustomLayout": @NO,
            @"customLayoutRows": @3,
            @"customLayoutColumns": @3,
            @"numberOfRowsColumns":@1,

            @"hidePageDots": @NO,

            @"rows": @2,
            @"columns": @2,
        }];

        [preferences registerBool:&isEnabled default:YES forKey:@"isEnabled"];

        [preferences registerBool:&clearMode default:NO forKey:@"clearMode"];

        [preferences registerBool:&titleFontSize default:NO forKey:@"titleFontSize"];
        [preferences registerDouble:&customTitleFontSize default:20 forKey:@"customTitleFontSize"];
        [preferences registerBool:&hideTitle default:NO forKey:@"hideTitle"];
        //[preferences registerBool:&boldTitle default:NO forKey:@"boldTitle"];
        [preferences registerBool:&enableTitleTextAlignment default:NO forKey:@"enableTitleTextAlignment"];
        titleTextAlignment = [[preferences objectForKey:@"titleTextAlignment"] intValue];
        [preferences registerBool:&enableTextColor default:NO forKey:@"enableTextColor"];
        [preferences registerObject:&customTextColor default:@"#ffffff" forKey:@"customTextColor"];
        [preferences registerBool:&enableBackgroundTitle default:NO forKey:@"enableBackgroundTitle"];
        [preferences registerObject:&colorBackgroundTitle default:@"#ffffff" forKey:@"colorBackgroundTitle"];
        [preferences registerDouble:&cornerRadiusBackgroundTitle default:20 forKey:@"cornerRadiusBackgroundTitle"];

        [preferences registerBool:&cornerRadius default:NO forKey:@"cornerRadius"];
        [preferences registerDouble:&customCornerRadius default:35 forKey:@"customCornerRadius"];

        [preferences registerBool:&backgroundAlpha default:NO forKey:@"backgroundAlpha"];
        [preferences registerDouble:&customBackgroundAlpha default:1 forKey:@"customBackgroundAlpha"];

        [preferences registerBool:&enableBackgroundColor default:NO forKey:@"enableBackgroundColor"];
        [preferences registerBool:&backgroundColor default:NO forKey:@"backgroundColor"];
        [preferences registerObject:&customBackgroundColor default:@"#fff000" forKey:@"customBackgroundColor"];
        [preferences registerBool:&gradientBackgroundColor default:NO forKey:@"gradientBackgroundColor"];
        [preferences registerObject:&customGradientBackgroundColor default:@"#fff000" forKey:@"customGradientBackgroundColor"];
        [preferences registerBool:&verticalGradient default:NO forKey:@"verticalGradient"];

        [preferences registerBool:&enableFolderBackgroundColor default:NO forKey:@"enableFolderBackgroundColor"];
        [preferences registerBool:&folderBackgroundColor default:NO forKey:@"folderBackgroundColor"];
        [preferences registerObject:&customFolderBackgroundColor default:@"#fff000" forKey:@"customFolderBackgroundColor"];
        [preferences registerBool:&gradientFolderBackgroundColor default:NO forKey:@"gradientFolderBackgroundColor"];
        [preferences registerObject:&customGradientFolderBackgroundColor default:@"#fff000" forKey:@"customGradientFolderBackgroundColor"];
        [preferences registerBool:&verticalFolderGradient default:NO forKey:@"verticalFolderGradient"];

        [preferences registerBool:&enableCustomFrame default:NO forKey:@"enableCustomFrame"];
        [preferences registerBool:&completelyCustomFrame default:NO forKey:@"completelyCustomFrame"];
        [preferences registerBool:&fullSizeFolder default:NO forKey:@"fullSizeFolder"];
        [preferences registerBool:&centeredCustomFrame default:NO forKey:@"centeredCustomFrame"];

        [preferences registerBool:&enableCustomLayout default:NO forKey:@"enableCustomLayout"];
        [preferences registerBool:&enableCustomPremadeLayout default:NO forKey:@"enableCustomPremadeLayout"];
        [preferences registerBool:&enableCustomCustomLayout default:NO forKey:@"enableCustomCustomLayout"];
        numberOfRowsColumns = [[preferences objectForKey:@"numberOfRowsColumns"] intValue];
        rows = [[preferences objectForKey:@"customLayoutRows"] intValue];
        columns = [[preferences objectForKey:@"customLayoutColumns"] intValue];

        [preferences registerBool:&hidePageDots default:NO forKey:@"hidePageDots"];
 
}

%group all
%hook SBFloatyFolderView

-(void)setBackgroundAlpha:(double)arg1 {
    if (isEnabled){
        if(clearMode){
            return %orig(0);
        } else {}

        if(backgroundAlpha){
            return %orig(customBackgroundAlpha);
        }

    } else {}
}

-(BOOL)_showsTitle {
    if(isEnabled){
        if(clearMode && !hideTitle){
            return NO;
        } else if(!clearMode && hideTitle){
            return NO;
        } else if(clearMode && hideTitle) {
            return NO;
        } else {
            return YES;
        }

    } else {
        return YES;
    }
}

-(void)setCornerRadius:(double)arg1 {
    if(isEnabled){
        if(cornerRadius){
            return %orig(customCornerRadius);
        } else {

        }

        if(clearMode){
            return %orig(0);
        }
    } else {

    }
}

-(double)_titleFontSize {
    if(isEnabled){
        if(titleFontSize){
            return customTitleFontSize;
        } else {
            return %orig;
        }
    } else {
        return %orig;
    }
}

-(CGRect)_frameForScalingView {

    preferences = [HBPreferences preferencesForIdentifier:@"com.thomz.foldy"];

    CGFloat left = [preferences floatForKey:@"completelyCustomFrameLeft"];
    CGFloat top = [preferences floatForKey:@"completelyCustomFrameTop"];
    CGFloat width = [preferences floatForKey:@"completelyCustomFrameWidth"];
    CGFloat height = [preferences floatForKey:@"completelyCustomFrameHeight"];

    CGFloat centeredWidth = [preferences floatForKey:@"centeredCustomFrameWidth"];
    CGFloat centeredHeight = [preferences floatForKey:@"centeredCustomFrameHeight"];

    if(isEnabled){
        
    if(enableCustomFrame){

        if(completelyCustomFrame){

            return CGRectMake(left,top,width,height);
        } else if(fullSizeFolder){

            return self.frame;
        } else if(centeredCustomFrame){
                return CGRectMake((self.bounds.size.width - centeredWidth)/2, (self.bounds.size.height - centeredHeight)/2,centeredWidth,centeredHeight);
        } else {return %orig;}

    } else {
        return %orig;
    }

    } else {
        return %orig;
    }

}

-(void)layoutSubviews {

    UIColor *selectedColor = [UIColor cscp_colorFromHexString:customBackgroundColor];

    NSArray<id> *gradientColors = [StringForPreferenceKey(@"customGradientBackgroundColor") cscp_gradientStringCGColors];
    
    if(isEnabled){
        

        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.bounds;

        if(verticalGradient){
            gradient.startPoint = CGPointMake(0.5, 0);
            gradient.endPoint = CGPointMake(0.5, 1);
        } else {
            gradient.startPoint = CGPointMake(0, 0.5);
            gradient.endPoint = CGPointMake(1, 0.5);
        }

        gradient.colors = gradientColors;

           if(enableBackgroundColor){

            if(backgroundColor && !gradientBackgroundColor){
                %orig;
                [self setBackgroundColor:selectedColor];
            }

            if(!backgroundColor && gradientBackgroundColor){
                %orig;
                [self.layer insertSublayer:gradient atIndex:0];
            }

            if(!backgroundColor && !gradientBackgroundColor){
                %orig;
            }

            if(backgroundColor && gradientBackgroundColor){
                %orig;
                [self setBackgroundColor:selectedColor];
            }

        } else {
            %orig;
        }
    } else {
        %orig;
    }

}

%end

//folder inside grid
%hook SBFolderIconListView

+ (unsigned long long)maxVisibleIconRowsInterfaceOrientation:(long long)arg1 {

    if(isEnabled){
        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){

                if (numberOfRowsColumns == 0){

                    return 2;
                }

                else if(numberOfRowsColumns == 1){

                    return %orig;
                }

                else if(numberOfRowsColumns == 2){

                return 4; 
                } else {return %orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){
                
                if(rows == 0){
                    return 2;
                } else if(rows == 1){
                    return 3;
                } else if(rows == 2){
                    return 4;
                } else if(rows == 3){
                    return 5;
                } else if(rows == 4){
                    return 6;
                } else if(rows == 5){
                    return 7;
                } else {return %orig;}

            } else if(enableCustomPremadeLayout && enableCustomCustomLayout){
                if (numberOfRowsColumns == 0){

                    return 2;
                }

                else if(numberOfRowsColumns == 1){

                    return %orig;
                }

                else if(numberOfRowsColumns == 2){

                return 4; 
                } else {return %orig;}
            } else {return %orig;}
        } else {return %orig;}
    } else {return %orig;}


    
}

+ (unsigned long long)iconColumnsForInterfaceOrientation:(long long)arg1 {
    
    if(isEnabled){
        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){

                if (numberOfRowsColumns == 0){

                    return 2;
                }

                else if(numberOfRowsColumns == 1){

                    return %orig;
                }

                else if(numberOfRowsColumns == 2){

                return 4; 
                } else {return %orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){

                if(columns == 0){
                    return 2;
                } else if(columns == 1){
                    return 3;
                } else if(columns == 2){
                    return 4;
                } else if(columns == 3){
                    return 5;
                } else if(columns == 4){
                    return 6;
                } else if(columns == 5){
                    return 7;
                } else {return %orig;}

            } else if(enableCustomPremadeLayout && enableCustomCustomLayout){
                if (numberOfRowsColumns == 0){

                    return 2;
                }

                else if(numberOfRowsColumns == 1){

                    return %orig;
                }

                else if(numberOfRowsColumns == 2){

                return 4; 
                } else {return %orig;}
            } else {return %orig;}
        } else {return %orig;}
    } else {return %orig;}
}

- (CGFloat)topIconInset {

    CGFloat orig = %orig;

    if(isEnabled){

        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){

                if (numberOfRowsColumns == 0){

                    return orig*1.5;
                }

                else if(numberOfRowsColumns == 1){

                    return orig;
                }

                else if(numberOfRowsColumns == 2){

                return orig*0.5;
                } else {return %orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){
                if(rows == 0){
                    return orig*1.5;
                } else {return orig;}
            } else if(enableCustomPremadeLayout && enableCustomCustomLayout){
                if (numberOfRowsColumns == 0){

                    return orig*1.5;
                }

                else if(numberOfRowsColumns == 1){

                    return orig;
                }

                else if(numberOfRowsColumns == 2){

                return orig*0.5;
                } else {return %orig;}
            } else {return orig;}
        } else {return orig;}
    } else {return orig;}
}

- (CGFloat)sideIconInset {

    CGFloat orig = %orig;
    if(isEnabled){

        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){

                if (numberOfRowsColumns == 0){

                    return orig*1.5;
                }

                else if(numberOfRowsColumns == 1){

                    return orig;
                }

                else if(numberOfRowsColumns == 2){

                    return orig*1.5;
                } else {return %orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){
                if(columns == 0){
                    return orig*1.5;
                } else {return orig;}
            } else if(enableCustomPremadeLayout && enableCustomCustomLayout){
                if (numberOfRowsColumns == 0){

                    return orig*1.5;
                }

                else if(numberOfRowsColumns == 1){

                    return orig;
                }

                else if(numberOfRowsColumns == 2){

                    return orig*1.5;
                } else {return %orig;}
            } else {return orig;}
        } else {return orig;}
    } else {return orig;}
}

- (CGFloat)verticalIconPadding {

    CGFloat orig = %orig;
    if(isEnabled){

        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){

                if (numberOfRowsColumns == 0){

                    return orig/1.5;
                }

                else if(numberOfRowsColumns == 1){

                    return orig;
                }

                else if(numberOfRowsColumns == 2){

                    return orig/1.5;
                } else {return %orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){
                if (rows == 0 && columns == 0){
                    return orig/1.5;
                } else if(rows != 0 && columns == 0){
                    return orig/1.5;
                } else if(rows == 0 && columns != 0){
                    return orig/1.5;
                } else {return orig;}
            } else {return orig;}
        } else {return orig;}
    } else {return orig;}
}

%end

//folder icon grid
%hook SBIconGridImage

+ (CGSize)cellSize {
    CGSize orig = %orig;
    if(isEnabled){
        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){
                if(numberOfRowsColumns == 0){
                    return CGSizeMake(orig.width * 1.5, orig.height);
                } else {return orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){
                if(rows == 0 && columns == 0){
                    return CGSizeMake(orig.width * 1.5, orig.height);
                } else if(rows != 0 && columns == 0){
                    return CGSizeMake(orig.width, orig.height *0.75);
                } else if(rows == 0 && columns != 0){
                    return CGSizeMake(orig.width, orig.height*0.75);
                } else {return orig;}
            } else if(enableCustomPremadeLayout && enableCustomCustomLayout){
                return CGSizeMake(orig.width * 1.5, orig.height);
            } else {return %orig;}
        } else {return orig;}
    } else {return orig;}
}


+ (unsigned long long)numberOfColumns {
    if(isEnabled){
        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){
                if(numberOfRowsColumns == 0){
                    return 2;
                } else {return %orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){
                if(rows == 0 && columns == 0){
                    return 2;
                } else {return %orig;}
            } else {return %orig;}
        } else {return %orig;}
    } else {return %orig;}
}

+ (unsigned long long)numberOfRowsForNumberOfCells:(unsigned long long)arg1 {
    if(isEnabled){
        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){
                if(numberOfRowsColumns == 0){
                    if (arg1 >= 3){
                        return 2;
                    } else {return 1;}
                } else {return %orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){
                if(rows == 0 && columns == 0){
                    return 2;
                } else {return %orig;}
            } else {return %orig;}
        } else {return %orig;}
    } else {return %orig;}
}

+ (CGSize)cellSpacing {
    CGSize orig = %orig;
    if(isEnabled){
        if(enableCustomLayout){
            if(enableCustomPremadeLayout && !enableCustomCustomLayout){
                if(numberOfRowsColumns == 0){
                    return CGSizeMake(orig.width * 1.5, orig.height);
                } else {return orig;}
            } else if(!enableCustomPremadeLayout && enableCustomCustomLayout){
                if(rows == 0 && columns == 0){
                    return CGSizeMake(orig.width * 1.5, orig.height);
                } else {return orig;}
            } else {return orig;}
        } else {return orig;}
    } else {return orig;}
}

%end

%hook SBFolderBackgroundView

-(void)layoutSubviews {
    
    UIColor *selectedColor2 = [UIColor cscp_colorFromHexString:customFolderBackgroundColor];

    NSArray<id> *gradientColors2 = [StringForPreferenceKey(@"customGradientFolderBackgroundColor") cscp_gradientStringCGColors];
    
    if(isEnabled){
        
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.bounds;

        if(verticalFolderGradient){
            gradient.startPoint = CGPointMake(0.5, 0);
            gradient.endPoint = CGPointMake(0.5, 1);
        } else {
            gradient.startPoint = CGPointMake(0, 0.5);
            gradient.endPoint = CGPointMake(1, 0.5);
        }

        gradient.colors = gradientColors2;

           if(enableFolderBackgroundColor){

            if(folderBackgroundColor && !gradientFolderBackgroundColor){
                [self setBackgroundColor:selectedColor2];
            }

            if(!folderBackgroundColor && gradientFolderBackgroundColor){
                [self.layer insertSublayer:gradient atIndex:0];
            }

            if(!folderBackgroundColor && !gradientFolderBackgroundColor){
                %orig;
            }

            if(folderBackgroundColor && gradientFolderBackgroundColor){
                [self setBackgroundColor:selectedColor2];
            }

        } else {
            %orig;
        }
    } else {
        %orig;
    }


}

%end

%hook SBIconListPageControl

-(void)layoutSubviews {

    if(isEnabled){
        if(hidePageDots){
            [self setHidden:YES];
        } else {%orig;}
    } else {%orig;}

}

%end

%hook SBFolderTitleTextField

-(void)layoutSubviews{

    %orig;
    UIColor *selectedColor3 = [UIColor cscp_colorFromHexString:customTextColor];
    UIColor *selectedColor4 = [UIColor cscp_colorFromHexString:colorBackgroundTitle];

    if(isEnabled){
        if(enableTextColor){
            [self setTextColor:selectedColor3];
        }

        if(titleTextAlignment == 0){
            [self setTextAlignment:NSTextAlignmentLeft];
        } else if(titleTextAlignment == 1){

        } else if(titleTextAlignment == 2){
            [self setTextAlignment:NSTextAlignmentRight];
        }

        if(enableBackgroundTitle){
            [self setBackgroundColor:selectedColor4];
            [self.layer setMasksToBounds:true];
            [self.layer setCornerRadius:cornerRadiusBackgroundTitle];
        }
        
    } else {}

}

%end
%end

%ctor {
	prefs();
    %init(all);
}