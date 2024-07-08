local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
return function(v4, v5)
    local v6 = {
        marginTop = 0, 
        textboxHeight = 36, 
        textboxLabelPadding = 12, 
        textboxPaddingX = 10, 
        textboxPaddingY = 7, 
        continueButtonHeight = 48, 
        crossdeviceButtonHeight = 48, 
        qrWidth = 128, 
        thumbnailSize = 160, 
        spacerSize = 12, 
        boxPadding = 4, 
        buttonHeight = 36, 
        buttonTextSize = 16, 
        contentPadding = 5, 
        headerPadding = 1, 
        dropdownHeight = 72, 
        dropdownHorizontalPadding = 36, 
        dropdownVerticalPadding = 24, 
        dateDropdownWidth = 156
    };
    if not (v4.uiMode ~= l_UiMode_0.TenFoot) or v4.uiMode == l_UiMode_0.VR then
        v6.marginTop = v5.Global.Space_600;
        v6.textboxHeight = v5.Global.Space_600;
        v6.textHeaderSize = v5.Global.FontSize_600;
        v6.textCaptionHeaderSize = v5.Global.FontSize_200;
        v6.textBodySize = v5.Global.FontSize_100;
        v6.textSmallSize = v5.Global.FontSize_25;
        v6.signUpContentsPadding = v5.Global.Space_300;
        v6.boxPadding = v5.Global.Space_200;
        v6.buttonHeight = v5.Global.Size_600;
        v6.buttonTextSize = v5.Global.FontSize_200;
        v6.contentPadding = v5.Global.Space_300;
        v6.headerPadding = v5.Global.Space_200;
        v6.dropdownHeight = v5.Global.Size_600;
        v6.dropdownHorizontalPadding = v5.Global.Space_300;
        v6.dropdownVerticalPadding = v5.Global.Space_200;
        v6.dateDropdownWidth = v5.Global.Size_1300;
    end;
    return v6;
end;
