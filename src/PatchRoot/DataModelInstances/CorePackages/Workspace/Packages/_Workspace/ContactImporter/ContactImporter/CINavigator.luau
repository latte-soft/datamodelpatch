local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_RoactNavigation_0 = v1.RoactNavigation;
local l_EnumScreens_0 = v1.SocialModalsCommon.EnumScreens;
local v4 = require(l_Parent_0.FindFriendsModal);
local v5 = require(l_Parent_0.ContactsList.Components.ContactsList);
local v6 = require(l_Parent_0.ContactsList.Components.ContactsRevokedAccessDialog);
local v7 = require(l_Parent_0.ContactsList.Components.ContactImporterContext);
local l_DiscoverabilityOverlay_0 = v1.DiscoverabilityOverlay;
local l_Roact_0 = v1.Roact;
local v10 = l_RoactNavigation_0.createRobloxSwitchNavigator({
    {
        [l_EnumScreens_0.FindFriendsModal] = v4
    }, 
    {
        [l_EnumScreens_0.ContactsList] = v5
    }, 
    {
        [l_EnumScreens_0.ContactsRevokedAccessDialog] = v6
    }, 
    {
        [l_EnumScreens_0.DiscoverabilityOverlay] = l_DiscoverabilityOverlay_0
    }
}, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        absorbInput = true, 
        overlayTransparency = 1
    }, 
    mode = l_RoactNavigation_0.StackPresentationStyle.Modal
});
local v11 = l_Roact_0.PureComponent:extend("CINavigatorWrapped");
v11.render = function(v12)
    return l_Roact_0.createElement(v7(function(_)
        return l_Roact_0.createElement(v10, {
            navigation = v12.props.navigation
        });
    end), v12.props);
end;
v11.router = v10.router;
return v11;
