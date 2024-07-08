local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.mutedError);
local v2 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v3 = require(l_Modules_0.AvatarExperience.Common.Actions.SetFullView);
local v4 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local function _(v5)
    local v6 = v2.AnalyticsContext[v5];
    if v6 == nil then
        if _G.__TESTEZ_RUNNING_TEST__ and v5 == "DummyRoute" then
            return "DummyRoute";
        else
            v1(string.format("opaquePage: %s missing an entry in AXConstants.AnalyticsContext", (tostring(v5))));
            v6 = "";
        end;
    end;
    return v6;
end;
local function _(v8, v9, v10)
    if v10 == v4.SceneFullView then
        return v8.open3DFullView;
    elseif v10 == v4.UIFullView then
        return v8.openUIFullView;
    elseif v9 == v4.SceneFullView then
        return v8.close3DFullView;
    elseif v9 == v4.UIFullView then
        return v8.closeUIFullView;
    else
        return ;
    end;
end;
return function(v12, v13, v14)
    return function(v15)
        local v16 = v15:getState().AvatarExperience.Common.FullView[v13];
        v15:dispatch(v3(v13, v14));
        local l_v13_0 = v13;
        local v18 = v2.AnalyticsContext[l_v13_0];
        local v19;
        if v18 == nil then
            if _G.__TESTEZ_RUNNING_TEST__ and l_v13_0 == "DummyRoute" then
                v19 = "DummyRoute";
                goto label0 --[[  true, true  ]];
            else
                v1(string.format("opaquePage: %s missing an entry in AXConstants.AnalyticsContext", (tostring(l_v13_0))));
                v18 = "";
            end;
        end;
        v19 = v18;
        ::label0::;
        v18 = v12;
        local l_v14_0 = v14;
        l_v13_0 = if l_v14_0 == v4.SceneFullView then v18.open3DFullView else if l_v14_0 == v4.UIFullView then v18.openUIFullView else if v16 == v4.SceneFullView then v18.close3DFullView else if v16 == v4.UIFullView then v18.closeUIFullView else nil;
        if l_v13_0 then
            l_v13_0(v19);
        end;
    end;
end;
