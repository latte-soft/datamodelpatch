local l_PolicyService_0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common:WaitForChild("PolicyService"));
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_Cryo_0 = v2.Cryo;
local l_t_0 = v2.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v12 = require(l_Parent_0.Flags.FFlagAlwaysShowDisplayNameInExpMenu);
local v13 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v15 = {
    AnchorPoint = Vector2.new(0, 1), 
    Position = UDim2.new(0, 24, 1, 1), 
    Size = UDim2.new(0, 56, 0, 56)
};
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local v17 = l_Roact_0.PureComponent:extend("PlayerLabelV2");
v17.validateProps = l_t_0.strictInterface(l_validatePropsWithForwardRef_0({
    userId = l_t_0.number, 
    username = l_t_0.string, 
    displayName = l_t_0.string, 
    isOnline = l_t_0.boolean, 
    isSelected = l_t_0.boolean, 
    LayoutOrder = l_t_0.integer, 
    Visible = l_t_0.optional(l_t_0.boolean), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    [l_Roact_0.Change.AbsolutePosition] = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Ref] = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
}));
v17.defaultProps = {
    Visible = true
};
if v11 then
    v17.init = function(v18)
        v18.onActivated = function()
            v18.props.onActivated(v18.props.userId);
        end;
    end;
end;
v17.renderButtons = function(v19)
    return (l_Cryo_0.Dictionary.join(v19.props[l_Roact_0.Children] or {}, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        })
    }));
end;
v17.renderWithSelectionCursor = function(v20, v21)
    local l_props_0 = v20.props;
    local v23 = l_PolicyService_0:IsSubjectToChinaPolicies() or v12;
    local v24 = l_props_0.displayName ~= "" and l_props_0.displayName or l_props_0.username;
    return l_withStyle_0(function(v25)
        local l_BackgroundContrast_0 = v25.Theme.BackgroundContrast;
        if v20.props.isSelected then
            l_BackgroundContrast_0 = v25.Theme.BackgroundOnHover;
        end;
        local l_onActivated_0 = v20.props.onActivated;
        if v11 then
            l_onActivated_0 = not not v20.props.onActivated and v20.onActivated or nil;
        end;
        return l_Roact_0.createElement("TextButton", {
            BackgroundTransparency = l_BackgroundContrast_0.Transparency, 
            BackgroundColor3 = l_BackgroundContrast_0.Color, 
            BorderSizePixel = 0, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 71), 
            Visible = l_props_0.Visible, 
            Text = "", 
            AutoButtonColor = false, 
            [l_Roact_0.Event.Activated] = l_onActivated_0, 
            [l_Roact_0.Change.AbsolutePosition] = v20.props[l_Roact_0.Change.AbsolutePosition], 
            [l_Roact_0.Ref] = v20.props.forwardRef, 
            SelectionImageObject = v21(l_CursorKind_0.Square)
        }, {
            PlayerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v15, {
                ImageColor3 = not not l_props_0.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115), 
                BackgroundTransparency = 1, 
                Image = l_props_0.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_props_0.userId .. "&w=60&h=60" or "", 
                ZIndex = 2
            })), 
            DisplayNameLabel = l_Roact_0.createElement(v13, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                Position = UDim2.new(0, 104, 0, not v23 and 35.5 or 14), 
                AnchorPoint = not not v23 and Vector2.new(0, 0) or Vector2.new(0, 0.5), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = not not v23 and v24 or l_props_0.username, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            UsernameLabel = v23 and l_Roact_0.createElement(v13, {
                fontKey = "Header2", 
                themeKey = "TextDefault", 
                Position = UDim2.new(0, 104, 0, 36), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = "@" .. l_props_0.username, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            ButtonContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -24, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v20:renderButtons())
        });
    end);
end;
v17.render = function(v28)
    return l_withSelectionCursorProvider_0(function(v29)
        return v28:renderWithSelectionCursor(v29);
    end);
end;
return l_Roact_0.forwardRef(function(v30, v31)
    return l_Roact_0.createElement(v17, l_Cryo_0.Dictionary.join(v30, {
        forwardRef = v31
    }));
end);
