local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AppBlox);
local v4 = require(l_Parent_0.FitFrame);
local v5 = require(l_Parent_0.AuthCommon);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v8 = require(l_script_FirstAncestor_0.Enums.LoginActionType);
local v9 = require(l_script_FirstAncestor_0.Enums.UserIdentifierType);
local l_FullscreenPageWithSafeArea_0 = v3.FullscreenPageWithSafeArea;
local v11 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useStyle_0 = v11.Core.Style.useStyle;
local l_Colors_0 = v11.App.Style.Colors;
local l_Button_0 = v11.App.Button.Button;
local l_ButtonType_0 = v11.App.Button.Enum.ButtonType;
local l_ButtonStack_0 = v11.App.Button.ButtonStack;
local l_IconButton_0 = v11.App.Button.IconButton;
local l_Images_0 = v11.App.ImageSet.Images;
local l_StandardButtonSize_0 = v11.App.Button.Enum.StandardButtonSize;
local l_StyledTextLabel_0 = v11.App.Text.StyledTextLabel;
local l_TextField_0 = v11.App.Input.TextField;
local v23 = require(l_script_FirstAncestor_0.Enums.LoginPageState);
local v24 = require(l_script_FirstAncestor_0.Context.LoginContext);
local l_isStringEmail_0 = v5.Utils.isStringEmail;
local l_isStringPhone_0 = v5.Utils.isStringPhone;
local l_CrossDeviceLogin_0 = v5.Thunks.CrossDeviceLogin;
getUserIdentifierType = function(v28)
    if not l_isStringEmail_0(v28) then
        if not l_isStringPhone_0(v28) then
            return v9.Username;
        else
            return v9.Phone;
        end;
    else
        return v9.Email;
    end;
end;
LoginScreenV2 = function(v29)
    local v30 = v2.useContext(v24);
    local v31 = l_useStyle_0();
    local v32 = l_useDesignTokens_0();
    local v33 = l_useDispatch_0();
    local v34 = l_useLocalization_0({
        signInHeadingText = "Authentication.Login.Heading.SignIn", 
        identifierLabelText = "Authentication.Login.Label.UsernameEmailOrPhone", 
        tapToEnterLabelText = "Authentication.Login.Label.TapToEnter", 
        orTryAnotherWayText = "Authentication.Login.Label.OrTryAnotherWay", 
        nextActionText = "Authentication.Login.Action.Next", 
        quickSignInActionText = "Authentication.Login.Action.QuickSignIn", 
        usePasskeyActionText = "Authentication.SignUp.Action.UsePasskey"
    });
    local l_state_0 = v30.state;
    local v36, v37 = v2.useState(not not l_state_0 and l_state_0.userIdentifier or "");
    return v2.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = l_Colors_0.Carbon
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v32.Global.Space_100), 
            PaddingLeft = UDim.new(0, v32.Global.Space_100), 
            PaddingRight = UDim.new(0, v32.Global.Space_100), 
            PaddingBottom = UDim.new(0, v32.Global.Space_100)
        }), 
        Wrapper = v2.createElement(v4.FitFrameVertical, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            BackButton = v2.createElement(l_IconButton_0, {
                layoutOrder = 0, 
                icon = l_Images_0["icons/navigation/close"], 
                onActivated = function()
                    v30.parentNavigation.goBack();
                end
            }), 
            Content = v2.createElement(v4.FitFrameVertical, {
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v32.Global.Space_150)
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v32.Global.Space_100), 
                    PaddingRight = UDim.new(0, v32.Global.Space_100), 
                    PaddingBottom = UDim.new(0, v32.Global.Space_200)
                }), 
                SignInHeading = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v34.signInHeadingText, 
                    fontStyle = v31.Font.Title, 
                    colorStyle = v31.Theme.TextEmphasis
                }), 
                IdentifierLabel = v2.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = v34.identifierLabelText, 
                    fontStyle = v31.Font.Body, 
                    colorStyle = v31.Theme.TextEmphasis
                }), 
                UserIdentifierTextField = v2.createElement(l_TextField_0, {
                    LayoutOrder = 3, 
                    text = v36, 
                    placeholder = v34.tapToEnterLabelText, 
                    width = UDim.new(1, 0), 
                    onChange = function(v38)
                        v37(v38);
                    end
                }), 
                Spacing = v2.createElement("Frame", {
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v32.Global.Space_100), 
                    BackgroundTransparency = 1
                }), 
                NextButton = v2.createElement(l_Button_0, {
                    layoutOrder = 5, 
                    standardSize = l_StandardButtonSize_0.Regular, 
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    text = v34.nextActionText, 
                    onActivated = function()
                        v30.dispatch({
                            type = v8.SetUserIdentifierAndType, 
                            data = {
                                userIdentifier = v36, 
                                userIdentifierType = getUserIdentifierType(v36)
                            }
                        });
                        v29.navigation.navigate(v23.AuthenticationScreen);
                    end, 
                    isDisabled = v36 == ""
                })
            })
        }), 
        Footer = v2.createElement(v4.FitFrameVertical, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Position = UDim2.new(0, 0, 0.8, 0)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v32.Global.Space_100), 
                PaddingRight = UDim.new(0, v32.Global.Space_100)
            }), 
            AlternativeLoginLabel = v2.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                text = v34.orTryAnotherWayText, 
                fontStyle = v31.Font.Header2, 
                colorStyle = v31.Theme.TextEmphasis, 
                textXAlignment = Enum.TextXAlignment.Left
            }), 
            Spacing = v2.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v32.Global.Space_200), 
                BackgroundTransparency = 1
            }), 
            AlternativeLoginButtonFrame = v2.createElement("Frame", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                AlternativeLoginButtons = v2.createElement(l_ButtonStack_0, {
                    forcedFillDirection = Enum.FillDirection.Horizontal, 
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = function()
                                end, 
                                text = v34.usePasskeyActionText, 
                                icon = l_Images_0["icons/menu/passkey"]
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.Secondary, 
                            props = {
                                onActivated = function()
                                    v33(l_CrossDeviceLogin_0.OpenLoginCodePrompt({
                                        loginCallback = function()
                                        end, 
                                        isOverlay = true
                                    }));
                                end, 
                                text = v34.quickSignInActionText, 
                                icon = l_Images_0["icons/menu/scanqr"]
                            }
                        }
                    }
                })
            })
        })
    });
end;
return LoginScreenV2;
