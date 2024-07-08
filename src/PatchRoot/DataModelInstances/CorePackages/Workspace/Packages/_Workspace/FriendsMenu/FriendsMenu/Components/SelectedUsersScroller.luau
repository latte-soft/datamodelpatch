local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.Constants);
local v9 = require(script.Parent.FriendsMenuUserCard);
local v10 = require(l_Context_0.SelectedUsersContext);
return function(v11)
    local v12 = v4.useContext(v10);
    local v13 = l_useStyle_0();
    local l_Theme_0 = v13.Theme;
    local l_Font_0 = v13.Font;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v11.layoutOrder
    }, {
        VerticalLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 8), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        SelectedFriendsText = v4.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = l_Font_0.Header2.Font, 
            LayoutOrder = 0, 
            Text = l_useLocalization_0({
                selectedFriendsCountText = {
                    "Feature.FriendsMenu.Label.SelectedFriendsCount"; 
                    numerator = v12.selectedFriendsSize, 
                    denominator = 5
                }
            }).selectedFriendsCountText, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        SelectedUsers = if v12.selectedFriendsSize ~= 0 then v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 0, v8.FRIEND_MENU_CARD_SIZE), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X
        }, (v4.useMemo(function()
            local v16 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            };
            for v17, v18 in pairs(v12.selectedFriends) do
                v16["User-" .. tostring(v17)] = v4.createElement(v9, {
                    displayName = v18.displayName, 
                    layoutOrder = v18.layoutOrder, 
                    userId = v17
                });
            end;
            return v16;
        end, l_dependencyArray_0(v12.selectedFriends)))) else nil
    });
end;
