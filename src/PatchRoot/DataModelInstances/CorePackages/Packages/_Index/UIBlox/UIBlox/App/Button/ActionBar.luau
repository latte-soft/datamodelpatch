local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_3.RoactGamepad);
local v7 = require(l_Parent_3.t);
local l_FitFrameOnAxis_0 = require(l_Parent_3.FitFrame).FitFrameOnAxis;
local v9 = require(l_Parent_0.Button);
local v10 = require(l_Parent_0.IconButton);
local v11 = require(l_Parent_0.TextButton);
local v12 = require(l_Parent_0.Enum.ButtonType);
local v13 = require(l_Parent_2.Core.Style.withStyle);
local v14 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v15 = require(l_Parent_1.Container.getPageMargin);
local v16 = require(l_Parent_1.Style.Constants);
local v17 = v4.PureComponent:extend("ActionBar");
v17.init = function(v18)
    v18.buttonRefs = v6.createRefCache();
    v18.state = {
        frameWidth = 0
    };
    v18.frameRef = v18.props.frameRef or v4.createRef();
    v18.updateFrameSize = function(v19)
        local l_X_0 = v19.AbsoluteSize.X;
        if l_X_0 ~= v18.state.frameWidth then
            v18:setState({
                frameWidth = l_X_0
            });
        end;
        if v18.props.onAbsoluteSizeChanged then
            v18.props.onAbsoluteSizeChanged(v19.AbsoluteSize);
        end;
    end;
    v18.getGamepadNextSelectionLeft = function(v21, _)
        return v21 > 1 and v18.buttonRefs[v21 - 1] or nil;
    end;
    v18.getGamepadNextSelectionRight = function(v23, v24)
        return v23 < v24 and v18.buttonRefs[v23 + 1] or nil;
    end;
