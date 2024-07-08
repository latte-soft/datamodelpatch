local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v5.Core.ImageSet.ImageSetButton;
local l_Images_0 = v5.App.ImageSet.Images;
local v12 = UDim2.new(0, 44, 0, 44);
local v13 = l_Images_0["icons/menu/more_on"];
local v14 = l_Images_0["icons/menu/more_off"];
local v15 = UDim2.new(0, 37, 0, 37);
local v16 = l_Images_0["component_assets/circle_17"];
local v17 = Rect.new(8, 8, 9, 9);
local v18 = v3.PureComponent:extend("ItemDetailMoreButton");
v18.validateProps = v1.strictInterface({
    NextSelectionRight = v1.table, 
    NextSelectionDown = v1.optional(v1.table), 
    onActivated = v1.callback, 
    isSelected = v1.optional(v1.boolean), 
    forwardRef = v1.table
});
v18.init = function(v19)
    v19.isMounted = false;
    v19.state = {
        isButtonPressed = false
    };
    v19.onInputBegan = function()
        if v19.isMounted then
            v19:setState({
                isButtonPressed = true
            });
            return ;
        else
            return ;
        end;
    end;
    v19.onInputEnded = function()
        if v19.isMounted then
            v19:setState({
                isButtonPressed = false
            });
            return ;
        else
            return ;
        end;
    end;
    v19.moreButtonRef = v3.createRef();
end;
v18.renderWithStyle = function(v20, v21, v22)
    local l_Theme_0 = v21.Theme;
    local l_onActivated_0 = v20.props.onActivated;
    local l_isButtonPressed_0 = v20.state.isButtonPressed;
    local l_isSelected_0 = v20.props.isSelected;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    if l_isButtonPressed_0 then
        l_Transparency_0 = l_Theme_0.Overlay.Transparency;
    end;
    return v3.createElement(l_Focusable_0[l_ImageSetButton_0], {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v12, 
        Image = v16, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v17, 
        ImageTransparency = l_Transparency_0, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = 1, 
        ClipsDescendants = false, 
        [v3.Event.Activated] = l_onActivated_0, 
        [v3.Event.InputBegan] = v20.onInputBegan, 
        [v3.Event.InputEnded] = v20.onInputEnded, 
        [v3.Ref] = v20.moreButtonRef, 
        NextSelectionRight = v20.props.NextSelectionRight, 
        NextSelectionDown = v20.props.NextSelectionDown, 
        [v3.Ref] = v20.props.forwardRef, 
        SelectionImageObject = v22(l_CursorKind_0.RoundedRectNoInset)
    }, {
        Icon = v3.createElement(l_ImageSetLabel_0, {
            Size = v15, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = if not l_isSelected_0 then v14 else v13, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color
        })
    });
end;
v18.didMount = function(v28)
    v28.isMounted = true;
end;
v18.willUnmount = function(v29)
    v29.isMounted = false;
end;
v18.render = function(v30)
    return l_withStyle_0(function(v31)
        return l_withSelectionCursorProvider_0(function(v32)
            return v30:renderWithStyle(v31, v32);
        end);
    end);
end;
return v3.forwardRef(function(v33, v34)
    return v3.createElement(v18, v2.Dictionary.join(v33, {
        forwardRef = v34
    }));
end);
