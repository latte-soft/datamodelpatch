local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Resources.Assets);
local v6 = require(l_Parent_0.Utility.divideTransparency);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v11 = l_Roact_0.PureComponent:extend("ThemedButton");
v11.validateProps = l_t_0.strictInterface({
    normalThemeKey = l_t_0.string, 
    hoverThemeKey = l_t_0.string, 
    imageProps = l_t_0.strictInterface({
        Image = l_t_0.union(l_t_0.string, l_t_0.table), 
        ScaleType = l_t_0.enum(Enum.ScaleType), 
        SliceCenter = l_t_0.Rect
    }), 
    enabled = l_t_0.optional(l_t_0.boolean), 
    renderChildren = l_t_0.callback, 
    onActivated = l_t_0.callback, 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    Size = l_t_0.optional(l_t_0.UDim2), 
    Visible = l_t_0.optional(l_t_0.boolean), 
    ButtonRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
});
v11.defaultProps = {
    imageProps = v5.Images.RoundedRect, 
    enabled = true
};
v11.init = function(v12)
    v12:setState({
        hover = false, 
        press = false
    });
end;
v11.renderWithSelectionCursor = function(v13, v14)
    local l_props_0 = v13.props;
    local l_normalThemeKey_0 = l_props_0.normalThemeKey;
    if not (not l_props_0.enabled or not v13.state.hover) then
        l_normalThemeKey_0 = l_props_0.hoverThemeKey;
    end;
    return l_withStyle_0(function(v17)
        local v18 = v17.Theme[l_normalThemeKey_0];
        assert(v18 ~= nil, "theme key " .. l_normalThemeKey_0 .. " is nil");
        local v19 = v6(v18.Transparency, not v13.state.press and 1 or 2);
        if not l_props_0.enabled then
            v19 = 0.5;
        end;
        return l_Roact_0.createElement(l_ImageSetButton_0, {
            Visible = l_props_0.Visible, 
            BackgroundTransparency = 1, 
            ImageColor3 = v18.Color, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            AnchorPoint = l_props_0.AnchorPoint, 
            ImageTransparency = v19, 
            LayoutOrder = l_props_0.LayoutOrder, 
            ScaleType = l_props_0.imageProps.ScaleType, 
            SliceCenter = l_props_0.imageProps.SliceCenter, 
            Image = l_props_0.imageProps.Image, 
            SelectionImageObject = v14(l_CursorKind_0.RoundedRectNoInset), 
            [l_Roact_0.Event.Activated] = function()
                if l_props_0.enabled then
                    l_props_0.onActivated();
                end;
            end, 
            [l_Roact_0.Event.MouseEnter] = function()
                v13:setState({
                    hover = true
                });
            end, 
            [l_Roact_0.Event.MouseLeave] = function()
                v13:setState({
                    hover = false, 
                    press = false
                });
            end, 
            [l_Roact_0.Event.InputBegan] = function(_, v21)
                if not (v21.UserInputType ~= Enum.UserInputType.MouseButton1) or v21.UserInputType == Enum.UserInputType.Touch then
                    v13:setState({
                        press = true
                    });
                end;
            end, 
            [l_Roact_0.Event.InputEnded] = function(_, v23)
                if not (v23.UserInputType ~= Enum.UserInputType.MouseButton1) or v23.UserInputType == Enum.UserInputType.Touch then
                    v13:setState({
                        press = false
                    });
                end;
            end, 
            [l_Roact_0.Ref] = v13.props.ButtonRef
        }, l_props_0.renderChildren(v19, l_props_0.enabled and v13.state.hover, l_props_0.enabled and v13.state.press));
    end);
end;
v11.render = function(v24)
    return l_withSelectionCursorProvider_0(function(v25)
        return v24:renderWithSelectionCursor(v25);
    end);
end;
return v11;
