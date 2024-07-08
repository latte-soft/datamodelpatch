local v0 = require(script.Parent.Parent.Parent.Parent.dependencies);
local l_Rodux_0 = v0.Rodux;
local l_Dash_0 = v0.Dash;
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.AnalyticsTypes);
local v5 = require(l_Parent_0.Actions.SessionIdUpdated);
local v6 = {};
return function(_)
    return l_Rodux_0.createReducer(v6, {
        [v5.name] = function(v8, v9)
            return l_Dash_0.join(v8 or v6, {
                [v9.payload.sessionKey] = v9.payload.sessionId
            });
        end
    });
end;
