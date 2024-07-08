local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Parent_0.Core.Style.withStyle);
local v7 = require(l_Parent_1.Otter);
local v8 = require(l_Parent_0.App.ImageSet.Images);
local v9 = require(l_Parent_1.RoactGamepad);
local v10 = require(l_Core_0.Control.Enum.ControlState);
local v11 = require(script.Parent.SegmentedControlTabName);
local v12 = require(l_Core_0.ImageSet.ImageSetComponent);
local v13 = require(l_Core_0.Button.getContentStyle);
local v14 = require(l_Parent_0.App.ImageSet.getIconSize)(require(l_Parent_0.App.ImageSet.Enum.IconSize).Medium);
local v15 = {
    frequency = 10, 
    dampingRatio = 1
};
local v16 = v8["component_assets/circle_17"];
local v17 = v8["component_assets/dropshadow_16_20"];
local v18 = {
    [v10.Default] = "BackgroundUIDefault"
};
local v19 = {
    [v10.Default] = "Divider"
};
local v20 = {
    [v10.Default] = "UIDefault"
};
local v21 = {
    [v10.Default] = "DropShadow"
};
local v22 = {
    [v10.Default] = "SecondaryDefault", 
    [v10.Hover] = "SecondaryOnHover"
};
local function v30(v23)
    local v24, v25 = v4.array(v4.strictInterface({
        tabName = v4.string, 
        isDisabled = v4.optional(v4.boolean), 
        icon = v4.optional(v4.table)
    }))(v23);
    if v24 then
        local v26, v27 = v4.numberMin(2)(#v23);
        if v26 then
            local v28, v29 = v4.numberMax(4)(#v23);
            if v28 then
                return true;
            else
                return v28, v29;
            end;
        else
            return v26, v27;
        end;
    else
        return v24, v25;
    end;
end;
local v31 = v3.Component:extend("SegmentedControl");
v31.validateProps = v4.strictInterface({
    tabs = v30, 
    width = v4.UDim, 
    height = v4.optional(v4.number), 
    selectedTabIndex = v4.number, 
    onTabActivated = v4.callback, 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    layoutOrder = v4.optional(v4.number)
});
v31.defaultProps = {
    height = 44
};
v31.init = function(v32)
    v32.rootRef = v3.createRef();
    v32.tabRefs = v9.createRefCache();
    local v33, v34 = v3.createBinding(0);
    v32.selectedBackgroundPositionX = v33;
    v32.setSelectedBackgroundPositionX = v34;
    v32.selectedBackgroundMotor = v7.createSingleMotor(4);
    v32.selectedBackgroundMotor:onStep(function(v35)
        v32.setSelectedBackgroundPositionX(v35);
    end);
    v32:setState({
        tabWidth = 0
    });
    v32.onTabActivated = function(v36)
        v32.props.onTabActivated(v36);
    end;
    v32.setSize = function(v37)
        local v38 = math.floor((v37.AbsoluteSize.X - 8) / #v32.props.tabs);
        v32.selectedBackgroundMotor:setGoal(v7.spring(4 + v38 * (v32.props.selectedTabIndex - 1), v15));
        v32:setState({
            tabWidth = v38
        });
    end;
end;
v31.render = function(v39)
    return v6(function(v40)
        local l_controlState_0 = v39.state.controlState;
        local l_isDisabled_0 = v39.props.tabs[v39.props.selectedTabIndex].isDisabled;
        local v43 = not not l_isDisabled_0 and v10.Disabled or l_controlState_0;
        local v44 = v13(v18, l_controlState_0, v40);
        local v45 = v13(v19, l_controlState_0, v40);
        local v46 = v13(v20, v43, v40);
        local v47 = v13(v21, l_controlState_0, v40);
        local l_tabWidth_0 = v39.state.tabWidth;
        local v49 = not v39.props.icon and 0 or v14;
        local l_height_0 = v39.props.height;
        local v51 = v39.props.height - 12;
        local v52 = v39.props.height - 16;
        local v53 = {};
        for v54 = 1, #v39.props.tabs - 1 do
            if v54 ~= v39.props.selectedTabIndex and v54 ~= v39.props.selectedTabIndex - 1 then
                table.insert(v53, v54, v3.createElement("Frame", {
                    Size = UDim2.fromOffset(1, v52), 
                    BackgroundTransparency = v45.Transparency, 
                    BackgroundColor3 = v45.Color, 
                    Position = UDim2.fromOffset(4 + l_tabWidth_0 * v54, (l_height_0 - v52) / 2)
                }));
            end;
        end;
        return v9.withFocusController(function(v55)
            local function _(v56)
                if v56 > 1 then
                    v55.moveFocusTo(v39.tabRefs[v56 - 1]);
                end;
            end;
            local function _(v58)
                if v58 < #v39.props.tabs then
                    v55.moveFocusTo(v39.tabRefs[v58 + 1]);
                end;
            end;
            local function v60()
                v55.moveFocusTo(v39.rootRef);
            end;
            return v3.createElement("Frame", {
                Size = UDim2.new(v39.props.width.Scale, v39.props.width.Offset, 0, l_height_0), 
                BackgroundTransparency = 1, 
                [v3.Change.AbsoluteSize] = v39.setSize, 
                LayoutOrder = v39.props.layoutOrder
            }, {
                SizeConstraint = v3.createElement("UISizeConstraint", {
                    MinSize = Vector2.new((v49 + 80) * #v39.props.tabs + 8, l_height_0), 
                    MaxSize = Vector2.new(640, l_height_0)
                }), 
                Background = v3.createElement(v12.Label, {
                    Size = UDim2.new(1, 0, 0, v51), 
                    Position = UDim2.fromOffset(0, (l_height_0 - v51) / 2), 
                    BackgroundTransparency = 1, 
                    Image = v16, 
                    ImageColor3 = v44.Color, 
                    ImageTransparency = v44.Transparency, 
                    LayoutOrder = 1, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    ZIndex = 1
                }), 
                Dividers = v3.createElement(v9.Focusable.Frame, {
                    Size = UDim2.new(1, 0, 0, l_height_0), 
                    Position = UDim2.fromOffset(0, 0), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    NextSelectionLeft = v39.props.NextSelectionLeft, 
                    NextSelectionRight = v39.props.NextSelectionRight, 
                    NextSelectionUp = v39.props.NextSelectionUp, 
                    NextSelectionDown = v39.props.NextSelectionDown, 
                    [v3.Ref] = v39.rootRef, 
                    inputBindings = {
                        Enter = v9.Input.onBegin(Enum.KeyCode.ButtonA, function()
                            v55.moveFocusTo(v39.tabRefs[v39.props.selectedTabIndex]);
                        end)
                    }
                }, v53), 
                SelectedBackground = v3.createElement(v12.Label, {
                    Size = UDim2.fromOffset(l_tabWidth_0, v52), 
                    Position = v39.selectedBackgroundPositionX:map(function(v61)
                        return UDim2.fromOffset(v61, (l_height_0 - v52) / 2);
                    end), 
                    BackgroundTransparency = 1, 
                    Image = v16, 
                    ImageColor3 = v46.Color, 
                    ImageTransparency = v46.Transparency, 
                    LayoutOrder = 2, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    ZIndex = 4
                }), 
                SelectedBackgroundShadow = not l_isDisabled_0 and v3.createElement(v12.Label, {
                    Size = UDim2.fromOffset(l_tabWidth_0 + 12, v52 + 12), 
                    Position = v39.selectedBackgroundPositionX:map(function(v62)
                        return UDim2.fromOffset(v62 - 6, ((l_height_0 - v52) / 2 - 6) + 2);
                    end), 
                    BackgroundTransparency = 1, 
                    Image = v17, 
                    ImageColor3 = v47.Color, 
                    ImageTransparency = 0.3, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(27, 27, 29, 29), 
                    ZIndex = 3
                }), 
                TabContainer = v3.createElement(v9.Focusable.Frame, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.fromScale(0, 0), 
                    ZIndex = 5, 
                    defaultChild = v39.tabRefs[v39.props.selectedTabIndex]
                }, {
                    TabLayout = v3.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }); 
                    v3.createFragment((v5.List.map(v39.props.tabs, function(v63, v64)
                        return v3.createElement(v9.Focusable.Frame, {
                            key = v63.tabName, 
                            LayoutOrder = v64, 
                            Size = UDim2.fromOffset(l_tabWidth_0, l_height_0), 
                            BackgroundTransparency = 1, 
                            [v3.Ref] = v39.tabRefs[v64], 
                            NextSelectionLeft = v64 > 1 and v39.tabRefs[v64 - 1] or nil, 
                            NextSelectionRight = v64 < #v39.props.tabs and v39.tabRefs[v64 + 1] or nil, 
                            onFocusGained = function()
                                if not v63.isDisabled then
                                    v39.selectTab(v63);
                                end;
                            end, 
                            inputBindings = {
                                LeaveA = v9.Input.onBegin(Enum.KeyCode.ButtonA, v60), 
                                LeaveB = v9.Input.onBegin(Enum.KeyCode.ButtonB, v60), 
                                SelectNext1 = v9.Input.onBegin(Enum.KeyCode.ButtonR1, function()
                                    local l_v64_0 = v64;
                                    if l_v64_0 < #v39.props.tabs then
                                        v55.moveFocusTo(v39.tabRefs[l_v64_0 + 1]);
                                    end;
                                end), 
                                SelectPre1 = v9.Input.onBegin(Enum.KeyCode.ButtonL1, function()
                                    local l_v64_1 = v64;
                                    if l_v64_1 > 1 then
                                        v55.moveFocusTo(v39.tabRefs[l_v64_1 - 1]);
                                    end;
                                end), 
                                SelectNext2 = v9.Input.onBegin(Enum.KeyCode.ButtonR2, function()
                                    local l_v64_2 = v64;
                                    if l_v64_2 < #v39.props.tabs then
                                        v55.moveFocusTo(v39.tabRefs[l_v64_2 + 1]);
                                    end;
                                end), 
                                SelectPre2 = v9.Input.onBegin(Enum.KeyCode.ButtonL2, function()
                                    local l_v64_3 = v64;
                                    if l_v64_3 > 1 then
                                        v55.moveFocusTo(v39.tabRefs[l_v64_3 - 1]);
                                    end;
                                end), 
                                SelectNext3 = v9.Input.onBegin(Enum.KeyCode.ButtonR3, function()
                                    local l_v64_4 = v64;
                                    if l_v64_4 < #v39.props.tabs then
                                        v55.moveFocusTo(v39.tabRefs[l_v64_4 + 1]);
                                    end;
                                end), 
                                SelectPre3 = v9.Input.onBegin(Enum.KeyCode.ButtonL3, function()
                                    local l_v64_5 = v64;
                                    if l_v64_5 > 1 then
                                        v55.moveFocusTo(v39.tabRefs[l_v64_5 - 1]);
                                    end;
                                end)
                            }
                        }, {
                            Tab = v3.createElement(v11, {
                                text = v63.tabName, 
                                onActivated = function()
                                    v39.onTabActivated(v64);
                                end, 
                                Size = UDim2.fromScale(1, 1), 
                                isDisabled = v63.isDisabled, 
                                isSelectedStyle = v39.props.selectedTabIndex == v64, 
                                icon = v63.icon, 
                                iconStateColorMap = v22
                            })
                        });
                    end)))
                })
            });
        end);
    end);
end;
v31.didUpdate = function(v71, v72)
    if v72.selectedTabIndex ~= v71.props.selectedTabIndex then
        v71.selectedBackgroundMotor:setGoal(v7.spring(4 + v71.state.tabWidth * (v71.props.selectedTabIndex - 1), v15));
    end;
end;
return v31;
