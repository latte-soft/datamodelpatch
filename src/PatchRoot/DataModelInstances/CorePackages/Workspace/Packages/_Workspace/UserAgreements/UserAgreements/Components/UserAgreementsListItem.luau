local v0 = require(script.Parent.Parent.dependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_RobloxAppEnums_0 = v0.RobloxAppEnums;
local l_AppPage_0 = l_RobloxAppEnums_0.AppPage;
local l_RoactServices_0 = v0.RoactServices.RoactServices;
local l_AppLinking_0 = v0.RoactServiceTags.AppLinking;
local l_NavigateDown_0 = v0.NavigationRodux.Thunks.NavigateDown;
local l_NotificationType_0 = l_RobloxAppEnums_0.NotificationType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ArgCheck_0 = v0.ArgCheck;
local v13 = require(script.Parent.DEPRECATED_ImageSetLabel);
local l_withLocalization_0 = v0.Localization.withLocalization;
local l_FFlagEnableModularizedUserAgreementsList_0 = v0.SharedFlags.FFlagEnableModularizedUserAgreementsList;
local l_RoactAppPolicy_0 = v0.UniversalAppPolicy.RoactAppPolicy;
local l_FitFrame_0 = v0.FitFrame;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v20 = l_Roact_0.PureComponent:extend("UserAgreementsListItem");
v20.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    Size = l_t_0.UDim2, 
    agreement = l_t_0.strictInterface({
        id = l_t_0.string, 
        agreementType = l_t_0.string, 
        clientType = l_t_0.string, 
        displayUrl = l_t_0.string, 
        regulationType = l_t_0.string
    }), 
    margin = l_t_0.optional(l_t_0.strictInterface({
        top = l_t_0.integer, 
        right = l_t_0.integer, 
        bottom = l_t_0.integer, 
        left = l_t_0.integer
    })), 
    navigateDown = l_t_0.callback, 
    agreementTypeExists = l_t_0.optional(l_t_0.boolean), 
    useExternalBrowserForDisclaimerLinks = l_t_0.optional(l_t_0.boolean), 
    linking = l_t_0.optional(l_t_0.table), 
    hideLink = l_t_0.optional(l_t_0.boolean), 
    checkBoxPresent = l_t_0.optional(l_t_0.boolean)
});
v20.defaultProps = {
    margin = l_FitFrame_0.Rect.square(0), 
    agreementTypeExists = false
};
openExternalBrowser = function(v21, v22)
    l_ArgCheck_0.isNotNil(v21, "linking");
    l_ArgCheck_0.isType(v22, "string", "url");
    v21:openURL(v22);
end;
v20.init = function(v23)
    local v24, v25 = l_Roact_0.createBinding(false);
    v23.buttonPressed = v24;
    v23.updateButtonPressed = v25;
    v23.onButtonInputBegan = function(_, v27)
        if not (v27.UserInputType ~= Enum.UserInputType.Touch) or v27.UserInputType == Enum.UserInputType.MouseButton1 then
            if not v23.buttonPressed:getValue() then
                v23.updateButtonPressed(true);
            else
                return ;
            end;
        end;
    end;
    v23.onButtonInputEnded = function()
        if v23.buttonPressed:getValue() then
            v23.updateButtonPressed(false);
        end;
    end;
    v23.showLinkText = function()
        if not l_FFlagEnableModularizedUserAgreementsList_0 then
            return not v23.props.agreementTypeExists;
        else
            return not v23.props.hideLink and not v23.props.agreementTypeExists;
        end;
    end;
