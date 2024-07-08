local l_Parent_0 = script.Parent.Parent;
return {
    Analytics = require(l_Parent_0.Analytics), 
    CentralOverlay = require(l_Parent_0.CentralOverlay), 
    Cryo = require(l_Parent_0.Cryo), 
    Dash = require(l_Parent_0.Dash), 
    Localization = require(l_Parent_0.Localization), 
    React = require(l_Parent_0.React), 
    RoactNavigation = require(l_Parent_0.RoactNavigation), 
    Style = require(l_Parent_0.Style), 
    UIBlox = require(l_Parent_0.UIBlox), 
    UserLib = require(l_Parent_0.UserLib), 
    PeekView = require(l_Parent_0.PeekView), 
    Hooks = {
        useNavigation = require(l_Parent_0.RoactUtils).Hooks.useNavigation
    }, 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    RoactUtils = require(l_Parent_0.RoactUtils), 
    RobloxAppEnums = require(l_Parent_0.RobloxAppEnums), 
    NavigationRodux = require(l_Parent_0.NavigationRodux)
};
