local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(script.Parent.SortedList);
local v3 = require(script.Parent.CallbackInputBoxWithIcon);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagFilteredScrollingListAdditionalCustomizationsEnabled);
local v5 = l_Roact_0.Component:extend("FilteredScrollingList");
v5.defaultProps = {
    searchBoxCornerRadius = if not v4() then nil else 0, 
    searchBoxHeight = 48, 
    searchBoxTopPadding = if not v4() then nil else 0, 
    searchBoxLeftPadding = if not v4() then nil else 0, 
    searchBoxRightPadding = if not v4() then nil else 0, 
    searchBoxBottomPadding = if not v4() then nil else 0, 
    searchBackgroundTransparency = 0, 
    searchBackgroundColor3 = Color3.new(1, 0, 1), 
    searchBoxBorderThickness = if not v4() then nil else 0, 
    searchIconCellWidth = 60, 
    searchIconSize = 24, 
    searchIconColor3 = Color3.new(1, 0, 1), 
    searchIconTransparency = 0, 
    searchIconImage = "rbxasset://textures/ui/LuaChat/icons/ic-search.png", 
    searchInputTextFont = nil, 
    searchInputTextColor3 = nil, 
    searchInputTextSize = nil, 
    searchInputTextTransparency = nil, 
    searchPlaceholderTextTransparency = nil, 
    searchPlaceholderTextColor3 = nil, 
    searchPlaceholderText = nil, 
    searchClearIconColor3 = nil, 
    searchClearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
    searchDividerColor3 = Color3.new(1, 0, 1), 
    searchDividerTransparency = 0, 
    searchDividerHeight = 1, 
    scrollBarImageTransparency = 0, 
    scrollBarImageColor3 = Color3.new(1, 0, 1), 
    entries = {}, 
    renderEntry = nil, 
    entryHeight = 54, 
    scrollTouchedBottomCallback = nil, 
    filterPredicate = function(_, _)
        return true;
    end, 
    sortComparator = function(_, _)
        return true;
    end
};
v5.shouldUpdate = function(v10, v11, v12)
    if v12 ~= v10.state then
        return true;
    elseif v11 == v10.props then
        return false;
    else
        for v13, v14 in pairs(v11) do
            if not (v13 == "extraProps") or v10.props.extraProps then
                if v10.props[v13] ~= v14 then
                    return true;
                end;
            else
                return true;
            end;
        end;
        for v15, v16 in pairs(v10.props) do
            if v15 == "extraProps" then
                if v11.extraProps then
                    for v17, v18 in pairs(v16) do
                        if v11.extraProps[v17] ~= v18 then
                            return true;
                        end;
                    end;
                else
                    return true;
                end;
            elseif v11[v15] ~= v16 then
                return true;
            end;
        end;
        return false;
    end;
end;
v5.init = function(v19)
    v19:setState({});
