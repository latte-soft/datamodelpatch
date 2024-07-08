local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_Parent_0.Localization);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_getPageMargin_0 = v3.App.Container.getPageMargin;
local v10 = require(l_script_FirstAncestor_0.Hooks.useIsWideMode);
local v11 = require(l_script_FirstAncestor_0.Components.UserSearchBar.UserSearchBar);
return function(v12)
    local v13 = v10();
    local v15 = l_getPageMargin_0(l_useSelector_0(function(v14)
        return v14.ScreenSize;
    end).X);
    return v2.createElement(l_ImageSetButton_0, {
        BackgroundTransparency = 1, 
        Size = if not v13 then UDim2.new(1, -2 * v15, 0, 48) else UDim2.fromOffset(400, 48), 
        Position = UDim2.new(0, v15, 0, 0), 
        [v2.Event.Activated] = v12.onActivated
    }, {
        SearchBar = v2.createElement(v11, {
            isDisabled = true, 
            searchPlaceholderText = l_useLocalization_0({
                searchPlaceholderText = "Feature.AddFriends.Label.InputPlaceholder.SearchForPeople"
            }).searchPlaceholderText
        })
    });
end;
