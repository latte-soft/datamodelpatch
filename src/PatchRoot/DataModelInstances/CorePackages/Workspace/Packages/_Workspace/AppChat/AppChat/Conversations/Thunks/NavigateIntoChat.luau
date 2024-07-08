local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local l_NavigateToRoute_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateToRoute;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableStandaloneAppChat);
local v6 = require(l_script_FirstAncestor_0.EnumScreens);
local v7 = {
    {
        name = l_AppPage_0.Chat
    }
};
return function(v8, v9)
    return function(v10)
        v10:dispatch(l_NavigateToRoute_0(v7, v9));
        v10:dispatch(v2({
            screen = if not v5() then v6.RoactChat else v6.ChatConversation, 
            params = v8
        }));
    end;
end;
