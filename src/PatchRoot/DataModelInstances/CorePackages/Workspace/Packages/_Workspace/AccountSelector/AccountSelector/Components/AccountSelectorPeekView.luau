local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_PeekView_0 = v1.PeekView.PeekView;
local l_Cryo_0 = v1.Cryo;
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_PeekViewState_0 = v1.PeekView.PeekViewState;
local l_useNavigation_0 = v1.Hooks.useNavigation;
local l_useState_0 = l_React_0.useState;
local l_useEffect_0 = l_React_0.useEffect;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_useSelector_0 = v1.RoactUtils.Hooks.RoactRodux.useSelector;
local v14 = require(script.Parent.AccountSelectionList);
local _ = require(script.Parent.AccountSelection);
local v16 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v17 = game:DefineFastFlag("AddMaxLimitToAccountSelector", false);
local v18 = game:DefineFastInt("AccountSelectorInitialRowsShown", 6);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v48 = l_RoactNavigation_0.withNavigationFocus(function(v20)
    local v21 = l_useStyle_0();
    local v22 = l_useNavigation_0();
    local v23, v24 = l_useState_0(false);
    local v25, v26 = l_useState_0(l_PeekViewState_0.Full);
    local l_BaseSize_0 = v21.Font.BaseSize;
    local v28 = v21.Font.Header1.RelativeSize * l_BaseSize_0;
    local v29 = l_useDesignTokens_0();
    local v30 = #v20.users;
    local l_Size_800_0 = v29.Global.Size_800;
    local v32 = l_Size_800_0 * 100.5;
    local v33 = l_Size_800_0 * ((v30 + 1.25) + 1);
    if v17 then
        v33 = l_Size_800_0 * ((math.min(v18, v30) + 1.25) + 1);
    end;
    local v34 = v30 < 100 and l_Size_800_0 * v30 or v32;
    local v35 = l_useLocalization_0({
        titleText = v20.titleTextKey, 
        helpText = v20.helpTextKey
    });
    local v37 = l_useSelector_0(function(v36)
        return v36.ScreenSize;
    end);
    local v38 = v37.X - 48;
    local v39 = l_React_0.useRef(false);
    local l_Color_0 = v21.Theme.BackgroundDefault.Color;
    l_useEffect_0(function()
        local v41 = "";
        for _, v43 in v20.users, nil, nil do
            v41 = v41 .. tostring(v43.id) .. ",";
        end;
        v16.sendPageLoadEvent(v20.context, v20.origin, (v41:sub(1, -2)));
        return function()
            if not v39.current then
                v20.onAccountSelectionAbandoned();
            end;
        end;
    end, {});
    return l_React_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v37.Y), 
        BackgroundColor3 = v21.Theme.Overlay.Color, 
        BackgroundTransparency = 0.5
    }, {
        PeekView = l_React_0.createElement(l_PeekView_0, {
            briefViewContentHeight = UDim.new(0, v33), 
            superBriefViewContentHeight = UDim.new(0, 40), 
            peekHeaderClose = false, 
            style = v21, 
            canDragFullViewToBrief = true, 
            stateOnMount = l_PeekViewState_0.Brief, 
            mountAnimation = true, 
            returnToFullView = true, 
            peekHeaderPositionYChange = function(v44)
                if v44 < 10 then
                    v26(l_PeekViewState_0.Closed);
                end;
            end, 
            thumbstickScrollEnabled = true, 
            showDraggerInClosedState = true, 
            viewStateChanged = function(v45, _)
                v26(v45);
                if not (v45 ~= l_PeekViewState_0.Closed) or v45 == l_PeekViewState_0.Hidden then
                    v22.goBack();
                end;
            end, 
            peekViewState = v25
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
                        Text = v35.titleText, 
                        TextSize = v28, 
                        TextColor3 = v21.Theme.TextEmphasis.Color, 
                        TextTransparency = v21.Theme.TextDefault.Transparency, 
                        Font = v21.Font.Header2.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        Size = UDim2.new(0, v38, 0, 0), 
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
                HelpText = if not v35.helpText then nil else l_React_0.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = v35.helpText, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v21.Theme.TextDefault.Color, 
                    TextTransparency = v21.Theme.TextDefault.Transparency, 
                    Font = v21.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v38, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }), 
                AccountSelectionContent = l_React_0.createElement("Frame", {
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
                    AccountSelectionList = l_React_0.createElement(v14, {
                        users = v20.users, 
                        onAccountSelection = function(v47)
                            v26(l_PeekViewState_0.Closed);
                            v24(true);
                            v20.onAccountSelection(v47);
                            v16.sendSelectEvent(v20.context, v20.origin, (tostring(v47)));
                            v39.current = true;
                        end, 
                        height = v34, 
                        isDisabled = v23, 
                        LayoutOrder = 0, 
                        isScrollable = false
                    }), 
                    FooterContent = l_React_0.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundColor3 = v21.Theme.BackgroundUIDefault.Color, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Contents = if not v20.renderFooterComponent then nil else v20.renderFooterComponent()
                    })
                })
            })
        })
    });
end);
return l_React_0.forwardRef(function(v49, v50)
    return l_React_0.createElement(v48, l_Cryo_0.Dictionary.join(v49, {
        defaultChildRef = v50
    }));
end);
