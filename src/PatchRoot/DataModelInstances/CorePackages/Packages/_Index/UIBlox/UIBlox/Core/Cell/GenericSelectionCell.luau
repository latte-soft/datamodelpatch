local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.Core.Style.withStyle);
local v6 = require(l_Parent_1.UIBlox.Core.Control.Enum.ControlState);
local v7 = require(l_Parent_1.UIBlox.Core.Cell.GenericCell);
local v8 = require(l_Parent_1.UIBlox.Core.ImageSet.ImageSetComponent);
local v9 = v2.PureComponent:extend("GenericSelectionCell");
local v10 = {
    [v6.Default] = "BackgroundDefault", 
    [v6.Hover] = "BackgroundOnHover", 
    [v6.Pressed] = "BackgroundOnPress"
};
local v11 = {
    [v6.Default] = "IconDefault", 
    [v6.Hover] = "IconEmphasis", 
    [v6.Pressed] = "IconDefault"
};
local function v17(v12, v13, v14)
    local v15 = v12[v13] or v12[v6.Default];
    local v16 = {
        Color = v14.Theme[v15].Color, 
        Transparency = v14.Theme[v15].Transparency
    };
    if not (v13 ~= v6.Default) or v13 == v6.Disabled then
        v16.Transparency = 1;
    end;
    return v16;
end;
local function v23(v18, v19, v20)
    local v21 = v18[v19] or v18[v6.Default];
    local v22 = {
        Color = v20.Theme[v21].Color, 
        Transparency = v20.Theme[v21].Transparency
    };
    if not (v19 ~= v6.Disabled) or v19 == v6.Pressed then
        v22.Transparency = 0.5 * v22.Transparency + 0.5;
    end;
    return v22;
end;
local function _(v24, v25)
    local v26 = {
        Color = v24.Color, 
        Transparency = v24.Transparency
    };
    if not (v25 ~= v6.Disabled) or v25 == v6.Pressed then
        v26.Transparency = 0.5 * v26.Transparency + 0.5;
    end;
    return v26;
end;
v9.validateProps = v4.strictInterface({
    text = v4.string, 
    subtitleText = v4.optional(v4.string), 
    defaultImage = v4.union(v4.string, v4.table), 
    selectedImage = v4.union(v4.string, v4.table), 
    defaultImageSize = v4.number, 
    selectedImageSize = v4.number, 
    onActivated = v4.optional(v4.callback), 
    isSelected = v4.optional(v4.boolean), 
    isDisabled = v4.optional(v4.boolean), 
    useDefaultControlState = v4.optional(v4.boolean), 
    controlRef = v4.optional(v4.table), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    SelectionImageObject = v4.optional(v4.table)
});
v9.defaultProps = {
    isSelected = false
};
v9.init = function(v28)
    v28.state = {
        controlState = v6.Default
    };
    v28.onStateChanged = function(_, v30)
        v28:setState({
            controlState = v30
        });
    end;
end;
v9.render = function(v31)
    assert(v31.validateProps(v31.props));
    return v5(function(v32)
        local l_Font_0 = v32.Font;
        local l_Theme_0 = v32.Theme;
        local v35 = not not v31.props.useDefaultControlState and v6.Default or v31.state.controlState;
        local v36 = v23(v11, v35, v32);
        local v37 = v17(v10, v35, v32);
        local l_TextEmphasis_0 = l_Theme_0.TextEmphasis;
        local v39 = {
            Color = l_TextEmphasis_0.Color, 
            Transparency = l_TextEmphasis_0.Transparency
        };
        if not (v35 ~= v6.Disabled) or v35 == v6.Pressed then
            v39.Transparency = 0.5 * v39.Transparency + 0.5;
        end;
        local l_v39_0 = v39;
        v39 = l_Theme_0.TextDefault;
        local v41 = {
            Color = v39.Color, 
            Transparency = v39.Transparency
        };
        if not (v35 ~= v6.Disabled) or v35 == v6.Pressed then
            v41.Transparency = 0.5 * v41.Transparency + 0.5;
        end;
        return v2.createElement(v7, {
            titleText = v31.props.text, 
            colorStyle = v37, 
            textStyle = l_v39_0, 
            fontStyle = l_Font_0.Header2, 
            subtitleText = v31.props.subtitleText, 
            subtitleTextStyle = v41, 
            subtitleFontStyle = l_Font_0.Body, 
            rightContentWidth = v31.props.defaultImageSize, 
            onActivated = v31.props.onActivated, 
            dividerStyle = l_Theme_0.Divider, 
            isDisabled = v31.props.isDisabled, 
            [v2.Ref] = v31.props.controlRef, 
            NextSelectionUp = v31.props.NextSelectionUp, 
            NextSelectionDown = v31.props.NextSelectionDown, 
            NextSelectionLeft = v31.props.NextSelectionLeft, 
            NextSelectionRight = v31.props.NextSelectionRight, 
            SelectionImageObject = v31.props.SelectionImageObject, 
            renderRightContent = function()
                return v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v31.props.defaultImageSize, 1, 0), 
                    LayoutOrder = 3
                }, {
                    SelectionImage = v2.createElement(v8.Label, {
                        BackgroundTransparency = 1, 
                        Image = v31.props.defaultImage, 
                        Size = UDim2.new(0, v31.props.defaultImageSize, 0, v31.props.defaultImageSize), 
                        ImageColor3 = v36.Color, 
                        ImageTransparency = v36.Transparency, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0)
                    }, {
                        SelectedImage = v31.props.isSelected and v2.createElement(v8.Label, {
                            BackgroundTransparency = 1, 
                            Image = v31.props.selectedImage, 
                            Size = UDim2.new(0, v31.props.selectedImageSize, 0, v31.props.selectedImageSize), 
                            ImageColor3 = v36.Color, 
                            ImageTransparency = v36.Transparency, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0)
                        })
                    })
                });
            end, 
            onStateChanged = v31.onStateChanged
        });
    end);
end;
return v2.forwardRef(function(v42, v43)
    return v2.createElement(v9, v3.Dictionary.join(v42, {
        controlRef = v43
    }));
end);
