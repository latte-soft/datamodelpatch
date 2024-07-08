local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_0.Core.Style.withStyle);
local v6 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v7 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v8 = require(l_Parent_0.Core.ImageSet.Validator.validateImageSetData);
local v9 = require(l_Parent_0.App.Indicator.Badge);
local v10 = require(l_Parent_0.App.Indicator.Enum.BadgeStates);
local v11 = require(l_Parent_0.App.ImageSet.Enum.IconSize);
local v12 = require(l_Parent_0.App.ImageSet.getIconSize);
local v13 = require(l_Parent_0.Core.Control.InteractableList);
local v14 = require(l_Parent_0.Core.Animation.withAnimation);
local v15 = require(script.Parent.Enum.Placement);
local v16 = {
    frequency = 3
};
local v17 = v12(v11.Medium);
local v18 = v17 + 8;
local v19 = (v18 - v17) / 2;
local v20 = (v18 - v17) / 2;
local v21 = v19 + 4;
local v22 = v20 - 4;
local v23 = 12 + (64 - v18) / 2;
local v24 = 4 + (64 - v18);
local v25 = v2.PureComponent:extend("SystemBar");
v25.validateProps = v3.strictInterface({
    itemList = v3.array(v3.strictInterface({
        iconOn = v3.optional(v8), 
        iconOff = v3.optional(v8), 
        iconImageComponent = v3.optional(v3.union(v3.table, v3.callback)), 
        iconComponent = v3.optional(v3.union(v3.table, v3.callback)), 
        onActivated = v3.callback, 
        badgeValue = v3.optional(v3.union(v3.integer, v3.string, v10.isEnumValue)), 
        itemSize = v3.optional(v3.UDim2), 
        bottomAligned = v3.optional(v3.boolean)
    })), 
    selection = v3.optional(v3.integer), 
    placement = v3.optional(v15.isEnumValue), 
    hidden = v3.optional(v3.boolean), 
    onSafeAreaChanged = v3.optional(v3.callback), 
    size = v3.optional(v3.UDim2), 
    position = v3.optional(v3.UDim2), 
    layoutOrder = v3.optional(v3.integer), 
    layoutPaddingOffset = v3.optional(v3.UDim), 
    firstItemPaddingOffset = v3.optional(v3.UDim), 
    lastItemPaddingOffset = v3.optional(v3.UDim), 
    [v2.Children] = v3.optional(v3.any), 
    roundCorners = v3.optional(v3.boolean), 
    buttonStroke = v3.optional(v3.boolean), 
    bgTransparency = v3.optional(v3.integer), 
    sortOrder = v3.optional(v3.enum(Enum.SortOrder)), 
    clipsDescendants = v3.optional(v3.boolean), 
    experimentalTabSizePortraitY = v3.optional(v3.number)
});
v25.defaultProps = {
    placement = v15.Auto, 
    layoutPaddingOffset = UDim.new(0, 0), 
    firstItemPaddingOffset = UDim.new(0, 0), 
    lastItemPaddingOffset = UDim.new(0, 0), 
    clipsDescendants = true, 
    experimentalTabSizePortraitY = 48
};
v25.isPortrait = function(v26)
    if v26.props.placement == v15.Left then
        return false;
    elseif v26.props.placement == v15.Bottom then
        return true;
    else
        return v26.state.portrait;
    end;
