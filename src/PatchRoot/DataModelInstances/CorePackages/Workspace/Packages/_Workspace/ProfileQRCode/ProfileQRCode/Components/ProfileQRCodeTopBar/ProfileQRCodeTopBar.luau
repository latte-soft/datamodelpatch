local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactUtils);
local v8 = require(l_Parent_0.SocialCommon);
local v9 = require(l_Parent_0.UIBlox);
local v10 = require(l_Parent_0.UniversalAppPolicy);
local l_HeaderBar_0 = v9.App.Bar.HeaderBar;
local l_IconButton_0 = v9.App.Button.IconButton;
local l_IconSize_0 = v9.App.ImageSet.Enum.IconSize;
local l_Images_0 = v9.App.ImageSet.Images;
local l_TooltipOrientation_0 = v9.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = v9.App.Dialog.TooltipV2.withTooltip;
local l_makeBackButton_0 = require(l_Parent_0.AppHeaderBar).makeBackButton;
local l_ExternalEventConnection_0 = v7.ExternalEventConnection;
local l_InputUtilities_0 = v8.Utils.InputUtilities;
local v20 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v21 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v22 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useAppPolicy_0 = v10.useAppPolicy;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_Parent_0.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local function _(v26)
    v26 = v26 or l_AppStorageService_0;
    assert(v26 ~= nil, "AppStorageService is not nil");
    local l_status_0, l_result_0 = pcall(function()
        return v26:GetItem("QrCodeScannerTooltipSeen");
    end);
    if not l_status_0 or l_result_0 == nil then
        return false;
    else
        return l_result_0 == "true";
    end;
end;
local function _(v30, v31)
    v30 = v30 or l_AppStorageService_0;
    assert(v30 ~= nil, "AppStorageService is not nil");
    pcall(function()
        v30:SetItem("QrCodeScannerTooltipSeen", (tostring(v31)));
        v30:Flush();
    end);
end;
return function(v33)
    local v34 = v22();
    local v35 = l_useLocalization_0({
        title = v21.Title, 
        tooltipBodyText = v21.TooltipText, 
        tooltipHeaderText = v21.TooltipTitle
    });
    local v37 = l_useAppPolicy_0(function(v36)
        return v36.getFriendCodeQrCodeScannerEnabled();
    end);
    local v38, v39 = v6.useState(false);
    v6.useEffect(function()
        local v40 = v33.appStorageService or l_AppStorageService_0;
        assert(v40 ~= nil, "AppStorageService is not nil");
        local l_status_1, l_result_1 = pcall(function()
            return v40:GetItem("QrCodeScannerTooltipSeen");
        end);
        local v43;
        if not l_status_1 or l_result_1 == nil then
            v43 = false;
            --[[ close >= 1 ]]
        else
            v43 = l_result_1 == "true";
            --[[ close >= 1 ]]
        end;
        v39(not v43);
        if not v43 then
            v34.fireEvent(v20.QRCodeScannerTooltipShown);
        end;
    end, {});
    local v49 = v6.useCallback(function(v44)
        if not (not l_InputUtilities_0.isActivationInput(v44) or not v38) then
            v39(false);
            local v45 = v33.appStorageService or l_AppStorageService_0;
            assert(v45 ~= nil, "AppStorageService is not nil");
            local l_pcall_0 = pcall;
            local v47 = true;
            do
                local l_v45_0 = v45;
                l_pcall_0(function()
                    l_v45_0:SetItem("QrCodeScannerTooltipSeen", (tostring(v47)));
                    l_v45_0:Flush();
                end);
            end;
        end;
    end, {
        v38
    });
    local v50 = v6.useCallback(function()
        v34.fireEvent(v20.QRCodeScannerOpened);
        v33.openQrCodeScanner();
    end, {
        v33.openQrCodeScanner
    });
    local l_tooltipBodyText_0 = v35.tooltipBodyText;
    local l_tooltipHeaderText_0 = v35.tooltipHeaderText;
    return v6.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 56), 
        LayoutOrder = v33.layoutOrder, 
        ZIndex = 2
    }, {
        headerBar = v6.createElement(l_HeaderBar_0, {
            isSecondary = true, 
            title = v35.title, 
            backgroundTransparency = 1, 
            barHeight = 56, 
            renderLeft = if not l_GetFFlagUIBloxUseNewHeaderBar_0() then l_HeaderBar_0.renderLeft.backButton(v33.onClose) else l_makeBackButton_0(v33.onClose), 
            renderRight = if not v37 then nil else v6.useCallback(function()
                return l_withTooltip_0({
                    bodyText = l_tooltipBodyText_0, 
                    headerText = l_tooltipHeaderText_0
                }, {
                    active = v38, 
                    DisplayOrder = 10, 
                    guiTarget = l_CoreGui_0, 
                    preferredOrientation = l_TooltipOrientation_0.Bottom
                }, function(v53)
                    return v6.createElement(l_IconButton_0, {
                        icon = l_Images_0["icons/actions/scan"], 
                        iconSize = l_IconSize_0.Medium, 
                        onActivated = v50, 
                        size = UDim2.fromOffset(0, 0), 
                        onAbsolutePositionChanged = v53, 
                        [v6.Change.AbsoluteSize] = v53
                    }, {
                        InputBeganConnection = v6.createElement(l_ExternalEventConnection_0, {
                            event = l_UserInputService_0.InputBegan, 
                            callback = v49
                        })
                    });
                end);
            end, {
                v50, 
                v37, 
                v38, 
                l_tooltipBodyText_0, 
                l_tooltipHeaderText_0
            })
        })
    });
end;
