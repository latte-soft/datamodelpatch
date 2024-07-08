local l_CorePackages_0 = game:GetService("CorePackages");
local l_Lighting_0 = game:GetService("Lighting");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Roact);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v8 = {
    LightTheme = {
        SkyboxAssetLocation = "rbxasset://textures/AvatarEditorImages/LightPixel.png"
    }, 
    DarkTheme = {
        SkyboxAssetLocation = "rbxasset://textures/ui/AvatarExperience/AvatarExperienceSkyboxDarkTheme.png"
    }
};
local function _(v9)
    if v9.SelectedTheme:lower() == "dark" then
        return v8.DarkTheme.SkyboxAssetLocation;
    else
        return v8.LightTheme.SkyboxAssetLocation;
    end;
end;
local v11 = v3.Component:extend("AvatarSceneSky");
v11.defaultProps = {
    isVRAppBuild = l_IsVRAppBuild_0()
};
v11.validateProps = v2.interface({
    notificationService = v2.any, 
    lightingService = v2.optional(v2.Instance), 
    isVRAppBuild = v2.boolean
});
v11.init = function(v12)
    v12.state = {
        skyTexture = if v12.props.notificationService.SelectedTheme:lower() == "dark" then v8.DarkTheme.SkyboxAssetLocation else v8.LightTheme.SkyboxAssetLocation
    };
    v12.onThemeChanged = function()
        v12:setState({
            skyTexture = if v12.props.notificationService.SelectedTheme:lower() == "dark" then v8.DarkTheme.SkyboxAssetLocation else v8.LightTheme.SkyboxAssetLocation
        });
    end;
end;
v11.render = function(v13)
    local l_props_0 = v13.props;
    local l_notificationService_0 = l_props_0.notificationService;
    local l_skyTexture_0 = v13.state.skyTexture;
    return v3.createElement(v3.Portal, {
        target = l_props_0.lightingService or l_Lighting_0
    }, {
        SelectedThemeChangedConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_notificationService_0:GetPropertyChangedSignal("SelectedTheme"), 
            callback = v13.onThemeChanged
        }), 
        AvatarSceneSky = if v13.props.isVRAppBuild then nil else v3.createElement("Sky", {
            CelestialBodiesShown = true, 
            StarCount = 3000, 
            SkyboxBk = l_skyTexture_0, 
            SkyboxDn = l_skyTexture_0, 
            SkyboxFt = l_skyTexture_0, 
            SkyboxLf = l_skyTexture_0, 
            SkyboxRt = l_skyTexture_0, 
            SkyboxUp = l_skyTexture_0
        })
    });
end;
v11.didMount = function(v17)
    v17.onThemeChanged();
end;
return (l_RoactServices_0.connect({
    notificationService = l_AppNotificationService_0
})(v11));