end;
v25.renderItem = function(v27, v28, v29, v30, v31)
    local v32;
    if v28.iconOn ~= nil then
        v32 = true;
        if not (v28.iconOff == nil) then
            goto label0;
        end;
    end;
    v32 = true;
    if v28.iconImageComponent == nil then
        v32 = v28.iconComponent ~= nil;
    end;
    ::label0::;
    assert(v32, "items must define either iconOn and iconOff or iconImageComponent or iconComponent");
    local v33 = v29 == v6.Pressed;
    v32 = v33 or v29 == v6.Hover;
    if not v28.iconComponent then
        local v34 = nil;
        v34 = not not v28.badgeValue and (v28.badgeValue == v10.isEmpty and true or (not not v3.string(v28.badgeValue) or v28.badgeValue > 0));
        local l_v19_0 = v19;
        local l_v20_0 = v20;
        if v32 then
            if not v27:isPortrait() then
                l_v19_0 = v21;
            else
                l_v20_0 = v22;
            end;
        end;
        return v14({
            positionX = l_v19_0, 
            positionY = l_v20_0
        }, function(v37)
            return v5(function(v38)
                return v2.createElement(v28.iconImageComponent or v7.Label, {
                    Position = UDim2.fromOffset(math.floor(v37.positionX + 0.5), (math.floor(v37.positionY + 0.5))), 
                    Size = UDim2.fromOffset(v17, v17), 
                    BackgroundTransparency = not v27.props.buttonStroke and 1 or 0.99, 
                    Image = not not v30 and v28.iconOn or v28.iconOff, 
                    ImageColor3 = v38.Theme.IconDefault.Color, 
                    ImageTransparency = not v33 and 0 or 0.5
                }, {
                    Badge = not not v34 and v2.createElement(v9, {
                        position = if v28.badgeValue == v10.isEmpty then UDim2.fromOffset(22, 2) else UDim2.fromOffset(18, -2), 
                        value = v28.badgeValue
                    }) or nil, 
                    UICorner = not not v27.props.roundCorners and v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.15, 0)
                    }) or nil, 
                    UIStroke = not not v27.props.buttonStroke and v2.createElement("UIStroke", {
                        Color = Color3.new(0.4, 0.4, 0.4), 
                        Transparency = 0, 
                        Thickness = 1
                    }) or nil
                });
            end);
        end, v16), {
            LayoutOrder = v31
        };
    else
        local _ = nil;
        return v2.createElement(v28.iconComponent, {
            placement = if not v27:isPortrait() then v15.Left else v15.Bottom, 
            hovered = v32, 
            selected = v30, 
            pressed = v33, 
            badgeValue = v28.badgeValue
        }), {
            LayoutOrder = v31
        };
    end;
end;
v25.renderPortrait = function(v40, v41, v42)
    return v14({
        offset = if not v40.props.hidden then -v40.props.experimentalTabSizePortraitY else 0
    }, function(v43)
        return v2.createElement("Frame", v4.Dictionary.join(v41, {
            Position = UDim2.new(0, 0, 1, (math.floor(v43.offset + 0.5))), 
            Size = UDim2.new(1, 0, 0, v40.props.experimentalTabSizePortraitY), 
            ZIndex = 99
        }), {
            Layout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            InnerFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v4.Dictionary.join({
                Constraint = v2.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(600, v40.props.experimentalTabSizePortraitY)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = v40.props.layoutPaddingOffset + UDim.new(1 / #v40.props.itemList, -v18), 
                    SortOrder = v40.props.sortOrder
                }, {})
            }, v42))
        });
    end, v16);
end;
v25.renderLandscape = function(v44, v45, v46, v47)
    return v14({
        offset = not v44.props.hidden and 0 or -64
    }, function(v48)
        return v2.createElement("Frame", v4.Dictionary.join(v45, {
            Position = UDim2.new(0, math.floor(v48.offset + 0.5), 0, 0), 
            Size = UDim2.new(0, 64, 1, 0), 
            ZIndex = 99, 
            BackgroundTransparency = if not v47 then nil else 1
        }), v4.Dictionary.join({
            Padding = v2.createElement("UIPadding", {
                PaddingTop = if v47 then nil else v44.props.firstItemPaddingOffset + UDim.new(0, v23), 
                PaddingBottom = if not v47 then nil else v44.props.lastItemPaddingOffset + UDim.new(0, v24)
            }), 
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = if not v47 then nil else Enum.VerticalAlignment.Bottom, 
                Padding = v44.props.layoutPaddingOffset + UDim.new(0, v24), 
                SortOrder = v44.props.sortOrder
            })
        }, v46));
    end, v16);
