local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Cryo_0 = v1.Cryo;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v14 = {
    AnchorPoint = Vector2.new(0, 0.5), 
    Position = UDim2.new(0, 24, 0.5, 0), 
    Size = UDim2.new(0, 44, 0, 44)
};
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local v16 = l_Roact_0.PureComponent:extend("PlayerLabel");
v16.validateProps = l_t_0.strictInterface(l_validatePropsWithForwardRef_0({
    userId = l_t_0.number, 
    username = l_t_0.string, 
    isOnline = l_t_0.boolean, 
    isSelected = l_t_0.boolean, 
    LayoutOrder = l_t_0.integer, 
    Visible = l_t_0.optional(l_t_0.boolean), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    [l_Roact_0.Change.AbsolutePosition] = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Ref] = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
}));
v16.defaultProps = {
    Visible = true
};
if v8 then
    v16.init = function(v17)
        v17.onActivated = function()
            v17.props.onActivated(v17.props.userId);
        end;
    end;
end;
v16.renderButtons = function(v18)
    return (l_Cryo_0.Dictionary.join(v18.props[l_Roact_0.Children] or {}, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        })
    }));
end;
v16.renderWithSelectionCursor = function(v19, v20)
    local l_props_0 = v19.props;
    return l_withStyle_0(function(v22)
        local l_BackgroundContrast_0 = v22.Theme.BackgroundContrast;
        if v19.props.isSelected then
            l_BackgroundContrast_0 = {
                Color = Color3.fromRGB(48, 50, 52), 
                Transparency = 0
            };
        end;
        local l_onActivated_0 = v19.props.onActivated;
        if v8 then
            l_onActivated_0 = not not v19.props.onActivated and v19.onActivated or nil;
        end;
        return l_Roact_0.createElement("TextButton", {
            BackgroundTransparency = l_BackgroundContrast_0.Transparency, 
            BackgroundColor3 = l_BackgroundContrast_0.Color, 
            BorderSizePixel = 0, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 70), 
            Visible = l_props_0.Visible, 
            Text = "", 
            AutoButtonColor = false, 
            [l_Roact_0.Event.Activated] = l_onActivated_0, 
            [l_Roact_0.Change.AbsolutePosition] = v19.props[l_Roact_0.Change.AbsolutePosition], 
            [l_Roact_0.Ref] = v19.props.forwardRef, 
            SelectionImageObject = v20(l_CursorKind_0.Square)
        }, {
            PlayerCutout = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v14, {
                BackgroundTransparency = 1, 
                Image = v9.Images.CircleCutout, 
                ImageColor3 = l_BackgroundContrast_0.Color, 
                ZIndex = 3
            })), 
            PlayerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v14, {
                BackgroundTransparency = 1, 
                Image = l_props_0.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_props_0.userId .. "&w=48&h=48" or "", 
                ZIndex = 2
            })), 
            PlayerBackground = l_Roact_0.createElement("Frame", l_Cryo_0.Dictionary.join(v14, {
                BackgroundColor3 = v22.Theme.UIDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            })), 
            OnlineIndicator = l_Roact_0.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v9.Images.Circle, 
                ImageColor3 = not not l_props_0.isOnline and v22.Theme.OnlineStatus.Color or v22.Theme.UIDefault.Color, 
                Position = UDim2.new(0, 80, 0.5, 0), 
                Size = UDim2.new(0, 16, 0, 16)
            }), 
            UsernameLabel = l_Roact_0.createElement(v10, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 100, 0.5, 0), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = l_props_0.username, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            ButtonContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -24, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v19:renderButtons())
        });
    end);
end;
v16.render = function(v25)
    return l_withSelectionCursorProvider_0(function(v26)
        return v25:renderWithSelectionCursor(v26);
    end);
end;
return l_Roact_0.forwardRef(function(v27, v28)
    return l_Roact_0.createElement(v16, l_Cryo_0.Dictionary.join(v27, {
        forwardRef = v28
    }));
end);
