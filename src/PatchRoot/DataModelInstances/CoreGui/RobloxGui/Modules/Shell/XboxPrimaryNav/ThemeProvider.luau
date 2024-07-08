local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_Provider_0 = v2.Core.Style.Provider;
local l_DarkTheme_0 = v2.App.Style.Themes.DarkTheme;
local v5 = {
    BaseSize = 19.2, 
    Title = {
        Font = Enum.Font.SourceSansBold, 
        RelativeSize = 2, 
        RelativeMinSize = 1.5
    }, 
    Header1 = {
        Font = Enum.Font.SourceSansBold, 
        RelativeSize = 1.6875, 
        RelativeMinSize = 1.5
    }, 
    Header2 = {
        Font = Enum.Font.SourceSans, 
        RelativeSize = 1.5, 
        RelativeMinSize = 1.5
    }, 
    SubHeader1 = {
        Font = Enum.Font.SourceSans, 
        RelativeSize = 1, 
        RelativeMinSize = 0.75
    }, 
    Body = {
        Font = Enum.Font.SourceSans, 
        RelativeSize = 1, 
        RelativeMinSize = 0.75
    }, 
    CaptionHeader = {
        Font = Enum.Font.SourceSansSemibold, 
        RelativeSize = 0.9375, 
        RelativeMinSize = 1
    }, 
    CaptionSubHeader = {
        Font = Enum.Font.SourceSans, 
        RelativeSize = 0.75, 
        RelativeMinSize = 0.5625
    }, 
    CaptionBody = {
        Font = Enum.Font.SourceSansLight, 
        RelativeSize = 0.75, 
        RelativeMinSize = 0.5625
    }, 
    Footer = {
        Font = Enum.Font.SourceSans, 
        RelativeSize = 0.625, 
        RelativeMinSize = 0.5
    }
};
return function(v6)
    return v1.createElement(l_Provider_0, {
        style = {
            Font = v5, 
            Theme = l_DarkTheme_0
        }
    }, v6.children);
end;
