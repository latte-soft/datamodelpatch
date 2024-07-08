local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_1.Core.Style.withStyle);
local v7 = require(script.Parent.ControllerBarHint);
local v8 = require(l_Parent_1.Core.Text.GetTextSize);
local l_ControllerBarHintInternalPadding_0 = require(script.Parent.BarConstants).ControllerBarHintInternalPadding;
local l_DefaultKeyLabelSize_0 = require(l_Parent_0.Menu.MenuConstants).DefaultKeyLabelSize;
local v11 = v3.PureComponent:extend("ControllerBar");
local v12 = v4.strictInterface({
    keyCode = v4.enum(Enum.KeyCode), 
    text = v4.string
});
v11.validateProps = v4.strictInterface({
    leftHint = v12, 
    rightHints = v4.optional(v4.map(v4.number, v12))
});
v11.init = function(v13)
    v13.state = {
        controllerBarWidth = 0, 
        hintStringsConcat = nil, 
        requiredSpace = nil, 
        hintRatios = nil
    };
end;
v11.calculateHintRatios = function(v14, v15)
    local v16 = 84;
    local v17 = "";
    local v18 = {};
    local v19 = 0;
    local v20 = v5.List.join({
        v14
    }, v15 or {});
    for _, v22 in ipairs(v20) do
        v18[v22.text] = v8(v22.text, 17, Enum.Font.ArialBold, Vector2.new(10000, 10000)).X;
        v19 = v19 + v18[v22.text];
        v16 = (v16 + l_DefaultKeyLabelSize_0) + l_ControllerBarHintInternalPadding_0;
        v17 = v17 .. v22.text;
    end;
    for v23, v24 in pairs(v18) do
        v18[v23] = v24 / v19;
    end;
    return v18, v16 + math.max(#v20 - 2, 0) * 40, v17;
end;
v11.getDerivedStateFromProps = function(v25)
    local v26, v27, v28 = v11.calculateHintRatios(v25.leftHint, v25.rightHints);
    return {
        hintRatios = v26, 
        requiredSpace = v27, 
        hintStringsConcat = v28
    };
end;
v11.calculateHintSize = function(v29, v30, v31)
    local v32 = v30 - v29.state.requiredSpace;
    local v33 = v31.Header2.RelativeSize * v31.BaseSize;
    local v34 = v31.Header2.RelativeMinSize * v31.BaseSize;
    local l_X_0 = v8(v29.state.hintStringsConcat, v34, v31.Header2.Font, Vector2.new(10000, 10000)).X;
    if l_X_0 <= v32 then
        local l_X_1 = v8(v29.state.hintStringsConcat, v33, v31.Header2.Font, Vector2.new(10000, 10000)).X;
        local v37 = (v33 - v34) / (l_X_1 - l_X_0);
        return nil, (math.clamp(v32 * v37 + (v33 - v37 * l_X_1), v34, v33));
    else
        local v38 = {};
        for v39, v40 in pairs(v29.state.hintRatios) do
            v38[v39] = v40 * v32;
        end;
        return v38;
    end;
end;
v11.render = function(v41)
    return v6(function(v42)
        local l_Theme_0 = v42.Theme;
        local v44, v45 = v41:calculateHintSize(v41.state.controllerBarWidth, v42.Font);
        local function v48(v46, v47)
            return v3.createElement(v7, (v5.Dictionary.join(v46, {
                key = "Hint" .. tostring(v47), 
                hintTextSize = v45, 
                maxWidth = not not v44 and v44[v46.text] or nil
            })));
        end;
        local v49 = nil;
        if v41.props.rightHints then
            v49 = v3.createFragment(v5.List.map(v41.props.rightHints, v48));
        end;
        return v3.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            Size = UDim2.new(1, 0, 0, 72), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            [v3.Change.AbsoluteSize] = function(v50)
                v41:setState({
                    controllerBarWidth = v50.AbsoluteSize.X
                });
            end, 
            [v3.Event.AncestryChanged] = function(v51)
                v41:setState({
                    controllerBarWidth = v51.AbsoluteSize.X
                });
            end
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            LeftFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.5, 1)
            }, {
                v3.createElement("UIListLayout", {
                    key = "Layout", 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40)
                }), 
                v48(v41.props.leftHint, "Left")
            }), 
            RightFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.5, 1), 
                Position = UDim2.fromScale(1, 0), 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40)
                }), 
                RightHints = v49
            })
        });
    end);
end;
return v11;
