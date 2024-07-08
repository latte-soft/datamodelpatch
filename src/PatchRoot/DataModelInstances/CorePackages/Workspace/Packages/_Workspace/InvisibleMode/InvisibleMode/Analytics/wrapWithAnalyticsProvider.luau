local v0 = require(script.Parent.Parent.dependencies);
local l_React_0 = v0.React;
local v2 = require(script.Parent.AnalyticsService);
local v3 = require(script.Parent.InvisibleModeAnalytics);
local v4 = require(script.Parent.setupFireEvent);
local v5 = require(script.Parent.useAnalytics);
local l_useLocalUserId_0 = v0.Hooks.useLocalUserId;
return function(v7)
    return function(v8)
        if not v5() then
            return l_React_0.createElement(v3.Provider, {
                value = {
                    fireEvent = v8._fireEventOverride or v4({
                        analytics = v2, 
                        infoForAllEvents = {
                            uid = l_useLocalUserId_0(), 
                            source = "SelfPresenceIndicator"
                        }
                    })
                }
            }, {
                InvisibleModeComponentWrapped = l_React_0.createElement(v7, v8)
            });
        else
            return l_React_0.createElement(v7, v8);
        end;
    end;
end;