end;
v5.render = function(v20)
    local l_filterPredicate_0 = v20.props.filterPredicate;
    local l_filterText_0 = v20.state.filterText;
    local v23 = {};
    local v24 = 0;
    for _, v26 in pairs(v20.props.entries) do
        if l_filterPredicate_0(l_filterText_0, v26) then
            v24 = v24 + 1;
            table.insert(v23, v26);
        end;
    end;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        dividerTop = l_Roact_0.createElement("Frame", {
            BackgroundColor3 = v20.props.searchDividerColor3, 
            BackgroundTransparency = v20.props.searchDividerTransparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v20.props.searchDividerHeight), 
            LayoutOrder = 1
        }), 
        callbackBoxContainer = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = if not v4() then UDim2.new(1, 0, 0, v20.props.searchBoxHeight) else UDim2.new(1, -v20.props.searchBoxBorderThickness * 2, 0, (v20.props.searchBoxHeight + v20.props.searchBoxTopPadding) + v20.props.searchBoxBottomPadding), 
            LayoutOrder = 2
        }, {
            UIPadding = if not v4() then nil else l_Roact_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v20.props.searchBoxBottomPadding), 
                PaddingLeft = UDim.new(0, v20.props.searchBoxLeftPadding), 
                PaddingRight = UDim.new(0, v20.props.searchBoxRightPadding), 
                PaddingTop = UDim.new(0, v20.props.searchBoxTopPadding)
            }), 
            callbackBox = l_Roact_0.createElement(v3, {
                backgroundTransparency = v20.props.searchBackgroundTransparency, 
                backgroundColor3 = v20.props.searchBackgroundColor3, 
                borderColor = if not v4() then nil else v20.props.searchBoxBorderColor, 
                borderTransparency = if not v4() then nil else v20.props.searchBoxBorderTransparency, 
                borderThickness = if not v4() then nil else v20.props.searchBoxBorderThickness, 
                cornerRadius = if not v4() then nil else v20.props.searchBoxCornerRadius, 
                iconCellWidth = v20.props.searchIconCellWidth, 
                iconSize = v20.props.searchIconSize, 
                iconColor3 = v20.props.searchIconColor3, 
                iconTransparency = v20.props.searchIconTransparency, 
                iconImage = v20.props.searchIconImage, 
                inputTextFont = v20.props.searchInputTextFont, 
                inputTextColor3 = v20.props.searchInputTextColor3, 
                inputTextSize = v20.props.searchInputTextSize, 
                inputTextTransparency = v20.props.searchInputTextTransparency, 
                placeholderTextTransparency = v20.props.searchPlaceholderTextTransparency, 
                placeholderTextColor3 = v20.props.searchPlaceholderTextColor3, 
                placeholderText = v20.props.searchPlaceholderText, 
                clearIconColor3 = v20.props.searchClearIconColor3, 
                clearIcon = v20.props.searchClearIcon, 
                textChangedCallback = function(v27)
                    v20:setState({
                        filterText = v27
                    });
                end
            })
        }), 
        dividerBottom = l_Roact_0.createElement("Frame", {
            BackgroundColor3 = v20.props.searchDividerColor3, 
            BackgroundTransparency = v20.props.searchDividerTransparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v20.props.searchDividerHeight), 
            LayoutOrder = 3
        }), 
        entryList = l_Roact_0.createElement("ScrollingFrame", {
            Size = if not v4() then UDim2.new(1, 0, 1, -v20.props.searchBoxHeight - v20.props.searchDividerHeight * 2) else UDim2.new(1, 0, 1, ((-v20.props.searchBoxHeight - v20.props.searchBoxTopPadding) - v20.props.searchBoxBottomPadding) - v20.props.searchDividerHeight * 2), 
            CanvasSize = UDim2.new(0, 0, 0, v24 * v20.props.entryHeight), 
            BackgroundTransparency = 1, 
            ScrollBarThickness = 5, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollBarImageTransparency = v20.props.scrollBarImageTransparency, 
            ScrollBarImageColor3 = v20.props.scrollBarImageColor3, 
            BottomImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png", 
            MidImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png", 
            TopImage = "rbxasset://textures/ui/LuaChat/9-slice/scroll-bar.png", 
            LayoutOrder = 4, 
            [l_Roact_0.Change.CanvasPosition] = function(v28)
                local l_Offset_0 = v28.CanvasSize.Y.Offset;
                if not v20.isTouchingBottom and l_Offset_0 <= v28.CanvasPosition.Y + v28.AbsoluteSize.Y then
                    v20.isTouchingBottom = true;
                    if v20.props.scrollTouchedBottomCallback then
                        v20.props.scrollTouchedBottomCallback();
                        return ;
                    end;
                elseif v28.CanvasPosition.Y + v28.AbsoluteSize.Y < l_Offset_0 then
                    v20.isTouchingBottom = false;
                end;
            end
        }, {
            sortedList = l_Roact_0.createElement(v2, {
                entries = v23, 
                renderEntry = v20.props.renderEntry, 
                entryHeight = v20.props.entryHeight, 
                sortComparator = v20.props.sortComparator
            })
        })
    });
end;
return v5;
