local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Cryo_0 = v1.Cryo;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v10 = require(l_Parent_0.Components.ThemedTextLabel);
local v11 = require(l_Parent_0.Resources.Assets);
local v12 = require(l_CorePackages_0.Workspace.Packages.React);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v14 = l_Roact_0.PureComponent:extend("GameLabel");
v14.validateProps = l_t_0.strictInterface({
    gameId = l_t_0.number, 
    gameName = l_t_0.string, 
    LayoutOrder = l_t_0.integer, 
    onActivated = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    buttonRef = l_t_0.optional(l_t_0.table)
});
v14.renderButtons = function(v15)
    return (l_Cryo_0.Dictionary.join(v15.props[l_Roact_0.Children] or {}, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        })
    }));
end;
v14.renderWithSelectionCursor = function(v16, v17)
    local l_gameId_0 = v16.props.gameId;
    local l_PlaceholderGameIcon_0 = v11.Images.PlaceholderGameIcon;
    if v16.props.gameId > 0 then
        l_PlaceholderGameIcon_0 = "rbxthumb://type=GameIcon&id=" .. l_gameId_0 .. "&w=150&h=150";
    end;
    return l_withStyle_0(function(_)
        return l_Roact_0.createElement("TextButton", {
            [v12.Tag] = "data-testid=experienceLabel", 
            BackgroundTransparency = 1, 
            LayoutOrder = v16.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 70), 
            Text = "", 
            AutoButtonColor = false, 
            SelectionImageObject = v17(l_CursorKind_0.Square), 
            [l_Roact_0.Ref] = v16.props.buttonRef, 
            [l_Roact_0.Event.Activated] = v16.props.onActivated
        }, {
            GameIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 24, 0.5, 0), 
                Size = UDim2.new(0, 44, 0, 44), 
                BackgroundTransparency = 1, 
                Image = l_PlaceholderGameIcon_0
            }), 
            GameNameLabel = l_Roact_0.createElement(v10, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 80, 0.5, 0), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = v16.props.gameName, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            ButtonContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -24, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v16:renderButtons())
        });
    end);
end;
v14.render = function(v21)
    return l_withSelectionCursorProvider_0(function(v22)
        return v21:renderWithSelectionCursor(v22);
    end);
end;
return l_Roact_0.forwardRef(function(v23, v24)
    return l_Roact_0.createElement(v14, l_Cryo_0.Dictionary.join(v23, {
        buttonRef = v24
    }));
end);
