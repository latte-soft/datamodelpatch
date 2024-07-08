local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v5 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v6 = require(l_Parent_0.UIBlox.Core.InputButton.InputButton);
local v7 = require(l_Parent_0.RoactGamepad);
local v8 = v1.PureComponent:extend("RadioButton");
v8.validateProps = v2.strictInterface({
    text = v2.string, 
    isSelected = v2.optional(v2.boolean), 
    isDisabled = v2.optional(v2.boolean), 
    onActivated = v2.callback, 
    size = v2.UDim2, 
    layoutOrder = v2.optional(v2.number), 
    id = v2.number, 
    NextSelectionDown = v2.optional(v2.table), 
    NextSelectionUp = v2.optional(v2.table), 
    NextSelectionLeft = v2.optional(v2.table), 
    NextSelectionRight = v2.optional(v2.table), 
    SelectionImageObject = v2.optional(v2.table), 
    forwardRef = v2.optional(v2.table)
});
v8.defaultProps = {
    text = "RadioButton Text", 
    isSelected = false, 
    isDisabled = false, 
    layoutOrder = 0
};
v8.init = function(v9)
    v9.onSetValue = function()
        if not v9.props.isDisabled then
            v9.props.onActivated(v9.props.id);
        end;
    end;
end;
v8.render = function(v10)
    return v4(function(v11)
        local l_Theme_0 = v11.Theme;
        local v13 = v5["component_assets/circle_24_stroke_1"];
        local l_Color_0 = l_Theme_0.TextDefault.Color;
        local v15 = v5["component_assets/circle_16"];
        local l_Color_1 = l_Theme_0.TextDefault.Color;
        local v17 = nil;
        local l_isSelected_0 = v10.props.isSelected;
        local l_Color_2 = l_Theme_0.TextDefault.Color;
        local l_Transparency_0 = l_Theme_0.TextDefault.Transparency;
        if v10.props.isDisabled then
            l_Transparency_0 = 0.5;
        end;
        if not l_isSelected_0 then
            v17 = UDim2.new(0, 0, 0, 0);
        else
            v17 = UDim2.new(0, 18, 0, 18);
            l_Color_1 = l_Theme_0.SystemPrimaryDefault.Color;
            l_Color_0 = l_Theme_0.SystemPrimaryDefault.Color;
        end;
        return v1.createElement(v7.Focusable[v6], {
            text = v10.props.text, 
            onActivated = v10.onSetValue, 
            size = v10.props.size, 
            image = v13, 
            imageColor = l_Color_0, 
            fillImage = v15, 
            fillImageSize = v17, 
            fillImageColor = l_Color_1, 
            selectedColor = l_Theme_0.SystemPrimaryDefault.Color, 
            textColor = l_Color_2, 
            transparency = l_Transparency_0, 
            layoutOrder = v10.props.layoutOrder, 
            isDisabled = v10.props.isDisabled, 
            [v1.Ref] = v10.props.forwardRef, 
            NextSelectionUp = v10.props.NextSelectionUp, 
            NextSelectionDown = v10.props.NextSelectionDown, 
            NextSelectionLeft = v10.props.NextSelectionLeft, 
            NextSelectionRight = v10.props.NextSelectionRight, 
            SelectionImageObject = v10.props.SelectionImageObject
        });
    end);
end;
return v1.forwardRef(function(v21, v22)
    return v1.createElement(v8, v3.Dictionary.join(v21, {
        forwardRef = v22
    }));
end);
