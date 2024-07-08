local l_Parent_0 = script.Parent.Parent;
return {
    React = require(l_Parent_0.React), 
    Roact = require(l_Parent_0.Roact), 
    Rodux = require(l_Parent_0.Rodux), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    Dash = require(l_Parent_0.Dash), 
    Hooks = {
        useNavigation = require(l_Parent_0.RoactUtils).Hooks.useNavigation, 
        useLocalization = require(l_Parent_0.Localization).Hooks.useLocalization, 
        useDidUpdate = require(l_Parent_0.RoactUtils).Hooks.useDidUpdate, 
        dependencyArray = require(l_Parent_0.RoactUtils).Hooks.dependencyArray
    }, 
    UIBlox = require(l_Parent_0.UIBlox), 
    LocalizationProvider = require(l_Parent_0.Localization).LocalizationProvider, 
    RoactNavigation = require(l_Parent_0.RoactNavigation)
};
