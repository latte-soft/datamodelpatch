local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Services.Analytics);
local v3 = require(l_Parent_0.Actions.SetTryingOnInfo);
local v4 = require(l_Parent_0.Thunks.SendCounter);
local v5 = require(l_Parent_0.Flags.GetFFlagIBEnableSendCounters);
local v6 = require(l_Parent_0.Constants);
local v7 = {
    v2
};
return function(v8, v9, v10, v11, v12)
    return v1.new(script.Name, v7, function(v13, v14)
        local v15 = v14[v2];
        local v16 = nil;
        local v17 = nil;
        if not v11 then
            v16 = "Asset";
            v17 = v9;
        else
            v16 = "Bundle";
            v17 = v12;
        end;
        v15.reportTryOnButtonClicked(v16, v17);
        v13:dispatch(v3(v8, v9, v10));
        if v5() then
            v13:dispatch(v4(v6.Counters.TryOnButtonClicked));
        end;
    end);
end;
