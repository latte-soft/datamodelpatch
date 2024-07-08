local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.LuaAppNavigationContext);
local v4 = require(script.Parent.EnumScreens);
local v5 = require(l_Parent_0.Loggers).Logger:new(script.Name);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v7 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v9 = require(l_script_FirstAncestor_0.Conversations.Thunks.OpenUnfilteredThreadsLearnMoreLink);
generateNavigateToGroups = function(v10, v11)
    return function()
        if v11 then
            v11();
        end;
        if v10 == nil then
            return ;
        else
            local v12 = v10[v4.Groups];
            if not v12 then
                v5:warning("Groups page was not set in navigateToLuaAppPages");
                return ;
            else
                v5:info("Navigate To Groups from App Chat");
                v12();
                return ;
            end;
        end;
    end;
end;
local function _(v13)
    return function()
        if v8() then
            if v13 then
                v13(v9());
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
LuaAppNavigationContextProvider = function(v15)
    local v16 = v2.useRef(function()
    end);
    local v17 = v7();
    if v17 then
        v16.current = function()
            v17.fireAnalyticsEvent(v6.ChatLandingGroupsBtnClicked);
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local l_Provider_0 = v3.Provider;
    local v20 = {};
    local v21 = {
        navigateToGroups = generateNavigateToGroups(v15.navigateToLuaAppPages, v16.current)
    };
    local l_dispatch_0 = v15.dispatch;
    v21.navigateToUnfilteredThreadsLearnMore = function()
        if v8() then
            if l_dispatch_0 then
                l_dispatch_0(v9());
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v20.value = v21;
    return l_createElement_0(l_Provider_0, v20, v15.children);
end;
return LuaAppNavigationContextProvider;
