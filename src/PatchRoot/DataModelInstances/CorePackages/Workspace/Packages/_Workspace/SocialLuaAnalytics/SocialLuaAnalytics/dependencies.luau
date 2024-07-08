local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
return {
    t = require(l_Parent_0.t), 
    tutils = require(l_Parent_0.tutils), 
    RoduxPresence = v1.RoduxPresence.config({
        keyPath = "SocialLuaAnalytics.Presence"
    }), 
    llama = v1.llama, 
    enumerate = require(l_Parent_0.enumerate), 
    SocialLibraries = v1.SocialLibraries.config({}), 
    LuauPolyfill = require(l_Parent_0.LuauPolyfill), 
    Rodux = require(l_Parent_0.Rodux), 
    RoactRodux = require(l_Parent_0.RoactRodux), 
    Dash = require(l_Parent_0.Dash)
};