end;
v20.renderWithProviders = function(v28, v29, v30)
    local l_LayoutOrder_0 = v28.props.LayoutOrder;
    local l_Size_0 = v28.props.Size;
    local l_margin_0 = v28.props.margin;
    local l_agreement_0 = v28.props.agreement;
    local l_Font_0 = v30.Font;
    local l_Theme_0 = v30.Theme;
    local l_Tokens_0 = v30.Tokens;
    local v38 = -((l_margin_0.left + l_margin_0.right) + 14);
    local v39 = if not l_FFlagEnableModularizedUserAgreementsList_0 then l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize else l_Tokens_0.Global.FontSize_100;
    local v40 = 20 / v39;
    local v41 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
    local v42 = 14 / v41;
    local v43 = v28.props.checkBoxPresent or false;
    local l_displayUrl_0 = l_agreement_0.displayUrl;
    local l_agreementTitle_0 = v29.agreementTitle;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    if not l_FFlagEnableModularizedUserAgreementsList_0 then
        v46 = v13;
        v47 = 1;
        v48 = "LuaApp/icons/navigation/pushRight_small";
    else
        v46 = l_ImageSetLabel_0;
        v47 = 3;
        v48 = l_Images_0["icons/navigation/pushRight"];
    end;
    return l_Roact_0.createElement("ImageButton", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        AutoButtonColor = false, 
        BackgroundColor3 = v30.Theme.BackgroundOnPress.Color, 
        BackgroundTransparency = v28.buttonPressed:map(function(v49)
            return not not v49 and v30.Theme.BackgroundOnPress.Transparency or 1;
        end), 
        BorderSizePixel = 0, 
        [l_Roact_0.Event.InputBegan] = v28.onButtonInputBegan, 
        [l_Roact_0.Event.InputEnded] = v28.onButtonInputEnded, 
        [l_Roact_0.Event.Activated] = function()
            if not v28.props.useExternalBrowserForDisclaimerLinks then
                v28.props.navigateDown({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = l_displayUrl_0, 
                    extraProps = {
                        title = l_agreementTitle_0, 
                        notificationType = l_NotificationType_0.OPEN_CUSTOM_WEBVIEW
                    }
                });
                return ;
            else
                openExternalBrowser(v28.props.linking, l_displayUrl_0);
                return ;
            end;
        end
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_margin_0.top), 
            PaddingBottom = UDim.new(0, l_margin_0.bottom), 
            PaddingLeft = UDim.new(0, l_margin_0.left), 
            PaddingRight = if not not l_FFlagEnableModularizedUserAgreementsList_0 and v43 then UDim.new(0, l_margin_0.right * 2) else UDim.new(0, 0)
        }), 
        TextLayout = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, v38, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TitleText = l_Roact_0.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(not l_FFlagEnableModularizedUserAgreementsList_0 and 1 or 0.9, 0, 0, not l_FFlagEnableModularizedUserAgreementsList_0 and 20 or 40), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_agreementTitle_0, 
                Font = if not l_FFlagEnableModularizedUserAgreementsList_0 then l_Font_0.Header2.Font else l_Font_0.Body.Font, 
                TextSize = v39, 
                LineHeight = v40, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = not not l_FFlagEnableModularizedUserAgreementsList_0 or false, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            LinkText = not not v28.showLinkText() and l_Roact_0.createElement("TextLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_displayUrl_0, 
                Font = l_Font_0.Header2.Font, 
                TextSize = v41, 
                LineHeight = v42, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = 0.5, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or nil
        }), 
        RightImage = (function(v50, v51, v52)
            return l_Roact_0.createElement(v50, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0, 14 * v51, 0, 14 * v51), 
                Position = UDim2.new(1, -l_margin_0.right, 0.5, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v52, 
                ImageColor3 = if not l_FFlagEnableModularizedUserAgreementsList_0 then l_Theme_0.SecondaryDefault.Color else l_Theme_0.UIEmphasis.Color, 
                ImageTransparency = if not l_FFlagEnableModularizedUserAgreementsList_0 then l_Theme_0.SecondaryDefault.Transparency else 0
            });
        end)(v46, v47, v48)
    });
end;
v20.render = function(v53)
    return l_withLocalization_0({
        agreementTitle = not not v53.props.agreementTypeExists and "CommonUI.UserAgreements.Popup.Agreement." .. v53.props.agreement.agreementType or "CommonUI.UserAgreements.Popup.DefaultAgreementTitle"
    })(function(v54)
        return l_withStyle_0(function(v55)
            return v53:renderWithProviders(v54, v55);
        end);
    end);
end;
return (l_RoactRodux_0.connect(nil, function(v56)
    return {
        navigateDown = function(v57)
            v56(l_NavigateDown_0(v57));
        end
    };
end)((l_RoactServices_0.connect({
    linking = l_AppLinking_0
})((l_RoactAppPolicy_0.connect(function(v58)
    return {
        useExternalBrowserForDisclaimerLinks = v58.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)(v20))))));
