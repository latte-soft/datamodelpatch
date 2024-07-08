local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_0.App.ImageSet.Images);
local v6 = require(l_Parent_0.Core.Control.Enum.ControlState);
local v7 = require(l_Parent_0.App.Menu.DropdownMenuList);
local v8 = require(l_Parent_0.App.Menu.DropdownMenuCell);
local v9 = require(l_Parent_0.Core.Style.Validator.validateColorInfo);
local v10 = require(l_Parent_0.Utility.bind);
local v11 = require(l_Parent_0.UIBloxConfig);
local v12 = require(l_Parent_0.Core.Style.useStyle);
local v13 = require(script.Parent.StyleDefaults);
local function _(v14)
    if v14.key ~= nil then
        return v14.key;
    else
        return v14.text;
    end;
end;
local v16 = v2.Component:extend("DropdownMenu");
v16.validateProps = v3.strictInterface({
    placeholder = v3.string, 
    onChange = v3.callback, 
    height = if not v11.enableNewMenuLayout then v3.UDim else v3.optional(v3.UDim), 
    screenSize = v3.Vector2, 
    showDropShadow = v3.optional(v3.boolean), 
    fixedListHeight = v3.optional(v3.number), 
    errorState = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    onMenuOpenChange = v3.optional(v3.callback), 
    menuListBackground = v3.optional(v9), 
    cellDatas = v3.array(v3.strictInterface({
        icon = v3.optional(v3.union(v3.table, v3.string)), 
        text = v3.string, 
        key = v3.optional(v3.string), 
        disabled = v3.optional(v3.boolean), 
        keyCodeLabel = v3.optional(v3.union(v3.enum(Enum.KeyCode), v3.strictInterface({
            key = v3.enum(Enum.KeyCode), 
            axis = v3.optional(v3.string)
        }))), 
        iconColorOverride = v3.optional(v3.Color3), 
        textColorOverride = v3.optional(v3.Color3)
    })), 
    menuStateColors = v3.optional(v3.strictInterface({
        buttonDefault = v3.optional(v9), 
        contentDefault = v3.optional(v9), 
        alert = v3.optional(v9)
    })), 
    enableTokenOverride = v3.optional(v3.boolean), 
    isForcedClosed = v3.optional(v3.boolean), 
    selectionOrder = v3.optional(v3.number)
});
v16.defaultProps = {
    showDropShadow = false, 
    fixedListHeight = nil, 
    enableTokenOverride = false
};
v16.didUpdate = function(v17, _, v19)
    if v17.props.onMenuOpenChange and v17.state.menuOpen ~= v19.menuOpen then
        v17.props.onMenuOpenChange(v17.state.menuOpen);
    end;
end;
v16.init = function(v20)
    v20:setState({
        menuOpen = false, 
        selectedKey = nil, 
        absoluteSize = Vector2.new(0, 0)
    });
    v20.openMenu = function()
        v20:setState({
            menuOpen = true
        });
    end;
    v20.closeMenu = function()
        v20:setState({
            menuOpen = false
        });
    end;
    v20.onSelect = function(v21)
        v20:setState({
            menuOpen = false, 
            selectedKey = v21
        });
        v20.props.onChange(v21);
    end;
    v20.mapCellData = function(v22)
        local v23 = if v22.key ~= nil then v22.key else v22.text;
        local v24 = v4.Dictionary.join(v22, {
            key = v4.None
        });
        v24.onActivated = v10(v20.onSelect, v23);
        v24.selected = v20.state.selectedKey == v23;
        return v24;
    end;
    v20.onResize = function(v25)
        v20:setState({
            absoluteSize = v25.AbsoluteSize
        });
    end;
end;
v16.getDerivedStateFromProps = function(v26, v27)
    local v28 = false;
    for _, v30 in v26.cellDatas, nil, nil do
        if if v30.key ~= nil then v30.key else v30.text == v27.selectedKey then
            v28 = true;
            break;
        end;
    end;
    if v28 then
        return nil;
    else
        return {
            selectedKey = v2.None
        };
    end;
