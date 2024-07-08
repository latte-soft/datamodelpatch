local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppBlox");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useLazyRef_0 = v3.Core.Hooks.useLazyRef;
local v5 = require(l_Parent_0.PeekView);
local l_PeekView_0 = v5.PeekView;
local l_PeekViewState_0 = v5.PeekViewState;
local v8 = require(l_Parent_0.RoactUtils);
local l_useNavigation_0 = v8.Hooks.useNavigation;
local l_useState_0 = v2.useState;
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local l_GetUIBloxEnableFontNameMapping_0 = require(l_Parent_0.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppImproveInfoPeekView);
return function(v16)
    local v17, v18 = l_useState_0(l_PeekViewState_0.Full);
    local v20 = l_useSelector_0(function(v19)
        return v19.ScreenSize;
    end);
    local v21 = l_useStyle_0();
    local l_Tokens_0 = v21.Tokens;
    local v23 = l_useNavigation_0();
    local v24 = v23.getParam("title", nil);
    local v25 = v23.getParam("body", nil);
    local v26 = v16.title or v24;
    local v27 = v16.body or v25;
    local l_Space_300_0 = l_Tokens_0.Global.Space_300;
    local l_Space_150_0 = l_Tokens_0.Global.Space_150;
    local l_Default_0 = l_Tokens_0.Semantic.Color.Background.Default;
    local l_Header_0 = l_Tokens_0.Semantic.Typography.Header;
    local l_Emphasis_0 = l_Tokens_0.Semantic.Color.Text.Emphasis;
    local l_Body_0 = l_Tokens_0.Semantic.Typography.Body;
    local l_Default_1 = l_Tokens_0.Semantic.Color.Text.Default;
    local v35 = v20.X - 2 * l_Space_300_0;
    local v38 = v2.useCallback(function(v36, _)
        v18(v36);
        if not (v36 ~= l_PeekViewState_0.Closed) or v36 == l_PeekViewState_0.Hidden then
            v23.goBack();
        end;
    end, {
        v23
    });
    local v40 = v2.useCallback(function(v39)
        if v39 < 10 then
            v18(l_PeekViewState_0.Closed);
        end;
    end, {});
    if not v15 then
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            PeekView = v2.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(1, 0), 
                peekHeaderClose = true, 
                style = v21, 
                canDragFullViewToBrief = false, 
                peekHeaderPositionYChange = v40, 
                viewStateChanged = v38, 
                peekViewState = v17, 
                hasScrim = true
            }, {
                Content = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_Default_0.Color3, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, l_Space_300_0)
                    }), 
                    ContentPadding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_Space_150_0), 
                        PaddingLeft = UDim.new(0, l_Space_300_0), 
                        PaddingRight = UDim.new(0, l_Space_300_0), 
                        PaddingBottom = UDim.new(0, l_Space_300_0)
                    }), 
                    TitleText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v26, 
                        TextSize = if not l_GetUIBloxEnableFontNameMapping_0() then l_Header_0.FontSize * 1.2 else l_Header_0.FontSize, 
                        TextColor3 = l_Emphasis_0.Color3, 
                        TextTransparency = l_Emphasis_0.Transparency, 
                        Font = l_Header_0.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(0, v35, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1
                    }), 
                    BodyText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v27, 
                        TextSize = if not l_GetUIBloxEnableFontNameMapping_0() then l_Body_0.FontSize * 1.2 else l_Body_0.FontSize, 
                        TextColor3 = l_Default_1.Color3, 
                        TextTransparency = l_Default_1.Transparency, 
                        Font = l_Body_0.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        AnchorPoint = Vector2.new(0, -1), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(0, v35, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2
                    })
                })
            })
        });
    else
        local v41 = l_useLazyRef_0(function()
            return l_Signal_0.new();
        end);
        return v2.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = l_Tokens_0.Semantic.Color.Common.Overlay.Transparency, 
            BackgroundColor3 = l_Tokens_0.Semantic.Color.Common.Overlay.Color3, 
            ClipsDescendants = false, 
            Text = "", 
            [v2.Event.Activated] = function()
                if not (not v41 or not v41.current) then
                    v41.current:fire();
                end;
            end, 
            AutoButtonColor = false
        }, {
            PeekView = v2.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(1, 0), 
                peekHeaderClose = true, 
                style = v21, 
                canDragFullViewToBrief = false, 
                peekHeaderPositionYChange = v40, 
                viewStateChanged = v38, 
                peekViewState = v17, 
                hasScrim = false, 
                closeSignal = v41.current
            }, {
                Content = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_Default_0.Color3, 
                    BorderSizePixel = 0, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, l_Space_300_0)
                    }), 
                    ContentPadding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_Space_150_0), 
                        PaddingLeft = UDim.new(0, l_Space_300_0), 
                        PaddingRight = UDim.new(0, l_Space_300_0), 
                        PaddingBottom = UDim.new(0, l_Space_300_0)
                    }), 
                    TitleText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v26, 
                        TextSize = if not l_GetUIBloxEnableFontNameMapping_0() then l_Header_0.FontSize * 1.2 else l_Header_0.FontSize, 
                        TextColor3 = l_Emphasis_0.Color3, 
                        TextTransparency = l_Emphasis_0.Transparency, 
                        Font = l_Header_0.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(0, v35, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 1
                    }), 
                    BodyText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v27, 
                        TextSize = if not l_GetUIBloxEnableFontNameMapping_0() then l_Body_0.FontSize * 1.2 else l_Body_0.FontSize, 
                        TextColor3 = l_Default_1.Color3, 
                        TextTransparency = l_Default_1.Transparency, 
                        Font = l_Body_0.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        AnchorPoint = Vector2.new(0, -1), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(0, v35, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2
                    })
                })
            })
        });
    end;
end;
