local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local l_Debounce_0 = require(l_Parent_0.NotificationsCommon).Debounce;
local l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableFriendsListSearchNormalizationErrorFix;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_Images_0 = v3.App.ImageSet.Images;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local v12 = require(l_script_FirstAncestor_0.Context.FriendsListContext);
local v13 = l_Images_0["icons/menu/search"];
local v14 = l_Images_0["icons/actions/edit/clear"];
local v15 = {
    searchPlaceHolder = "Feature.SettingsHub.Label.SearchForFriendsPlaceholder"
};
return function(v16)
    local v17 = l_useStyle_0();
    local v18 = v2.useContext(v12);
    local v19 = l_getLocalizedStrings_0(v15);
    local v20 = v2.useRef(nil);
    local l_searchFriendsString_0 = v18.searchFriendsString;
    local l_searchFriends_0 = v18.searchFriends;
    local v23 = #l_searchFriendsString_0 > 0;
    local v24 = nil;
    v24 = not l_GetFFlagEnableFriendsListSearchNormalizationErrorFix_0() and function(v25)
        l_searchFriends_0(v25.Text);
    end or v2.useCallback(l_Debounce_0(function(v26)
        l_searchFriends_0(v26.Text:lower());
    end, 0.5), {
        l_searchFriends_0
    });
    v2.useEffect(function()
        if not (not v20.current or not v16.focusElement) then
            v20.current:CaptureFocus();
        end;
    end, {
        v20.current
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AnchorPoint = Vector2.new(0, 0.5), 
        Size = v16.size, 
        LayoutOrder = v16.layoutOrder
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 4)
        }), 
        UIStroke = v2.createElement("UIStroke", {
            Thickness = 1, 
            Color = v17.Theme.UIDefault.Color, 
            Transparency = v17.Theme.UIDefault.Transparency
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 6), 
            PaddingBottom = UDim.new(0, 6)
        }), 
        SearchIcon = v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 0, 
            Size = UDim2.fromOffset(18, 18), 
            BackgroundTransparency = 1, 
            Image = v13, 
            ImageColor3 = v17.Theme.IconEmphasis.Color, 
            ImageTransparency = v17.Theme.IconEmphasis.Transparency
        }), 
        SearchField = v2.createElement("TextBox", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -46, 1, 0), 
            ClearTextOnFocus = false, 
            PlaceholderColor3 = v17.Theme.TextDefault.Color, 
            PlaceholderText = v19.searchPlaceHolder, 
            Text = l_searchFriendsString_0, 
            TextColor3 = v17.Theme.TextDefault.Color, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 16, 
            Font = v17.Font.Body.Font, 
            ref = v20, 
            [v2.Event.Focused] = v16.onFocus, 
            [v2.Change.Text] = v24
        }), 
        ClearButton = not not v23 and v2.createElement(l_ImageSetButton_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, 24, 0, 24), 
            Image = v14, 
            ImageColor3 = v17.Theme.IconEmphasis.Color, 
            ImageTransparency = v17.Theme.IconEmphasis.Transparency, 
            [v2.Event.Activated] = function()
                l_searchFriends_0("");
            end
        }) or nil
    });
end;
