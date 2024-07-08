local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialLuaAnalytics);
local l_AnalyticsFactory_0 = v2.Analytics.AnalyticsFactory;
local l_DefaultAnalyticsService_0 = v2.Analytics.DefaultAnalyticsService;
local v5 = require(script.Parent.EventStreamActionList);
local v6 = require(script.Parent.DiagActionList);
local v7 = require(l_Parent_1.Cryo);
local v8 = require(l_Parent_1.React);
local v9 = require(script.Parent.RoactChatAnalyticsContext);
local v10 = require(script.Parent.Logger);
local l_ChatEntryPointNames_0 = require(l_Parent_1.SocialCommon).Enums.ChatEntryPointNames;
local v12 = require(l_Parent_0.Flags.isAppChatChannelsAPIEnabled);
return function(v13)
    local v14 = {};
    local l_entryPoint_0 = v13.entryPoint;
    if not (l_entryPoint_0 and l_ChatEntryPointNames_0[l_entryPoint_0]) then
        v10:warning("entryPoint=" .. tostring(l_entryPoint_0) .. " is not a reigstered value.");
        l_entryPoint_0 = l_ChatEntryPointNames_0.Unknown;
    end;
    return v8.createElement(v9.Provider, {
        value = l_AnalyticsFactory_0.setUpAnalyticsFactory({
            eventLists = {
                EventStream = v5, 
                Diag = v6
            }, 
            analyticsImpl = {
                EventStream = l_DefaultAnalyticsService_0.EventStream, 
                Diag = l_DefaultAnalyticsService_0.Diag
            }, 
            staticInfoForAllEvents = v7.Dictionary.join(v7.Dictionary.join(v14, {
                entryPoint = l_entryPoint_0
            }), {
                channelsApiEnabled = v12()
            })
        })()
    }, v13.children);
end;
