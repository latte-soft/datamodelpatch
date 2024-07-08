local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_LinkButton_0 = v4.App.Button.LinkButton;
local l_ContextualMenu_0 = v4.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v4.App.Menu.MenuDirection;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_CorePackages_0.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useUiModeInfo_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useUiModeInfo;
local v17 = require(l_Modules_0.LuaApp.FitChildren);
local v18 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v19 = require(l_Modules_0.LuaApp.AppPage);
local v20 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v21 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v4.Style.withStyle;
local v23 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v24 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v25 = require(script.Parent.DisclaimerLinkButtons);
local v26 = game:DefineFastFlag("UseLowDensityLinkButtons", false);
local v27 = v2.PureComponent:extend("DisclaimerLinks");
v27.init = function(v28)
    v28.openDisclaimerLink = function(v29)
        if not v28.props.useExternalBrowserForDisclaimerLinks then
            v28.props.navigateDown({
                name = v19.GenericWebPage, 
                detail = v29, 
                extraProps = {
                    title = "", 
                    transitionAnimation = v20.SlideInFromRight
                }
            });
            return ;
        else
            v23(v28.props.linking, v29);
            return ;
        end;
    end;
    v28.openTermsLink = function()
        v28.openDisclaimerLink((v24.static.about.terms()));
    end;
    v28.openPrivacyLink = function()
        v28.openDisclaimerLink((v24.static.about.privacy()));
    end;