end;
v17.validateProps = v7.strictInterface({
    button = v7.optional(v7.strictInterface({
        props = v9.validateProps
    })), 
    iconSize = v7.optional(v7.number), 
    buttonHeight = v7.optional(v7.number), 
    buttonPadding = v7.optional(v7.number), 
    enableButtonAtStart = v7.optional(v7.boolean), 
    icons = v7.optional(v7.array(v7.strictInterface({
        props = v10.validateProps
    }))), 
    marginOverride = v7.optional(v7.strictInterface({
        left = v7.number, 
        right = v7.number, 
        top = v7.number, 
        bottom = v7.number
    })), 
    horizontalAlignment = v7.optional(v7.enum(Enum.HorizontalAlignment)), 
    onAbsoluteSizeChanged = v7.optional(v7.callback), 
    [v4.Children] = v7.optional(v7.table), 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    frameRef = v7.optional(v7.table), 
    textButtons = v7.optional(v7.array(v7.strictInterface({
        props = v11.validateProps
    })))
});
v17.defaultProps = {
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    iconSize = 36, 
    buttonHeight = 48, 
    buttonPadding = 12
};
v17.render = function(v25)
    return v13(function(_)
        local v27 = v15(v25.state.frameWidth);
        local v28 = v25.state.frameWidth - v27 * 2;
        local l_Medium_0 = v14.Medium;
        local v30 = nil;
        v30 = if not v25.props.marginOverride then {
            left = v27, 
            right = v27, 
            top = 0, 
            bottom = v16.Layout.ActionBar.PositionOffset
        } else v25.props.marginOverride;
        local v31 = 0;
        if not (not v25.props.icons or not #v25.props.icons) then
            v31 = #v25.props.icons;
        end;
        local v32 = 0;
        if not (not v25.props.textButtons or not #v25.props.textButtons) then
            v32 = #v25.props.textButtons;
        end;
        local v33 = v25.props.button ~= nil and 1 or 0;
        local v34 = false;
        if v25.props.enableButtonAtStart == true then
            v34 = v33 ~= 0;
        end;
        local v35 = (v32 + v31) + v33;
        local v36 = {};
        if v31 ~= 0 then
            for v37, v38 in ipairs(v25.props.icons) do
                local v39 = not not v34 and v37 + v33 or v37;
                local v40 = v5.Dictionary.join({
                    layoutOrder = v39, 
                    iconSize = l_Medium_0
                }, v38.props);
                table.insert(v36, v4.createElement(v6.Focusable.Frame, {
                    key = "Button" .. tostring(v39), 
                    Size = UDim2.fromOffset(v25.props.iconSize, v25.props.iconSize), 
                    BackgroundTransparency = 1, 
                    [v4.Ref] = v25.buttonRefs[v39], 
                    NextSelectionUp = nil, 
                    NextSelectionDown = nil, 
                    NextSelectionLeft = v25.getGamepadNextSelectionLeft(v39, v35), 
                    NextSelectionRight = v25.getGamepadNextSelectionRight(v39, v35), 
                    inputBindings = {
                        Activated = not not v40.onActivated and v6.Input.onBegin(Enum.KeyCode.ButtonA, v40.onActivated) or nil
                    }
                }, {
                    Icon = v4.createElement(v10, v40)
                }));
            end;
        end;
        if v32 ~= 0 then
            for v41, v42 in ipairs(v25.props.textButtons) do
                local v43 = if not v34 then v41 else v41 + v33 + v31;
                local v44 = v5.Dictionary.join({
                    layoutOrder = v43
                }, v42.props);
                table.insert(v36, v4.createElement(v6.Focusable.Frame, {
                    key = "Button" .. tostring(v43), 
                    Size = UDim2.fromOffset(0, v25.props.iconSize), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    [v4.Ref] = v25.buttonRefs[v43], 
                    NextSelectionUp = nil, 
                    NextSelectionDown = nil, 
                    NextSelectionLeft = v25.getGamepadNextSelectionLeft(v43, v35), 
                    NextSelectionRight = v25.getGamepadNextSelectionRight(v43, v35), 
                    inputBindings = {
                        Activated = not not v44.onActivated and v6.Input.onBegin(Enum.KeyCode.ButtonA, v44.onActivated) or nil
                    }
                }, {
                    TextButton = v4.createElement(v11, v44)
                }));
            end;
        end;
        if v33 ~= 0 then
            local v45 = UDim2.fromOffset(v28 - v31 * (v25.props.iconSize + v25.props.buttonPadding), v25.props.buttonHeight);
            local v46 = if not v34 then v31 + 1 else 1;
            local v47 = v5.Dictionary.join({
                layoutOrder = v46, 
                size = v45
            }, v25.props.button.props);
            local v48 = {
                key = "Button" .. v46, 
                Size = v45, 
                BackgroundTransparency = 1, 
                [v4.Ref] = v25.buttonRefs[v46], 
                NextSelectionUp = nil, 
                NextSelectionDown = nil, 
                NextSelectionLeft = v25.getGamepadNextSelectionLeft(v46, v35), 
                NextSelectionRight = v25.getGamepadNextSelectionRight(v46, v35), 
                inputBindings = {
                    Activated = v6.Input.onBegin(Enum.KeyCode.ButtonA, v47.onActivated)
                }
            };
            if v47.buttonType == nil then
                v47.buttonType = if v31 == 0 then v12.PrimarySystem else v12.PrimaryContextual;
            end;
            table.insert(v36, if not v34 then v35 else 1, v4.createElement(v6.Focusable.Frame, v48, {
                Icon = v4.createElement(v9, v47)
            }));
        end;
        if v25.props[v4.Children] then
            v36 = v25.props[v4.Children];
        end;
        return v4.createElement(v6.Focusable[l_FitFrameOnAxis_0], {
            BackgroundTransparency = 1, 
            minimumSize = UDim2.new(1, 0, 0, v25.props.buttonHeight), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v25.props.horizontalAlignment, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            contentPadding = UDim.new(0, 12), 
            [v4.Ref] = v25.frameRef, 
            [v4.Change.AbsoluteSize] = v25.updateFrameSize, 
            margin = v30, 
            NextSelectionLeft = v25.props.NextSelectionLeft, 
            NextSelectionRight = v25.props.NextSelectionRight, 
            NextSelectionUp = v25.props.NextSelectionUp, 
            NextSelectionDown = v25.props.NextSelectionDown
        }, v36);
    end);
end;
v17.didMount = function(v49)
    if v49.frameRef.current then
        v49.updateFrameSize(v49.frameRef.current);
    end;
end;
local v52 = v4.forwardRef(function(v50, v51)
    return v4.createElement(v17, v5.Dictionary.join(v50, {
        frameRef = v51
    }));
end);
v52.validateProps = v17.validateProps;
return v52;
