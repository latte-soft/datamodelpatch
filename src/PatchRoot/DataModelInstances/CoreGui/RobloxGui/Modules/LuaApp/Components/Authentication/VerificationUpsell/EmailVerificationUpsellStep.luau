local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_LinkButton_0 = v4.App.Button.LinkButton;
local l_PartialPageModal_0 = v4.App.Dialog.Modal.PartialPageModal;
local v9 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_AuthStatefulRoundCornerBorder_0 = v9.Components.AuthStatefulRoundCornerBorder;
local l_TextInputBoxWithBorder_0 = v9.Components.TextInputBoxWithBorder;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v14 = require(l_CorePackages_0.Cryo);
local v15 = require(l_Modules_0.LuaApp.FitChildren);
local v16 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_UserInputService_0 = game:GetService("UserInputService");
local v18 = require(script.Parent.EmailVerificationUpsellLink);
local v19 = v2.PureComponent:extend(script.Name);
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSizeUDim2_0 = v4.App.ImageSet.getIconSizeUDim2;
local v23 = l_Images_0["icons/graphic/lock_xxlarge"];
local v24 = l_getIconSizeUDim2_0(l_IconSize_0.XLarge);
v19.defaultProps = {
    shouldShowPrivacyPolicyLink = function()
        return false;
    end
};
v19.init = function(v25)
    v25.state = {
        onScreenKeyboardHeight = 0
    };
    v25.getLinks = function()
        return v2.createFragment((v14.List.map(v25.props.links, function(v26, v27)
            return v2.createElement(v18, {
                textKey = v26.textKey, 
                layoutOrder = v27, 
                onActivatedCallback = v26.onClicked, 
                isPrimaryLink = v26.isPrimaryLink
            });
        end)));
    end;
    v25.getButtonStackProps = function()
        local v28 = {};
        local l_primaryButtonText_0 = v25.props.primaryButtonText;
        local l_secondaryButtonText_0 = v25.props.secondaryButtonText;
        local l_onPrimaryButtonActivated_0 = v25.props.onPrimaryButtonActivated;
        local l_onSecondaryButtonActivated_0 = v25.props.onSecondaryButtonActivated;
        local l_isPrimaryButtonDisabled_0 = v25.state.isPrimaryButtonDisabled;
        if l_primaryButtonText_0 then
            v28 = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_onPrimaryButtonActivated_0, 
                        text = l_primaryButtonText_0, 
                        isDisabled = l_isPrimaryButtonDisabled_0
                    }
                }
            };
        end;
        if l_secondaryButtonText_0 then
            v28 = v14.List.join({
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = l_onSecondaryButtonActivated_0, 
                        text = l_secondaryButtonText_0
                    }
                }
            }, v28);
        end;
        return {
            buttonHeight = 48, 
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttons = v28
        };
    end;
end;
v19.didMount = function(v34)
    v34.keyboardVisibleChanged = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
        v34:setState({
            onScreenKeyboardHeight = not not l_UserInputService_0.OnScreenKeyboardVisible and l_UserInputService_0.OnScreenKeyboardSize.Y or 0
        });
    end);
end;
v19.willUnmount = function(v35)
    if v35.keyboardVisibleChanged then
        v35.keyboardVisibleChanged:disconnect();
    end;
    v35.keyboardVisibleChanged = nil;
end;
v19.render = function(v36)
    local l_screenSize_0 = v36.props.screenSize;
    local v38 = l_PartialPageModal_0:getMiddleContentWidth(l_screenSize_0.X);
    local v39 = v36.state.onScreenKeyboardHeight > 0;
    local l_title_0 = v36.props.title;
    local l_bodyText_0 = v36.props.bodyText;
    local l_textInputType_0 = v36.props.textInputType;
    local l_textFieldLabelText_0 = v36.props.textFieldLabelText;
    local l_textFieldPlaceholderText_0 = v36.props.textFieldPlaceholderText;
    local l_errorMessage_0 = v36.props.errorMessage;
    local l_links_0 = v36.props.links;
    local l_onEmailFocused_0 = v36.props.onEmailFocused;
    local l_onChangeTextCallback_0 = v36.props.onChangeTextCallback;
    local l_onCloseClickedCallback_0 = v36.props.onCloseClickedCallback;
    local l_isEmailModalCalledFromHomePage_0 = v36.props.isEmailModalCalledFromHomePage;
    local v51 = l_errorMessage_0 and l_errorMessage_0 ~= "";
    local l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Default;
    if v51 then
        l_Default_0 = l_AuthStatefulRoundCornerBorder_0.BorderState.Error;
    end;
    return l_withStyle_0(function(v53)
        return v2.createElement(l_PartialPageModal_0, {
            title = l_title_0, 
            screenSize = l_screenSize_0, 
            position = not not v39 and UDim2.new(0.5, 0, 1, -v36.state.onScreenKeyboardHeight) or nil, 
            anchorPoint = not not v39 and Vector2.new(0.5, 1) or nil, 
            buttonStackProps = v36.getButtonStackProps(), 
            onCloseClicked = l_onCloseClickedCallback_0
        }, {
            Middle = v2.createElement(v15.FitFrame, {
                BackgroundTransparency = 1, 
                fitAxis = v15.FitAxis.Height, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 24)
                }), 
                UIBloxLockImage = l_isEmailModalCalledFromHomePage_0 and v2.createElement(l_ImageSetLabel_0, {
                    Size = v24, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v23, 
                    ImageColor3 = v53.Theme.UIEmphasis.Color, 
                    ImageTransparency = 0
                }), 
                Icon = not l_isEmailModalCalledFromHomePage_0 and v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 100, 0, 100), 
                    ScaleType = Enum.ScaleType.Fit, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Image = l_GetImageData_0("LuaApp/graphic/verificationUpsellModal") or "LuaApp/graphic/verificationUpsellModal"
                }), 
                BodyText = v2.createElement(v16, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = l_bodyText_0, 
                    TextSize = v53.Font.Body.RelativeSize * v53.Font.BaseSize, 
                    TextColor3 = v53.Theme.TextDefault.Color, 
                    TextTransparency = v53.Theme.TextDefault.Transparency, 
                    Font = v53.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    fitAxis = v15.FitAxis.Height, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v38, 0, 0)
                }), 
                TextBox = l_textInputType_0 and v2.createElement(l_TextInputBoxWithBorder_0, {
                    textInputType = l_textInputType_0, 
                    textInputHeight = 36, 
                    layoutOrder = 3, 
                    borderState = l_Default_0, 
                    placeholderText = l_textFieldPlaceholderText_0, 
                    onChangeTextCallback = l_onChangeTextCallback_0, 
                    onFocused = l_onEmailFocused_0, 
                    labelText = l_textFieldLabelText_0, 
                    errorText = v51 and l_errorMessage_0, 
                    Size = UDim2.new(1, 0, 0, 0)
                }), 
                PrivacyPolicyButton = v36.props.shouldShowPrivacyPolicyLink() and v2.createElement(l_LinkButton_0, {
                    text = v36.props.privacyPolicyLinkText, 
                    onActivated = v36.props.onPrivacyPolicyLinkActivated, 
                    layoutOrder = 4, 
                    fontStyle = "CaptionBody"
                }), 
                Links = l_links_0 and v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 36 * #l_links_0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5
                }, {
                    LinksList = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 12)
                    }), 
                    TopPadding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24)
                    }); 
                    v36.getLinks()
                })
            })
        });
    end);
end;
return (v3.connect(function(v54, _)
    return {
        screenSize = v54.ScreenSize
    };
end)(v19));