end;
v27.render = function(v30)
    local l_isDualLayout_0 = v30.props.isDualLayout;
    local l_LoginView_0 = v30.props.tokens.LuaApps.LoginView;
    local v33 = not l_LoginView_0 and 4 or l_LoginView_0.boxPadding;
    return v21({
        termsOfUseText = "CommonUI.Features.Label.Terms", 
        termsOfUseTextLong = "CommonUI.Features.Label.TermsOfUse", 
        privacyPolicyText = "CommonUI.Features.Label.Privacy", 
        privacyPolicyTextLong = "CommonUI.Features.Label.PrivacyPolicy"
    })(function(v34)
        return l_withStyle_0(function(v35)
            local v36 = v30.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
            local l_LayoutOrder_0 = v30.props.LayoutOrder;
            local l_BaseSize_0 = v35.Font.BaseSize;
            local v39 = if not l_isDualLayout_0 then v34.termsOfUseText else v34.termsOfUseTextLong;
            local v40 = if not l_isDualLayout_0 then "<b>" .. v34.privacyPolicyText .. "</b>" else v34.privacyPolicyTextLong;
            local l_Font_0 = v35.Font.Header2.Font;
            local v42 = l_Text_0.GetTextWidth(" ", l_Font_0, l_BaseSize_0) / 2;
            local v43 = l_Text_0.GetTextWidth("-", l_Font_0, l_BaseSize_0);
            local v44 = l_Text_0.GetTextHeight(v34.privacyPolicyText, l_Font_0, l_BaseSize_0) + v33;
            if l_isDualLayout_0 then
                v44 = 2 * (l_Text_0.GetTextHeight(v34.privacyPolicyText, l_Font_0, l_BaseSize_0) + 2 * v33);
            end;
            local v45 = if not l_isDualLayout_0 then v17.FitFrame else "Frame";
            local function v46()
                return {
                    Image = v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, l_LoginView_0.disclaimerIconSize, 0, l_LoginView_0.disclaimerIconSize), 
                        Position = UDim2.fromOffset(0, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = l_LoginView_0.linkIcon, 
                        ImageColor3 = v35.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0
                    })
                };
            end;
            if not v26 or not v36 then
                return v2.createElement(v45, {
                    fitAxis = if l_isDualLayout_0 then nil else v17.FitAxis.Width, 
                    Size = UDim2.new(1, 0, 0, v44), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_LayoutOrder_0
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        Padding = UDim.new(0, v42), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = if not l_isDualLayout_0 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical, 
                        HorizontalAlignment = if not l_isDualLayout_0 then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    ContextualMenu = if not l_isDualLayout_0 then nil else v2.createElement(l_ContextualMenu_0, {
                        buttonProps = {
                            {
                                text = v39, 
                                fontStyle = v35.Font.Header1, 
                                onActivated = v30.openTermsLink, 
                                rightSideGadgetSize = Vector2.new(l_LoginView_0.disclaimerIconSize + l_LoginView_0.disclaimerPadding, l_LoginView_0.disclaimerIconSize), 
                                renderRightSideGadget = v46
                            }, 
                            {
                                text = v40, 
                                fontStyle = v35.Font.Header1, 
                                onActivated = v30.openPrivacyLink, 
                                rightSideGadgetSize = Vector2.new(l_LoginView_0.disclaimerIconSize + l_LoginView_0.disclaimerPadding, l_LoginView_0.disclaimerIconSize), 
                                renderRightSideGadget = v46
                            }
                        }, 
                        open = true, 
                        stayOnActivated = true, 
                        isElementBackgroundVisible = false, 
                        isElementDividerVisible = false, 
                        closeBackgroundVisible = false, 
                        topElementRounded = false, 
                        bottomElementRounded = false, 
                        horizontalAlignment = Enum.HorizontalAlignment.Center, 
                        menuDirection = l_MenuDirection_0.Down, 
                        contextMenuWidthOverride = UDim.new(1, 0), 
                        elementHeight = l_LoginView_0.disclaimerElementHeight, 
                        openPositionX = UDim.new(0, 0), 
                        openPositionY = UDim.new(0, 0), 
                        screenSize = Vector2.new(0, 0)
                    }), 
                    TermsOfUse = if l_isDualLayout_0 then nil else v2.createElement(l_LinkButton_0, {
                        text = v39, 
                        size = if not l_isDualLayout_0 then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0.5, 0), 
                        fontStyle = "Header2", 
                        layoutOrder = 1, 
                        underlineAlwaysEnabled = true, 
                        onActivated = v30.openTermsLink
                    }), 
                    Hyphen = if l_isDualLayout_0 then nil else v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = "-", 
                        Size = UDim2.new(0, v43, 1, 0), 
                        Font = l_Font_0, 
                        TextColor3 = v35.Theme.TextEmphasis.Color, 
                        TextTransparency = v35.Theme.TextEmphasis.Transparency, 
                        TextSize = l_BaseSize_0, 
                        LayoutOrder = 2
                    }), 
                    PrivacyPolicy = if l_isDualLayout_0 then nil else v2.createElement(l_LinkButton_0, {
                        text = v40, 
                        size = if not l_isDualLayout_0 then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0.5, 0), 
                        fontStyle = "Header2", 
                        layoutOrder = 3, 
                        underlineAlwaysEnabled = true, 
                        onActivated = v30.openPrivacyLink
                    })
                });
            else
                return v2.createElement(v25, {
                    textTos = v39, 
                    activatedTos = v30.openTermsLink, 
                    textPrivacy = v40, 
                    activatedPrivacy = v30.openPrivacyLink, 
                    fillDirection = v30.props.fillDirection, 
                    layoutOrder = l_LayoutOrder_0, 
                    tokens = l_LoginView_0
                });
            end;
        end);
    end);
end;
local v52 = l_RoactServices_0.connect({
    linking = l_AppLinking_0
})((l_RoactAppPolicy_0.connect(function(v47)
    return {
        useExternalBrowserForDisclaimerLinks = v47.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)((v3.connect(function(_, _)
    return {};
end, function(v50)
    return {
        navigateDown = function(v51)
            return v50(v18(v51));
        end
    };
end)(v27)))));
return function(v53)
    return v2.createElement(v52, v13.Dictionary.join({
        tokens = l_useDesignTokens_0(), 
        uiModeInfo = l_useUiModeInfo_0()
    }, v53));
end;