end;
v16.render = function(v31)
    local v32 = v4.List.map(v31.props.cellDatas, v31.mapCellData);
    local l_selectionOrder_0 = v31.props.selectionOrder;
    local v35 = v4.List.findWhere(v32, function(v34)
        return v34.selected;
    end);
    local v36 = if v35 ~= nil then v32[v35].text else v31.props.placeholder;
    local v37 = v31.state.absoluteSize.X > 640;
    local v38 = nil;
    local v39 = nil;
    if not v11.enableNewMenuLayout or not v31.props.enableTokenOverride then
        local v40 = "SecondaryDefault";
        local v41 = "SecondaryOnHover";
        if v31.state.menuOpen then
            v41 = v40;
        end;
        if v31.props.errorState then
            v40 = "Alert";
            v41 = "Alert";
        end;
        v38 = {
            [v6.Default] = v40, 
            [v6.Hover] = v41
        };
        v39 = {
            [v6.Default] = "TextEmphasis"
        };
    else
        local l_buttonDefault_0 = v31.props.menuStateColors.buttonDefault;
        local l_contentDefault_0 = v31.props.menuStateColors.contentDefault;
        if v31.props.errorState then
            l_buttonDefault_0 = v31.props.menuStateColors.alert;
        end;
        v38 = {
            [v6.Default] = l_buttonDefault_0
        };
        v39 = {
            [v6.Default] = l_contentDefault_0
        };
    end;
    if not (not v31.props.isForcedClosed or not v31.state.menuOpen) then
        v31:setState({
            menuOpen = false
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(UDim.new(1, 0), v31.props.height), 
        BackgroundTransparency = 1, 
        [v2.Change.AbsoluteSize] = v31.onResize, 
        [v2.Ref] = v31.props[v2.Ref]
    }, {
        InnerFrame = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            SpawnButton = v2.createElement(v8, {
                Size = UDim2.fromScale(1, 1), 
                buttonImage = v5["component_assets/circle_17_stroke_1"], 
                buttonStateColorMap = v38, 
                contentStateColorMap = v39, 
                icon = not not v31.state.menuOpen and v5["truncate_arrows/actions_truncationCollapse"] or v5["truncate_arrows/actions_truncationExpand"], 
                text = v36, 
                isDisabled = v31.props.isDisabled, 
                isLoading = false, 
                isActivated = v31.state.menuOpen, 
                hasContent = v35 ~= nil, 
                userInteractionEnabled = true, 
                onActivated = function()
                    if not v31.state.menuOpen then
                        v31.openMenu();
                        return ;
                    else
                        v31.closeMenu();
                        return ;
                    end;
                end, 
                enableTokenOverride = v31.props.enableTokenOverride, 
                SelectionOrder = l_selectionOrder_0
            }), 
            DropdownMenuList = v2.createElement(v7, {
                buttonProps = v32, 
                zIndex = 2, 
                open = v31.state.menuOpen, 
                openPositionY = UDim.new(0, 12), 
                buttonSize = UDim2.fromScale(1, 1), 
                closeBackgroundVisible = false, 
                menuListBackground = v31.props.menuListBackground, 
                screenSize = v31.props.screenSize, 
                showDropShadow = v31.props.showDropShadow, 
                fixedListHeight = v31.props.fixedListHeight, 
                onDismiss = v31.closeMenu, 
                enableTokenOverride = v31.props.enableTokenOverride, 
                selectionOrder = if not l_selectionOrder_0 then nil else l_selectionOrder_0 + 1
            }), 
            UISizeConstraint = not not v37 and v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(300, math.huge)
            }) or nil
        }) or nil
    });
end;
return v2.forwardRef(function(v44, v45)
    local v46 = nil;
    if not v11.enableNewMenuLayout or not v44.enableTokenOverride then
        v46 = v44;
    else
        local v47 = v13.getDropdownMenuDefaultTokens((v12()));
        v46 = v4.Dictionary.join(v44, {
            height = v44.height or v47.height, 
            menuStateColors = v4.Dictionary.join(v47.menuStateColors, v44.menuStateColors or {})
        });
    end;
    return v2.createElement(v16, v4.Dictionary.join(v46, {
        [v2.Ref] = v45
    }));
end);
