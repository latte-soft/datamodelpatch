local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(l_script_FirstAncestor_0.Navigator);
local v3 = require(l_script_FirstAncestor_0.Components.FriendsLandingEntryPoint);
return function(v4)
    assert(type(v4.with) == "function", "Expect parentContext to have with");
    local v5 = l_Roact_0.Component:extend("FriendsLandingEntryPointWithParentContext");
    v5.render = function(v6)
        local v7 = v6.props.navigation.getParam("EntryPage");
        return v4.with(function(v8)
            return l_Roact_0.createElement(v3, {
                navigation = v6.props.navigation, 
                navigateToLuaAppPages = v8.navigateToLuaAppPages, 
                luaAppPages = v8.luaAppPages, 
                friendsRequestEventListener = v8.friendsRequestEventListener, 
                robloxEventReceiver = v8.robloxEventReceiver, 
                getLoadingTimeInfo = v8.getNavigatingFromSocialTabEvent, 
                entryPage = v7, 
                luaAddFriendsPageEnabled = v8.luaAddFriendsPageEnabled, 
                contactImporterAndPYMKEnabled = v8.contactImporterAndPYMKEnabled or nil, 
                diagService = v8.diagService, 
                eventIngestService = v8.eventIngestService, 
                openProfilePeekView = v8.openProfilePeekView, 
                wideMode = v8.wideMode, 
                passedNavParams = v6.props.navigation.state.params, 
                openPlayerContextualMenu = v8.openPlayerContextualMenu
            });
        end);
    end;
    v5.router = v2.router;
    return v5;
end;
