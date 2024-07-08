local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.UserLib);
return {
    Cryo = require(l_Parent_0.Cryo), 
    Dash = require(l_Parent_0.Dash), 
    Rodux = require(l_Parent_0.Rodux), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    RoactServices = require(l_Parent_0.RoactServices), 
    React = require(l_Parent_0.React), 
    ReactRoblox = require(l_Parent_0.ReactRoblox), 
    UIBlox = require(l_Parent_0.UIBlox), 
    Localization = require(l_Parent_0.Localization), 
    RobloxAppHooks = require(l_Parent_0.RobloxAppHooks), 
    RobloxAppEnums = require(l_Parent_0.RobloxAppEnums), 
    RoactServiceTags = require(l_Parent_0.RoactServiceTags), 
    Hooks = {
        dependencyArray = require(l_Parent_0.RoactUtils).Hooks.dependencyArray
    }, 
    LuauPolyfill = require(l_Parent_0.LuauPolyfill), 
    t = require(l_Parent_0.t), 
    ToastNotificationsProtocol = require(l_Parent_0.ToastNotificationsProtocol).ToastNotificationProtocol, 
    ToastNotificationProtocolEnums = require(l_Parent_0.ToastNotificationsProtocol).ToastNotificationProtocolEnums, 
    UserLib = v1, 
    getRbxthumbWithTypeSizeAndOptions = v1.Utils.getRbxthumbWithTypeSizeAndOptions, 
    UserLibConstants = v1.Utils.Constants
};
