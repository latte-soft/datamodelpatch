local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppGuiService_0 = require(l_Parent_0.RoactServiceTags).AppGuiService;
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local _ = require(l_Parent_0.Navigation);
local function v7(v8)
    v1.useEffect(function()
        if v8.state.routeName ~= nil then
            v8.guiService:BroadcastNotification(v8.state.routeName, l_NotificationType_0.APP_READY);
        end;
    end, {
        v8.state.routeName
    });
    if v8.state.routes ~= nil then
        return v1.createElement(v7, {
            state = v8.state.routes[v8.state.index], 
            guiService = v8.guiService
        });
    else
        return nil;
    end;
end;
return function(_)
    return v1.createElement(v7, {
        state = l_useNavigation_0().state, 
        guiService = l_useRoactService_0(l_AppGuiService_0)
    });
end;
