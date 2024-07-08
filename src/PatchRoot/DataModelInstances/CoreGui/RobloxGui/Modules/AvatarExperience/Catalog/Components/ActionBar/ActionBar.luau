local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_withStyle_0 = v3.Style.withStyle;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionButton);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ItemDetailMoreButton);
local l_ActionBarHeight_0 = v7.ActionBar.ActionBarHeight;
local l_ActionBarGradientHeight_0 = v7.ActionBar.ActionBarGradientHeight;
local v13 = v2.PureComponent:extend("ActionBar");
local v14 = v4.strictInterface({
    buttonProps = v4.table, 
    bottomPadding = v4.number, 
    leftPadding = v4.number, 
    rightPadding = v4.number, 
    topPadding = v4.optional(v4.number), 
    ZIndex = v4.number, 
    topComponent = v4.optional(v4.table), 
    topComponentHeight = v4.optional(v4.number), 
    showMoreButton = v4.boolean, 
    onMoreButtonActivated = v4.optional(v4.callback), 
    isMoreButtonSelected = v4.optional(v4.boolean), 
    bottomComponent = v4.optional(v4.table), 
    bottomComponentHeight = v4.optional(v4.number), 
    hideGradient = v4.optional(v4.boolean)
});
v13.defaultProps = {
    topComponentHeight = 0
};
v13.init = function(v15)
    v15.moreButtonRef = v2.createRef();
    v15.actionButtonRef = v2.createRef();
    v15.bottomComponentRef = v2.createRef();
end;
v13.renderWithStyle = function(v16, v17, _)
    assert(v14(v16.props));
    local l_ZIndex_0 = v16.props.ZIndex;
    local l_leftPadding_0 = v16.props.leftPadding;
    local l_rightPadding_0 = v16.props.rightPadding;
    local l_topPadding_0 = v16.props.topPadding;
    local l_bottomPadding_0 = v16.props.bottomPadding;
    local l_showMoreButton_0 = v16.props.showMoreButton;
    local l_onMoreButtonActivated_0 = v16.props.onMoreButtonActivated;
    local l_isMoreButtonSelected_0 = v16.props.isMoreButtonSelected;
    local l_buttonProps_0 = v16.props.buttonProps;
    local l_topComponent_0 = v16.props.topComponent;
    local l_topComponentHeight_0 = v16.props.topComponentHeight;
    local l_bottomComponent_0 = v16.props.bottomComponent;
    local v31 = v16.props.bottomComponentHeight or 0;
    local v32 = not not l_showMoreButton_0 and l_ActionBarHeight_0 or 0;
    local v33 = not l_showMoreButton_0 and 0 or 10;
    local v34 = l_ActionBarHeight_0 + l_bottomPadding_0;
    local v35 = (v34 + l_topComponentHeight_0) + v31;
    if not v16.props.hideGradient then
        v35 = v35 + l_ActionBarGradientHeight_0;
    end;
    local l_Theme_0 = v17.Theme;
    local l_Font_0 = v17.Font;
    local v38 = nil;
    v38 = if not l_showMoreButton_0 then v16.actionButtonRef else v16.moreButtonRef;
    local l_bottomComponentRef_0 = v16.bottomComponentRef;
    local l_moreButtonRef_0 = v16.moreButtonRef;
    if not l_bottomComponent_0 then
        l_bottomComponentRef_0 = nil;
    end;
    if not l_showMoreButton_0 then
        l_moreButtonRef_0 = nil;
    end;
    local l_createElement_0 = v2.createElement;
    local l_Frame_0 = l_Focusable_0.Frame;
    local v43 = {
        Size = UDim2.new(1, 0, 0, v35), 
        BackgroundTransparency = 1, 
        ZIndex = l_ZIndex_0, 
        defaultChild = v38
    };
    local v44 = {
        TopComponent = l_topComponent_0 ~= nil and v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_topComponentHeight_0), 
            Position = UDim2.new(0, 0, 1, (-v31 - v34) - l_topComponentHeight_0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        }, l_topComponent_0) or nil, 
        ActionBarFrame = v2.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(1, 0, 0, v34), 
            Position = UDim2.new(0, 0, 1, -v31 - v34), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            NextSelectionDown = l_bottomComponentRef_0
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v33)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_leftPadding_0), 
                PaddingRight = UDim.new(0, l_rightPadding_0), 
                PaddingTop = if not l_topPadding_0 then nil else UDim.new(0, l_topPadding_0)
            }), 
            MoreButton = l_showMoreButton_0 and v2.createElement(v10, {
                onActivated = l_onMoreButtonActivated_0, 
                isSelected = l_isMoreButtonSelected_0, 
                NextSelectionRight = v16.actionButtonRef, 
                [v2.Ref] = v16.moreButtonRef
            }), 
            ActionButton = v2.createElement(v9, {
                Size = UDim2.new(1, -v32 - v33, 0, v34 - l_bottomPadding_0), 
                LayoutOrder = 2, 
                Font = l_Font_0, 
                buttonProps = l_buttonProps_0, 
                NextSelectionLeft = l_moreButtonRef_0, 
                [v2.Ref] = v16.actionButtonRef
            })
        })
    };
    local v45 = false;
    if l_bottomComponent_0 ~= nil then
        v45 = v2.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(1, 0, 0, v31), 
            Position = UDim2.new(0, 0, 1, -v31), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0, 
            [v2.Ref] = v16.bottomComponentRef, 
            NextSelectionUp = v16.actionButtonRef
        }, {
            BottomComponentContents = l_bottomComponent_0
        });
    end;
    v44.BottomComponent = v45;
    v44.GamepadBottomBarComponent = v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v8.GAMEPAD_BOTTOM_BAR_SIZE), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0
    });
    v44.Gradient = not v16.props.hideGradient and v2.createElement("ImageLabel", {
        Size = UDim2.new(1, 0, 0, l_ActionBarGradientHeight_0), 
        Position = UDim2.new(0, 0, 1, (-v31 - v34) - l_topComponentHeight_0), 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png", 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color
    }) or nil;
    return l_createElement_0(l_Frame_0, v43, v44);
end;
v13.render = function(v46)
    return l_withStyle_0(function(v47)
        return v46:renderWithStyle(v47);
    end);
end;
return v13;
