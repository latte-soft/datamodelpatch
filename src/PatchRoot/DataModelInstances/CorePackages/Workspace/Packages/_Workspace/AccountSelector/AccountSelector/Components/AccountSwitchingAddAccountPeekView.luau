local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_RoactRodux_0 = v1.RoactRodux;
local l_useSelector_0 = v1.RoactUtils.Hooks.RoactRodux.useSelector;
local l_UIBlox_0 = v1.UIBlox;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_React_0 = v1.React;
local l_useEffect_0 = l_React_0.useEffect;
local v8 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v9 = require(l_Parent_0.Analytics.EventConstants);
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useNavigation_0 = v1.Hooks.useNavigation;
local l_AppPage_0 = v1.RobloxAppEnums.AppPage;
local l_NavigateDown_0 = v1.NavigationRodux.Thunks.NavigateDown;
local l_PeekView_0 = v1.PeekView.PeekView;
local l_PeekViewState_0 = v1.PeekView.PeekViewState;
local l_useState_0 = l_React_0.useState;
return (l_RoactRodux_0.connect(nil, function(v19)
    return {
        navigateToLogin = function()
            v19(l_NavigateDown_0({
                name = l_AppPage_0.Login
            }));
        end, 
        navigateToSignUp = function()
            v19(l_NavigateDown_0({
                name = l_AppPage_0.SinglePageSignUp
            }));
        end
    };
end)(function(v20)
    local v21 = l_useStyle_0();
    local v22 = l_useNavigation_0();
    local l_Color_0 = v21.Theme.BackgroundDefault.Color;
    local v24, v25 = l_useState_0(l_PeekViewState_0.Full);
    local v26 = v21.Font.Header1.RelativeSize * v21.Font.BaseSize;
    local v28 = l_useSelector_0(function(v27)
        return v27.ScreenSize;
    end);
    local v29 = v28.X - 48;
    local v30 = l_useLocalization_0({
        titleText = "Authentication.AccountSwitch.Action.AddAccount", 
        loginText = "Authentication.Login.Heading.LoginRobloxAccountSwitching", 
        createText = "Authentication.AccountSwitch.Action.CreateNewAccount"
    });
    local function v32(v31)
        if v31 < 10 then
            v25(l_PeekViewState_0.Closed);
        end;
    end;
    local function v35(v33, _)
        v25(v33);
        if not (v33 ~= l_PeekViewState_0.Closed) or v33 == l_PeekViewState_0.Hidden then
            v22.goBack();
        end;
    end;
    l_useEffect_0(function()
        v8.sendModalShownEvent(v9.ctx.accountSwitcherAddAccount, v20.origin);
    end, {});
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v28.Y), 
        BackgroundColor3 = v21.Theme.Overlay.Color, 
        BackgroundTransparency = 0.5
    }, {
        l_React_0.createElement(l_PeekView_0, {
            screenSize = v28, 
            briefViewContentHeight = UDim.new(0, 240), 
            superBriefViewContentHeight = UDim.new(0, 40), 
            peekHeaderClose = false, 
            style = v21, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            returnToFullView = true, 
            peekHeaderPositionYChange = v32, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            viewStateChanged = v35, 
            peekViewState = v24
        }, {
            Content = l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 0, 
                BorderColor3 = l_Color_0, 
                BackgroundColor3 = l_Color_0, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ContentPadding = l_React_0.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 48)
                }), 
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                TitleFrame = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    ContentPadding = l_React_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    TitleText = l_React_0.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v30.titleText, 
                        TextSize = v26, 
                        TextColor3 = v21.Theme.TextEmphasis.Color, 
                        TextTransparency = v21.Theme.TextDefault.Transparency, 
                        Font = v21.Font.Header2.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        Size = UDim2.new(0, v29, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }), 
                Divider = l_React_0.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v21.Theme.Divider.Color, 
                    BackgroundTransparency = v21.Theme.Divider.Transparency
                }), 
                ButtonContentFrame = l_React_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    UIPadding = l_React_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24)
                    }), 
                    LoginButton = l_React_0.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, -40, 0, 48), 
                        BackgroundTransparency = 1
                    }, {
                        UIPadding = l_React_0.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 60)
                        }), 
                        Button = l_React_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            size = UDim2.new(1, 0, 0, 48), 
                            text = v30.loginText, 
                            onActivated = function()
                                v8.sendButtonClickEvent(v9.ctx.accountSwitcherAddAccount, v20.origin, v9.btn.login);
                                v20.navigateToLogin();
                            end
                        })
                    }), 
                    SignupButton = l_React_0.createElement("Frame", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -40, 0, 48), 
                        BackgroundTransparency = 1
                    }, {
                        Button = l_React_0.createElement(l_Button_0, {
                            buttonType = l_ButtonType_0.Secondary, 
                            size = UDim2.new(1, 0, 0, 48), 
                            text = v30.createText, 
                            onActivated = function()
                                v8.sendButtonClickEvent(v9.ctx.accountSwitcherAddAccount, v20.origin, v9.btn.signup);
                                v20.navigateToSignUp();
                            end
                        })
                    })
                })
            })
        })
    });
end));
