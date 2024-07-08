local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.withLocalization);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_DividerWithText_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiSharedComponents).DividerWithText;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagCrossDeviceInstructionExperiment);
local v12 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCorrectedLoginInstructions);
local l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableMaquettesShortLinkCDLInstructions;
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableQRCodeDisableForDualLayout);
local l_GetFFlagUseLargerCDLCodeFontForVR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseLargerCDLCodeFontForVR;
local v17 = require(l_Modules_0.LuaApp.FitChildren);
local v18 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_getIconSizeUDim2_0 = v4.App.ImageSet.getIconSizeUDim2;
local v23 = l_Images_0["icons/graphic/lock_xxlarge"];
local v24 = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
local v25 = (l_getIconSize_0(l_IconSize_0.XLarge) * 4) / 3;
return function(v26)
    local l_isDualLayout_0 = v26.isDualLayout;
    local l_hideDeviceCode_0 = v26.hideDeviceCode;
    local l_showLockIcon_0 = v26.showLockIcon;
    local v30 = l_useDesignTokens_0();
    local l_LoginView_0 = v30.LuaApps.LoginView;
    local l_EngagementScreen_0 = v30.LuaApps.EngagementScreen;
    return l_withStyle_0(function(v33)
        local l_DeviceCode_0 = v26.DeviceCode;
        local l_Font_0 = v33.Font.Title.Font;
        local l_Font_1 = v33.Font.Body.Font;
        local l_BaseSize_0 = v33.Font.BaseSize;
        local v38 = if not l_GetFFlagUseLargerCDLCodeFontForVR_0() then l_LoginView_0.textHeaderSize or l_BaseSize_0 * v33.Font.Title.RelativeSize else l_LoginView_0.cdlDeviceCodeSize or l_BaseSize_0 * v33.Font.Title.RelativeSize;
        local v39 = l_LoginView_0.textBodySize or l_BaseSize_0 * v33.Font.Body.RelativeSize;
        local v40 = if not l_isDualLayout_0 then l_BaseSize_0 * v33.Font.CaptionBody.RelativeSize else l_LoginView_0.textSmallSize;
        local v41 = l_LoginView_0.qrWidth or v25;
        local v42 = UDim2.fromOffset(v41, v41);
        local l_Transparency_0 = v33.Theme.TextEmphasis.Transparency;
        local l_Color_0 = v33.Theme.TextEmphasis.Color;
        local v45 = (v12() and v26.QrCodeUrl) and not v26.DisableQrCode;
        local v46 = not v26.DisableQrCode;
        if v26.isDualLayout then
            v45 = v26.QrCodeUrl and not v26.DisableQrCode;
        end;
        local v47 = nil;
        v47 = if not v45 then v38 * 1.5 else v38 * 0.75;
        local l_leftAlignText_0 = v26.leftAlignText;
        return v3({
            alertTitle = "Authentication.CrossDevice.Heading.LoginCode", 
            devicePrompt = "Authentication.CrossDevice.Label.DevicePrompt", 
            loginInstructions = "Authentication.CrossDevice.Label.LoginInstructions", 
            loginInstructionsV2 = "Authentication.CrossDevice.Label.LoginInstructionsV2", 
            loginLocation = "Authentication.CrossDevice.Label.LoginLocation", 
            loginLocationV2 = "Authentication.CrossDevice.Label.LoginLocationV2", 
            qrHeader = "Authentication.CrossDevice.Label.QrHeader", 
            qrHeaderDualLayout = "Authentication.CrossDevice.Label.QrCodeLogin", 
            qrInstructions = "Authentication.CrossDevice.Label.QrInstructions", 
            codeHeader = "Authentication.CrossDevice.Label.CodeHeader", 
            codeHeaderDualLayout = "Authentication.CrossDevice.Action.LoginWithDevice", 
            orYouCan = "CommonUI.Features.Labels.OrYouCan", 
            confirmAndLoginAs = "Authentication.CrossDevice.Label.ConfirmAndLoginAs", 
            qrCodeError = "Authentication.CrossDevice.Label.QrCodeError", 
            shortlinkLoginInstructions = "Authentication.CrossDevice.Label.QuestCDLShortLinkInstruction"
        })(function(v49)
            local v50 = v11();
            local v51 = (v50 and v26.AltMobileInstruction) and v26.AltDesktopInstruction;
            local v52 = not not v50 and v26.AltTitle or if l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0() and l_IsVRAppBuild_0() then v49.shortlinkLoginInstructions else v49.devicePrompt;
            local v53 = not not v50 and v26.AltInstruction or if v13() then v49.loginInstructionsV2 else v49.loginInstructions;
            local v54 = nil;
            local v55 = nil;
            local v56 = nil;
            local v57 = nil;
            local v58 = if not v15() then l_isDualLayout_0 else l_isDualLayout_0 and v46;
            if not v58 then
                if not v45 then
                    v54 = 2;
                    v55 = 4;
                else
                    v56 = 2;
                    v57 = 3;
                    v54 = 5;
                    v55 = 6;
                end;
            else
                v56 = 3;
                v57 = 2;
                v54 = 6;
                v55 = 5;
            end;
            local v59 = if not l_isDualLayout_0 then v49.qrHeader else v49.qrHeaderDualLayout;
            local v60 = if not l_isDualLayout_0 then v49.codeHeader else v49.codeHeaderDualLayout;
            local v61 = nil;
            v61 = if not v26.showConfirmLoginText then v49.qrInstructions else string.format(v49.confirmAndLoginAs, v26.DisplayName);
            local l_createFragment_0 = v2.createFragment;
            local v63 = {
                QrHeader = if v58 or v45 then v2.createElement("TextLabel", {
                    Text = "<b>" .. v59 .. "</b>", 
                    RichText = true, 
                    Font = l_Font_1, 
                    TextSize = v39, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextWrapped = true, 
                    TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }) else nil, 
                HeaderIcon = if not l_showLockIcon_0 or v45 then nil else v2.createElement(l_ImageSetLabel_0, {
                    Size = if not v26.isDualLayout then v24 else v42, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v23, 
                    ImageColor3 = v33.Theme.UIEmphasis.Color, 
                    ImageTransparency = 0
                }), 
                QrErrorPadding = if not v58 or v45 then nil else v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, l_LoginView_0.qrErrorPadding), 
                    LayoutOrder = 3
                }), 
                QrImageFrame = v45 and v2.createElement("Frame", {
                    Size = v42, 
                    BackgroundColor3 = Color3.fromHex("#FFFFFF"), 
                    BackgroundTransparency = 0, 
                    LayoutOrder = v56
                }, {
                    QrImage = v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = v26.QrCodeUrl, 
                        ImageColor3 = v33.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0
                    }), 
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingBottom = if not l_isDualLayout_0 then UDim.new(0, 4) else l_LoginView_0.qrPadding, 
                        PaddingLeft = if not l_isDualLayout_0 then UDim.new(0, 4) else l_LoginView_0.qrPadding, 
                        PaddingRight = if not l_isDualLayout_0 then UDim.new(0, 4) else l_LoginView_0.qrPadding, 
                        PaddingTop = if not l_isDualLayout_0 then UDim.new(0, 4) else l_LoginView_0.qrPadding
                    })
                }), 
                QrInstructions = v45 and v2.createElement("TextLabel", {
                    Text = v61, 
                    Font = l_Font_1, 
                    TextSize = v40, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextWrapped = true, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                    TextYAlignment = if not not l_isDualLayout_0 and l_hideDeviceCode_0 then Enum.TextYAlignment.Top else nil, 
                    Size = if not not l_isDualLayout_0 and l_hideDeviceCode_0 then UDim2.new(1, 0, 0, 48) else UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v57
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingTop = if not l_isDualLayout_0 or l_hideDeviceCode_0 then nil else UDim.new(0, v30.Global.Space_200), 
                        PaddingBottom = if not l_isDualLayout_0 or l_hideDeviceCode_0 then if l_isDualLayout_0 and l_hideDeviceCode_0 then UDim.new(0, v30.Global.Space_200) else UDim.new(0, 24) else UDim.new(0, v30.Global.Space_300)
                    })
                }), 
                Divider = if not v58 or l_hideDeviceCode_0 then nil else v2.createElement(l_DividerWithText_0, {
                    layoutOrder = 4, 
                    width = 0, 
                    height = 0, 
                    size = UDim2.new(1, 0, 0, l_LoginView_0.dividerPadding * 2 + l_LoginView_0.dividerSize), 
                    font = l_Font_1, 
                    fontSize = v30.Semantic.Typography.Footer.FontSize, 
                    color3 = v30.Semantic.Color.Text.Muted.Color3, 
                    transparency = v30.Semantic.Color.Text.Muted.Transparency, 
                    text = v49.orYouCan, 
                    padding = l_EngagementScreen_0.dividerPadding
                }), 
                CodeHeader = if not (v58 or v45) or l_hideDeviceCode_0 then nil else v2.createElement("TextLabel", {
                    Text = "<b>" .. v60 .. "</b>", 
                    RichText = true, 
                    Font = l_Font_1, 
                    TextSize = v39, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                })
            };
            local v64;
            if l_hideDeviceCode_0 then
                v64 = nil;
            else
                v64 = v2.createElement;
                local v65 = "TextLabel";
                local v66 = {
                    Text = l_DeviceCode_0, 
                    Font = l_Font_0, 
                    TextSize = v38, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                    Size = UDim2.new(1, 0, 0, v47), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v54
                };
                local v67 = {};
                local v68 = false;
                if l_DeviceCode_0 == "" then
                    v68 = v2.createElement(l_LoadingSpinner_0, {
                        position = UDim2.new(0.5, 0, 0.5, 0), 
                        size = UDim2.new(0, v47, 0, v47), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    });
                end;
                v67.Spinner = v68;
                v64 = v64(v65, v66, v67);
            end;
            v63.CodeDisplay = v64;
            v63.DevicePrompt = (not v45 and not l_hideDeviceCode_0) and v2.createElement(v18, {
                Text = if not v58 then v52 else v49.qrCodeError, 
                Font = l_Font_1, 
                RichText = l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0() and l_IsVRAppBuild_0(), 
                TextSize = if not l_isDualLayout_0 then v39 else v40, 
                TextColor3 = l_Color_0, 
                TextTransparency = l_Transparency_0, 
                TextWrapped = true, 
                TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                AutomaticSize = if not l_isDualLayout_0 then nil else Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                fitAxis = v17.FitAxis.Height, 
                LayoutOrder = not l_isDualLayout_0 and 3 or 2
            }, {
                UIPadding = if not l_isDualLayout_0 then nil else v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v30.Global.Space_200)
                })
            });
            v63.Instructions = if not not l_GetFFlagEnableMaquettesShortLinkCDLInstructions_0() and l_IsVRAppBuild_0() or l_hideDeviceCode_0 then nil else v2.createElement(v17.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v17.FitAxis.Height, 
                LayoutOrder = v55, 
                BackgroundTransparency = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, not v51 and 0 or 12)
                }), 
                UIPadding = if not l_isDualLayout_0 then nil else v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v30.Global.Space_200), 
                    PaddingBottom = UDim.new(0, v30.Global.Space_200)
                }), 
                InstructionText = v2.createElement(v18, {
                    Text = v53, 
                    Font = l_Font_1, 
                    TextSize = v40, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    fitAxis = v17.FitAxis.Height, 
                    LayoutOrder = 1
                }), 
                LocationText = not v51 and v2.createElement(v18, {
                    Text = if not v13() then v49.loginLocation else v49.loginLocationV2, 
                    RichText = true, 
                    Font = l_Font_1, 
                    TextSize = v40, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    TextWrapped = true, 
                    TextXAlignment = if not l_leftAlignText_0 then nil else Enum.TextXAlignment.Left, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    fitAxis = v17.FitAxis.Height, 
                    LayoutOrder = 2
                }), 
                LocationList = v51 and v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -48, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    List = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 4)
                    }), 
                    Mobile = v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        Text = v26.AltMobileInstruction, 
                        RichText = true, 
                        Font = l_Font_1, 
                        TextSize = v40, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }), 
                    Desktop = v2.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        Text = v26.AltDesktopInstruction, 
                        RichText = true, 
                        Font = l_Font_1, 
                        TextSize = v40, 
                        TextColor3 = l_Color_0, 
                        TextTransparency = l_Transparency_0, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            });
            return l_createFragment_0(v63);
        end);
    end);
end;
