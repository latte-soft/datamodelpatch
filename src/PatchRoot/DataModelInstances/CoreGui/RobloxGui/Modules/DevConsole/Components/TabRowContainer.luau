local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_TextService_0 = game:GetService("TextService");
local v4 = require(script.Parent.Parent.Actions.SetActiveTab);
local v5 = require(script.Parent.TabRowButton);
local v6 = require(script.Parent.DropDown);
local v7 = require(script.Parent.FullScreenDropDownButton);
local v8 = require(script.Parent.Parent.Constants);
local l_TabDropDownWidth_0 = v8.TabRowFormatting.TabDropDownWidth;
local l_TabOverlapThreshold_0 = v8.TabRowFormatting.TabOverlapThreshold;
local v11 = v1.Component:extend("TabRowContainer");
local function v19(v12)
    local v13 = {};
    local v14 = 0;
    local v15 = 0;
    for v16, _ in pairs(v12) do
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v16, v8.DefaultFontSize.TabBar, v8.Font.TabBar, Vector2.new(0, 0));
        v13[v16] = l_l_TextService_0_TextSize_0.X;
        v14 = v14 + l_l_TextService_0_TextSize_0.X;
        v15 = v15 + 1;
    end;
    return v13, v14, v15;
end;
v11.init = function(v20)
    local v21, v22, v23 = v19(v20.props.tabList);
    v20.state = {
        textWidths = v21, 
        totalTextLength = v22, 
        totalTabCount = v23, 
        currContainerWidth = 0
    };
    v20.onTabButtonClicked = function(v24)
        for v25, v26 in pairs(v20.props.tabList) do
            if v26.layoutOrder == v24 then
                v20.props.dispatchSetActiveTab(v25, v26.hasClientServer);
                return ;
            end;
        end;
    end;
end;
v11.didUpdate = function(v27, v28, _)
    if v28.tabList ~= v27.props.tabList then
        local v30, v31, v32 = v19(v27.props.tabList);
        v27:setState({
            textWidths = v30, 
            totalTextLength = v31, 
            totalTabCount = v32
        });
    end;
end;
v11.render = function(v33)
    local l_tabList_0 = v33.props.tabList;
    local l_currTabIndex_0 = v33.props.currTabIndex;
    local l_formFactor_0 = v33.props.formFactor;
    local l_windowWidth_0 = v33.props.windowWidth;
    local l_frameHeight_0 = v33.props.frameHeight;
    local l_layoutOrder_0 = v33.props.layoutOrder;
    local l_textWidths_0 = v33.state.textWidths;
    local l_totalTextLength_0 = v33.state.totalTextLength;
    local l_totalTabCount_0 = v33.state.totalTabCount;
    local v43 = {};
    local v44 = (l_windowWidth_0 - l_totalTextLength_0) / l_totalTabCount_0;
    local v45 = ((v44 % 1) * l_totalTabCount_0) / 2;
    local v46 = false;
    if v44 < l_TabOverlapThreshold_0 then
        v46 = l_windowWidth_0 > 0;
    end;
    local v47 = l_formFactor_0 == v8.FormFactor.Small;
    if l_tabList_0 then
        if not v46 and not v47 then
            for v48, v49 in pairs(l_tabList_0) do
                if l_textWidths_0[v48] then
                    v43[v48] = v1.createElement(v5, {
                        index = v49.layoutOrder, 
                        name = v48, 
                        padding = v44, 
                        textWidth = not not v46 and l_TabDropDownWidth_0 or l_textWidths_0[v48], 
                        isSelected = v48 == l_currTabIndex_0, 
                        layoutOrder = v49.layoutOrder, 
                        onTabButtonClicked = v33.onTabButtonClicked
                    });
                end;
            end;
        else
            local v50 = {};
            local l_layoutOrder_1 = l_tabList_0[l_currTabIndex_0].layoutOrder;
            for v52, v53 in pairs(l_tabList_0) do
                v50[v53.layoutOrder] = v52;
            end;
            if not v47 then
                if v46 then
                    return v1.createElement(v6, {
                        buttonSize = UDim2.new(0, l_TabDropDownWidth_0, 0, l_frameHeight_0), 
                        dropDownList = v50, 
                        selectedIndex = l_layoutOrder_1, 
                        onSelection = v33.onTabButtonClicked
                    });
                end;
            else
                return v1.createElement(v7, {
                    buttonSize = UDim2.new(0, l_TabDropDownWidth_0, 0, l_frameHeight_0), 
                    dropDownList = v50, 
                    selectedIndex = l_layoutOrder_1, 
                    onSelection = v33.onTabButtonClicked, 
                    layoutOrder = l_layoutOrder_0
                });
            end;
        end;
        v43.UIListLayout = v1.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Horizontal
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_frameHeight_0), 
        Position = UDim2.new(0, v45, 0, 0), 
        Transparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, v43);
end;
return v2.UNSTABLE_connect2(function(v54, _)
    return {
        tabList = v54.MainView.tabList, 
        currTabIndex = v54.MainView.currTabIndex
    };
end, function(v56)
    return {
        dispatchSetActiveTab = function(v57, v58)
            v56(v4(v57, v58));
        end
    };
end)(v11);
