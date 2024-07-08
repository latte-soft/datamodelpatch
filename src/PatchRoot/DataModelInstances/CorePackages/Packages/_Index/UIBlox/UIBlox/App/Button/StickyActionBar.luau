local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_2.Core;
local l_Parent_3 = l_Parent_2.Parent;
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_3.Roact);
local l_Label_0 = require(l_Core_0.ImageSet.ImageSetComponent).Label;
local v8 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Core_0.ImageSet.Validator.validateImage);
local v10 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v11 = require(l_Parent_1.ImageSet.getIconSize);
local v12 = require(l_Core_0.Style.withStyle);
local v13 = require(l_Core_0.Text.GetTextSize);
local v14 = require(l_Parent_0.ActionBar);
local v15 = v11(v10.Large);
local v16 = v6.PureComponent:extend("StickyActionBar");
v16.validateProps = v5.strictInterface({
    actionBarProps = v5.optional(v14.validateProps), 
    infoProps = v5.optional(v5.strictInterface({
        title = v5.string, 
        icon = v5.optional(v9), 
        enableInfoAtStart = v5.optional(v5.boolean), 
        infoSectionWidth = v5.optional(v5.integer)
    })), 
    width = v5.optional(v5.integer), 
    layoutOrder = v5.optional(v5.integer)
});
v16.defaultProps = {
    actionBarProps = nil, 
    infoProps = nil, 
    layoutOrder = 1, 
    width = nil
};
v16.init = function(v17)
    v17.state = {
        containerWidth = nil
    };
    v17.onContainerSizeChange = function(v18)
        v17:setState(function(_, _)
            return {
                containerWidth = v18.AbsoluteSize.X
            };
        end);
    end;
    local function _()
        return UDim2.fromOffset(380, 48);
    end;
    local function _(v22, v23, v24)
        if not v24 or not v24.infoSectionWidth then
            return not not v23 and (v22 - 80) - UDim2.fromOffset(380, 48).X.Offset or v22 - 80;
        else
            return v24.infoSectionWidth;
        end;
    end;
    local function v33(v26, v27, v28, v29)
        if not v29 and v28 then
            local v30 = (v26 - v27) / 2;
            local v31 = nil;
            v31 = v26 < 1280 and 24 or 80;
            local l_Offset_0 = UDim2.fromOffset(380, 48).X.Offset;
            return {
                left = math.max(l_Offset_0 + v31, v30) - l_Offset_0, 
                right = 24
            };
        else
            return {
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                left = 24, 
                right = 24
            };
        end;
    end;
    local function _(v34, v35, v36)
        return v13(v34, v35.RelativeSize * v36.Font.BaseSize, v35.Font, (Vector2.new(10000, 10000))).X;
    end;
    v17.getLayoutConfig = function(v38, v39, v40, v41, v42, v43, v44)
        local v45 = not not v17.props.infoProps and (v17.props.infoProps.enableInfoAtStart and true or false);
        return {
            layoutOrder = not not v45 and {
                infoSection = 1, 
                actionBarSection = 2
            } or {
                infoSection = 2, 
                actionBarSection = 1
            }, 
            infoHorizontalAlignment = Enum.HorizontalAlignment.Left, 
            infoSectionWidth = if not not v40 and v40.infoSectionWidth then v40.infoSectionWidth else not not v39 and (v38 - 80) - UDim2.fromOffset(380, 48).X.Offset or v38 - 80, 
            infoSectionPadding = v33(v38, (v13(v42, v43.RelativeSize * v44.Font.BaseSize, v43.Font, (Vector2.new(10000, 10000))).X + v41) + (v41 > 0 and 12 or 0), v39, v45), 
            actionBarSectionSize = UDim2.fromOffset(380, 48), 
            actionBarSectionMarginOverride = {
                left = 0, 
                right = 0, 
                top = 0, 
                bottom = 0
            }
        };
    end;
end;
v16.render = function(v46)
    local v47 = v46.props.actionBarProps ~= nil;
    local v48 = v46.props.infoProps ~= nil;
    local v49 = v46.props.width or v46.state.containerWidth;
    assert(v47 or v48, "Either actionbar or info should be present");
    return v12(function(v50)
        local v51 = (not not v48 and v46.props.infoProps.icon) and v15 or 0;
        local v52 = not not v48 and v46.props.infoProps.title or "";
        local l_Header2_0 = v50.Font.Header2;
        local v54 = v46.getLayoutConfig(v49 or 0, v47, v46.props.infoProps, v51, v52, l_Header2_0, v50);
        local l_v46_0 = v46;
        local v56 = {
            layoutOrder = v46.props.layoutOrder, 
            size = not not v46.props.width and UDim2.new(0, v46.props.width, 1, 0) or UDim2.fromScale(1, 1), 
            onContainerSizeChange = v46.onContainerSizeChange, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            padding = {
                left = 56, 
                right = 24
            }
        };
        local v57 = {
            ActionBarSection = not not v47 and v46:renderHorizontalLayout({
                layoutOrder = v54.layoutOrder.actionBarSection, 
                size = v54.actionBarSectionSize, 
                horizontalAlignment = Enum.HorizontalAlignment.Left
            }, {
                ActionBar = v6.createElement(v14, {
                    button = v46.props.actionBarProps.button, 
                    icons = v46.props.actionBarProps.icons, 
                    marginOverride = v54.actionBarSectionMarginOverride, 
                    enableButtonAtStart = true
                })
            }) or nil
        };
        local l_v48_0 = v48;
        if l_v48_0 then
            l_v48_0 = false;
            if v49 ~= nil then
                l_v48_0 = v46:renderHorizontalLayout({
                    layoutOrder = v54.layoutOrder.infoSection, 
                    width = v54.infoSectionWidth, 
                    horizontalAlignment = v54.infoHorizontalAlignment, 
                    padding = v54.infoSectionPadding, 
                    internalSpacing = 12
                }, {
                    Icon = not not v46.props.infoProps.icon and v6.createElement(l_Label_0, {
                        Size = UDim2.new(0, v51, 0, v51), 
                        LayoutOrder = 1, 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Image = v46.props.infoProps.icon, 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Crop
                    }, {
                        RoundCorner = v6.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        })
                    }) or nil, 
                    Title = v6.createElement(v8, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(0, 0, 0, 48), 
                        AutomaticSize = Enum.AutomaticSize.X, 
                        Position = UDim2.new(0, v15 + 12, 0, 0), 
                        Text = v52, 
                        fluidSizing = false, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        colorStyle = v50.Theme.TextEmphasis, 
                        fontStyle = l_Header2_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        BackgroundTransparency = 1
                    })
                });
            end;
        end;
        v57.InfoSection = l_v48_0;
        return l_v46_0:renderHorizontalLayout(v56, v57);
    end);
end;
v16.renderHorizontalLayout = function(_, v60, v61)
    return v6.createElement("Frame", {
        Size = not not v60.size and v60.size or UDim2.new(0, v60.width, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v60.layoutOrder, 
        [v6.Change.AbsoluteSize] = v60.onContainerSizeChange
    }, {
        Layout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v60.horizontalAlignment, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v60.internalSpacing or 0)
        }), 
        Padding = if not v60.padding then nil else v6.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v60.padding.left or 0), 
            PaddingRight = UDim.new(0, v60.padding.right or 0), 
            PaddingTop = UDim.new(0, v60.padding.top or 0), 
            PaddingBottom = UDim.new(0, v60.padding.bottom or 0)
        }), 
        Elements = v6.createFragment(v61)
    });
end;
return v16;
