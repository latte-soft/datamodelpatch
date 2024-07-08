local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactRoblox);
local v3 = require(l_Parent_0.Shared);
local v4 = require(script.RoactTree);
return {
    Component = v1.Component, 
    PureComponent = v1.PureComponent, 
    createElement = v1.createElement, 
    createRef = v1.createRef, 
    forwardRef = v1.forwardRef, 
    createContext = v1.createContext, 
    None = v1.None, 
    mount = v4.mount, 
    update = v4.update, 
    unmount = v4.unmount, 
    createFragment = require(script.createFragment), 
    oneChild = require(script.oneChild), 
    setGlobalConfig = require(script.setGlobalConfig), 
    Portal = require(script.Portal), 
    Ref = "ref", 
    Children = "children", 
    Event = v3.Event, 
    Change = v3.Change, 
    createBinding = v1.createBinding, 
    joinBindings = v1.joinBindings, 
    act = v2.act
};
