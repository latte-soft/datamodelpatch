local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Resources.FTUXSlideshowData);
local v7 = require(l_Parent_0.Components.Slideshow.Button);
local _ = require(l_Parent_0.Enums.PlatformEnum);
return function(v9)
    local v10 = l_useStyle_0();
    local l_Theme_0 = v10.Theme;
    local l_Font_0 = v10.Font;
    local v13 = v6[v9.platform];
    return l_withLocalization_0({
        footerText = "CoreScripts.VRFTUX.Label.Footer"
    })(function(v14)
        return v9.currentIndex ~= #v13 and v1.createElement(v7, {
            platform = v9.platform, 
            currentIndex = v9.currentIndex, 
            increaseCurrentIndex = v9.increaseCurrentIndex
        }) or v1.createElement(v2.App.Text.StyledTextLabel, {
            text = v14.footerText, 
            fontStyle = l_Font_0.CaptionHeader, 
            colorStyle = l_Theme_0.TextEmphasis, 
            textXAlignment = Enum.TextXAlignment.Center, 
            textYAlignment = Enum.TextYAlignment.Center, 
            size = UDim2.new(1, 0, 1, 0), 
            layoutOrder = 2
        });
    end);
end;
