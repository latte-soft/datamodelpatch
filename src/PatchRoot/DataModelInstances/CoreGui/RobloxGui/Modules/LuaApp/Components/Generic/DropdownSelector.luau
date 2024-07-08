local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local l_DropdownMenu_0 = v2.App.Menu.DropdownMenu;
local v5 = v1.PureComponent:extend("DropdownSelector");
v5.defaultProps = {
    contentMaxWidth = math.huge, 
    selectorHeight = 48, 
    selectorSpacer = 24, 
    paddingHorizontal = 0, 
    paddingVertical = 0, 
    errorText = "", 
    renderErrorItem = function()
    end
};
v5.validateProps = v3.strictInterface({
    itemList = v3.array(v3.strictInterface({
        key = v3.string, 
        value = v3.any
    })), 
    screenSize = v3.Vector2, 
    renderSelectedItem = v3.callback, 
    contentMaxWidth = v3.optional(v3.number), 
    selectorHeight = v3.optional(v3.number), 
    selectorSpacer = v3.optional(v3.number), 
    paddingHorizontal = v3.optional(v3.number), 
    paddingVertical = v3.optional(v3.number), 
    isDisabled = v3.optional(v3.boolean), 
    errorState = v3.optional(v3.boolean), 
    errorText = v3.optional(v3.string), 
    renderErrorItem = v3.optional(v3.callback)
});
v5.init = function(v6)
    v6.onSelectionChange = function(v7)
        v6:setState({
            selectedKey = v7
        });
    end;
    v6:setState({
        selectedKey = nil
    });
end;
v5.getDerivedStateFromProps = function(v8, v9)
    local l_itemList_0 = v8.itemList;
    local l_selectedKey_0 = v9.selectedKey;
    for _, v13 in ipairs(l_itemList_0) do
        if l_selectedKey_0 == v13.key then
            return nil;
        end;
    end;
    return {
        selectedKey = #l_itemList_0 > 0 and l_itemList_0[1].key or nil
    };
end;
v5.render = function(v14)
    local l_itemList_1 = v14.props.itemList;
    local l_screenSize_0 = v14.props.screenSize;
    local l_contentMaxWidth_0 = v14.props.contentMaxWidth;
    local l_selectorHeight_0 = v14.props.selectorHeight;
    local l_selectorSpacer_0 = v14.props.selectorSpacer;
    local l_paddingHorizontal_0 = v14.props.paddingHorizontal;
    local l_paddingVertical_0 = v14.props.paddingVertical;
    local l_isDisabled_0 = v14.props.isDisabled;
    local l_errorState_0 = v14.props.errorState;
    local l_errorText_0 = v14.props.errorText;
    local l_renderErrorItem_0 = v14.props.renderErrorItem;
    local l_renderSelectedItem_0 = v14.props.renderSelectedItem;
    local l_selectedKey_1 = v14.state.selectedKey;
    local v28 = nil;
    local v29 = {};
    for _, v31 in ipairs(l_itemList_1) do
        table.insert(v29, {
            text = v31.key
        });
        if l_selectedKey_1 == v31.key then
            v28 = v31.value;
        end;
    end;
    local v32 = l_errorState_0 or #l_itemList_1 == 0;
    local v33 = l_contentMaxWidth_0 + 2 * l_paddingHorizontal_0;
    local v34 = (l_selectorHeight_0 + l_selectorSpacer_0) + l_paddingVertical_0;
    return v1.createFragment({
        SelectorFrame = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1
        }, {
            Selector = v1.createElement(l_DropdownMenu_0, {
                placeholder = not not v32 and l_errorText_0 or l_selectedKey_1, 
                onChange = v14.onSelectionChange, 
                height = UDim.new(0, l_selectorHeight_0), 
                screenSize = l_screenSize_0, 
                errorState = l_errorState_0, 
                isDisabled = l_isDisabled_0, 
                cellDatas = v29
            }), 
            SelectorPadding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_paddingVertical_0), 
                PaddingLeft = UDim.new(0, l_paddingHorizontal_0), 
                PaddingRight = UDim.new(0, l_paddingHorizontal_0)
            }), 
            SelectorMaxWidth = v1.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v33, math.huge)
            })
        }), 
        SelectionFrame = v1.createElement("Frame", {
            ZIndex = -1, 
            Position = UDim2.new(0, 0, 0, v34), 
            Size = UDim2.new(1, 0, 1, -v34), 
            BackgroundTransparency = 1
        }, not not v32 and {
            Error = l_renderErrorItem_0()
        } or {
            [l_selectedKey_1] = l_renderSelectedItem_0(v28)
        })
    });
end;
return v5;