end;
v25.renderBackground = function(v49, v50, v51)
    if not v49:isPortrait() then
        local v54 = v4.List.filter(v51, function(_, v53)
            return not v49.props.itemList[v53].bottomAligned;
        end);
        local v57 = v4.List.filter(v51, function(_, v56)
            return v49.props.itemList[v56].bottomAligned;
        end);
        local v58 = v49:renderLandscape(v50, v54);
        if #v57 > 0 then
            v58 = v2.createFragment({
                NavBar = v58, 
                BottomAlignedNavBar = v49:renderLandscape(v50, v57, true)
            });
        end;
        return v58;
    else
        return v49:renderPortrait(v50, v51);
    end;
end;
v25.renderSafeArea = function(v59)
    local v60 = nil;
    local v61 = nil;
    if not v59.props.hidden then
        if not v59:isPortrait() then
            v60 = UDim2.new(0, 64, 0, 0);
            v61 = UDim2.new(1, -64, 1, 0);
        else
            v60 = UDim2.new(0, 0, 0, 0);
            v61 = UDim2.new(1, 0, 1, -v59.props.experimentalTabSizePortraitY);
        end;
    else
        v60 = UDim2.new(0, 0, 0, 0);
        v61 = UDim2.new(1, 0, 1, 0);
    end;
    return v2.createElement("Frame", {
        Position = v60, 
        Size = v61, 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v59.onSafeAreaEvent, 
        [v2.Change.AbsolutePosition] = v59.onSafeAreaEvent
    }, v59.props[v2.Children]);
end;
v25.renderList = function(v62, v63, v64)
    return v5(function(v65)
        local l_Theme_0 = v65.Theme;
        return v2.createElement("Frame", {
            Position = v62.props.position or UDim2.new(0, 0, 0, 0), 
            Size = v62.props.size or UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            ClipsDescendants = v62.props.clipsDescendants, 
            LayoutOrder = v62.props.layoutOrder, 
            BackgroundTransparency = v62.props.bgTransparency or 1, 
            [v2.Change.AbsoluteSize] = function(v67)
                if v62.state.portrait and v67.AbsoluteSize.Y < v67.AbsoluteSize.X then
                    v62:setState({
                        portrait = false
                    });
                    return ;
                else
                    if not v62.state.portrait and v67.AbsoluteSize.X < v67.AbsoluteSize.Y then
                        v62:setState({
                            portrait = true
                        });
                    end;
                    return ;
                end;
            end
        }, {
            NavBar = v62:renderBackground({
                BackgroundColor3 = l_Theme_0.NavigationBar.Color, 
                BackgroundTransparency = if not v62.props.roundCorners then l_Theme_0.NavigationBar.Transparency else 1, 
                BorderSizePixel = 0
            }, (v4.List.map(v63, function(_, v69)
                return v64(v69);
            end))), 
            SafeArea = v62:renderSafeArea()
        }, {
            UICorner = not not v62.props.roundCorners and v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.15, 0) or nil
            }) or nil
        });
    end);
end;
v25.init = function(v70)
    v70:setState({
        portrait = true
    });
    v70.onSelectionChanged = function(v71)
        if #v71 > 0 then
            local v72 = v70.props.itemList[v71[1]];
            if not (not v72 or not v72.onActivated) then
                v72.onActivated();
            end;
        end;
    end;
    v70.onSafeAreaEvent = function(v73)
        if v70.props.onSafeAreaChanged then
            v70.props.onSafeAreaChanged({
                Position = v73.Position, 
                AbsolutePosition = v73.AbsolutePosition, 
                Size = v73.Size, 
                AbsoluteSize = v73.AbsoluteSize
            });
        end;
    end;
end;
v25.render = function(v74)
    local l_itemList_0 = v74.props.itemList;
    local v76;
    v76 = v74.props.selection and if l_itemList_0[v76] == nil then nil else {
        v76
    };
    return v2.createElement(v13, {
        itemList = l_itemList_0, 
        selection = v76, 
        itemSize = UDim2.fromOffset(v18, v18), 
        renderList = function(...)
            return v74:renderList(...);
        end, 
        renderItem = function(...)
            return v74:renderItem(...);
        end, 
        sortOrder = v74.props.sortOrder, 
        onSelectionChanged = v74.onSelectionChanged
    });
end;
return v25;
