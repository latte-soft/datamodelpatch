local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v4 = require(l_CorePackages_0.UIBlox);
local l_GetFFlagUseLargerCDLCodeFontForVR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseLargerCDLCodeFontForVR;
local l_Images_0 = v4.App.ImageSet.Images;
return function(v7, v8)
    local v9 = {
        loginContentsPadding = 30, 
        marginY = 40, 
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
        linkAccountPadding = v8.Global.Space_200, 
        errorTextSize = v8.Global.FontSize_25, 
        errorTextPadding = v8.Global.Space_100, 
        disclaimerPadding = v8.Global.Space_300, 
        textboxLabelHeight = v8.Global.FontSize_200, 
        textboxTextSize = 16, 
        lockPadding = 98, 
        loginTextSize = v8.Global.FontSize_200, 
        qrPadding = UDim.new(0, v8.Global.Space_200), 
        dividerPadding = 0, 
        dividerSize = 0, 
        disclaimerIconSize = v8.Global.Size_350, 
        disclaimerIconPadding = v8.Global.Space_200, 
        disclaimerElementHeight = 84, 
        linkIcon = l_Images_0["icons/navigation/externallink_medium"], 
        qrErrorPadding = 280, 
        dualLayoutPadding = 140, 
        credentialPaddingRight = 100, 
        xOffset = 166, 
        textSmallSize = v8.Global.FontSize_100, 
        forgotLinkHeight = 30, 
        quickLinkCodeViewBottomPadding = v8.Global.Space_600, 
        quickLinkCodeViewTopPadding = v8.Global.Space_400, 
        quickLinkCodeViewCodeBoxHorizontalPadding = v8.Global.Space_200, 
        quickLinkCodeViewCodeBoxVertialPadding = v8.Global.Space_100, 
        quickLinkCodeViewCodeTextSize = v8.Global.Size_300
    };
    if not (v7.uiMode ~= l_UiMode_0.TenFoot) or v7.uiMode == l_UiMode_0.VR then
        v9.textboxHeight = v8.Global.Space_600;
        v9.textboxLabelPadding = v8.Global.Space_200;
        v9.continueButtonHeight = v8.Global.Space_600;
        v9.textHeaderSize = v8.Global.FontSize_200;
        v9.cdlDeviceCodeSize = if not not l_GetFFlagUseLargerCDLCodeFontForVR_0() and v7.uiMode == l_UiMode_0.VR then v8.Global.FontSize_1000 else v8.Global.FontSize_200;
        v9.textBodySize = v8.Global.FontSize_200;
        v9.loginContentsPadding = v8.Global.Space_400;
        v9.qrWidth = 280;
        v9.boxPadding = v8.Global.Space_200;
        v9.textboxTextSize = v8.Global.FontSize_100;
        v9.qrPadding = UDim.new(0, v8.Global.Space_400);
        v9.dividerPadding = v8.Global.Space_400;
        v9.dividerSize = v8.Global.Space_150;
        v9.dualLayoutPadding = v8.Global.Space_300;
        v9.credentialPaddingRight = v8.Global.Space_600;
        v9.errorTextSize = v8.Global.FontSize_100;
        v9.errorTextPadding = v8.Global.Space_100;
    end;
    return v9;
end;
