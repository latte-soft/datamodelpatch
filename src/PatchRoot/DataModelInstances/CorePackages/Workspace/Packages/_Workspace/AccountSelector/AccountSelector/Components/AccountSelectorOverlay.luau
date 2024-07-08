local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useState_0 = l_React_0.useState;
local l_useEffect_0 = l_React_0.useEffect;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local v10 = require(script.Parent.AccountSelectionList);
local _ = require(script.Parent.AccountSelection);
local v12 = require(l_Parent_0.Analytics.AnalyticsEvents);
return function(v13)
    local v14 = l_useStyle_0();
    local v15 = l_useDesignTokens_0();
    local v16, v17 = l_useState_0(false);
    local l_BaseSize_0 = v14.Font.BaseSize;
    local l_Size_800_0 = v15.Global.Size_800;
    local v20 = #v13.users < 7 and l_Size_800_0 * #v13.users or l_Size_800_0 * 7.5;
    local v21 = l_useLocalization_0({
        titleText = v13.titleTextKey, 
        helpText = v13.helpTextKey
    });
    local v22 = l_PartialPageModal_0:getMiddleContentWidth(v13.screenSize.X);
    local v23 = l_React_0.useRef(false);
    l_useEffect_0(function()
        local v24 = "";
        for _, v26 in v13.users, nil, nil do
            v24 = v24 .. tostring(v26.id) .. ",";
        end;
        v12.sendPageLoadEvent(v13.context, v13.origin, (v24:sub(1, -2)));
        return function()
            if not v23.current then
                v13.onAccountSelectionAbandoned();
            end;
        end;
    end, {});
    return l_React_0.createElement(l_PartialPageModal_0, {
        screenSize = v13.screenSize, 
        title = v21.titleText, 
        onCloseClicked = v13.onAccountSelectionAbandoned
    }, {
        ViewContainer = l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ContentPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            UIListLayout = l_React_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 6), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            HelpText = l_React_0.createElement("TextLabel", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Text = v21.helpText, 
                TextSize = l_BaseSize_0, 
                TextColor3 = v14.Theme.TextDefault.Color, 
                TextTransparency = v14.Theme.TextDefault.Transparency, 
                Font = v14.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Size = UDim2.new(0, v22, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }), 
            AccountSelectionContent = l_React_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v20), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                AccountSelectionList = l_React_0.createElement(v10, {
                    users = v13.users, 
                    onAccountSelection = function(v27)
                        v17(true);
                        v13.onAccountSelection(v27);
                        v12.sendSelectEvent(v13.context, v13.origin, (tostring(v27)));
                        v23.current = true;
                    end, 
                    height = v20, 
                    isDisabled = v16, 
                    isScrollable = true
                })
            })
        })
    });
end;
