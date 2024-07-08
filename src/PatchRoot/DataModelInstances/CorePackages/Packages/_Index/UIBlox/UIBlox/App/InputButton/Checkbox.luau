local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v5 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v6 = require(l_Parent_0.UIBlox.Core.InputButton.InputButton);
local v7 = require(l_Parent_0.UIBlox.App.SelectionImage.CursorKind);
local v8 = require(l_Parent_0.UIBlox.App.SelectionImage.withSelectionCursorProvider);
local v9 = require(l_Parent_0.UIBlox.App.SelectionCursor.withCursor);
local v10 = require(l_Parent_0.UIBlox.App.SelectionCursor.CursorType);
local v11 = require(l_Parent_0.UIBlox.UIBloxConfig);
local v12 = v1.PureComponent:extend("Checkbox");
v12.validateProps = v3.strictInterface({
    text = v3.string, 
    isSelected = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    onActivated = v3.callback, 
    size = v3.optional(v3.UDim2), 
    layoutOrder = v3.optional(v3.number), 
    frameRef = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionLeft = v3.optional(v3.table), 
    NextSelectionRight = v3.optional(v3.table)
});
v12.defaultProps = {
    text = "Checkbox Text", 
    isSelected = false, 
    isDisabled = false
};
v12.init = function(v13)
    v13.state = {
        value = v13.props.isSelected
    };
    v13.onFlip = function()
        if not v13.props.isDisabled then
            v13.props.onActivated(not v13.props.isSelected);
            return ;
        else
            return ;
        end;
    end;
end;
v12.render = function(v14)
    return v8(function(v15)
        return v4(function(v16)
            if not v11.migrateToNewSelectionCursor then
                return v14:renderWithProviders(v16, v15);
            else
                return v9(function(v17)
                    return v14:renderWithProviders(v16, v15, (v17.getCursorByType(v10.InputButton)));
                end);
            end;
        end);
    end);
end;
v12.renderWithProviders = function(v18, v19, v20, v21)
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local l_Theme_0 = v19.Theme;
    local l_Transparency_0 = l_Theme_0.TextDefault.Transparency;
    local l_Color_0 = l_Theme_0.TextDefault.Color;
    local l_Color_1 = l_Theme_0.SystemPrimaryContent.Color;
    if v18.props.isDisabled then
        l_Transparency_0 = 0.5;
    end;
    if not v18.props.isSelected then
        v22 = v5["squircles/hollow"];
        v23 = l_Theme_0.TextDefault.Color;
    else
        v22 = v5["squircles/fill"];
        v23 = l_Theme_0.SystemPrimaryDefault.Color;
        v24 = v5["icons/status/success_small"];
        v25 = UDim2.new(0, 14, 0, 14);
    end;
    return v1.createElement(v6, {
        text = v18.props.text, 
        onActivated = v18.onFlip, 
        size = v18.props.size, 
        image = v22, 
        imageColor = v23, 
        fillImage = v24, 
        fillImageSize = v25, 
        fillImageColor = l_Color_1, 
        selectedColor = l_Theme_0.SystemPrimaryDefault.Color, 
        textColor = l_Color_0, 
        transparency = l_Transparency_0, 
        layoutOrder = v18.props.layoutOrder, 
        isDisabled = v18.props.isDisabled, 
        [v1.Ref] = v18.props.frameRef, 
        SelectionImageObject = if not v11.migrateToNewSelectionCursor then v20(v7.InputButton) else v21
    });
end;
return v1.forwardRef(function(v30, v31)
    return v1.createElement(v12, v2.Dictionary.join(v30, {
        frameRef = v31
    }));
end);
