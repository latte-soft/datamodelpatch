local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_lazyRequire_0 = require(l_Parent_0.LazyRequire).lazyRequire;
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RoduxPresence);
local v6 = require(l_Parent_0.RoduxFriends);
if not game:DefineFastFlag("LuaAppSocialLibUseLazyRequire", false) then
    return {
        Roact = require(l_Parent_0.Roact), 
        React = require(l_Parent_0.React), 
        UIBlox = v4, 
        RoactFitComponents = require(l_Parent_0.RoactFitComponents), 
        GenericPagination = require(l_Parent_0.GenericPagination), 
        Cryo = require(l_Parent_0.Cryo), 
        RoactNavigation = require(l_Parent_0.RoactNavigation), 
        Rodux = require(l_Parent_0.Rodux), 
        Lumberyak = require(l_Parent_0.Lumberyak), 
        tutils = require(l_Parent_0.tutils), 
        t = require(l_Parent_0.t), 
        Promise = require(l_Parent_0.Promise), 
        Symbol = require(l_Parent_0.Symbol), 
        LuauPolyfill = require(l_Parent_0.LuauPolyfill), 
        Otter = require(l_Parent_0.Otter), 
        llama = require(l_Parent_0.llama), 
        RoduxPresence = v5.config({
            keyPath = "SocialLibraries.Presence"
        }), 
        RoduxFriends = v6.config({
            keyPath = "SocialLibraries.Friends"
        }), 
        enumerate = require(l_Parent_0.enumerate), 
        Players = l_Players_0, 
        UserInputService = l_UserInputService_0, 
        Text = require(script.Parent.temp.Text), 
        UserModel = require(script.Parent.temp.User)
    };
else
    return {
        Roact = require(l_Parent_0.Roact), 
        React = require(l_Parent_0.React), 
        UIBlox = v4, 
        RoactFitComponents = l_lazyRequire_0(l_Parent_0.RoactFitComponents), 
        GenericPagination = l_lazyRequire_0(l_Parent_0.GenericPagination), 
        Cryo = require(l_Parent_0.Cryo), 
        RoactNavigation = require(l_Parent_0.RoactNavigation), 
        Rodux = require(l_Parent_0.Rodux), 
        Lumberyak = require(l_Parent_0.Lumberyak), 
        tutils = require(l_Parent_0.tutils), 
        t = require(l_Parent_0.t), 
        Promise = l_lazyRequire_0(l_Parent_0.Promise), 
        Symbol = l_lazyRequire_0(l_Parent_0.Symbol), 
        LuauPolyfill = l_lazyRequire_0(l_Parent_0.LuauPolyfill), 
        Otter = l_lazyRequire_0(l_Parent_0.Otter), 
        llama = l_lazyRequire_0(l_Parent_0.llama), 
        RoduxPresence = v5.config({
            keyPath = "SocialLibraries.Presence"
        }), 
        RoduxFriends = v6.config({
            keyPath = "SocialLibraries.Friends"
        }), 
        enumerate = require(l_Parent_0.enumerate), 
        Players = l_Players_0, 
        UserInputService = l_UserInputService_0, 
        Text = require(script.Parent.temp.Text), 
        UserModel = require(script.Parent.temp.User)
    };
end;
