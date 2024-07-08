local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Dictionary_0 = require(l_script_FirstAncestor_0.Parent.llama).Dictionary;
local v3 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local v4 = {};
local l_l_RbxAnalyticsService_0_0 = l_RbxAnalyticsService_0;
local function v7(v6)
    return l_Dictionary_0.join(v6, {
        gameId = tostring(game.GameId), 
        placeId = tostring(game.PlaceId)
    });
end;
local function v12(v8, v9, v10, v11)
    if l_l_RbxAnalyticsService_0_0 then
        v3:debug("Event: {}", v10);
        l_l_RbxAnalyticsService_0_0:SetRBXEventStream(v8, v9, v10, v7(v11 or {}));
    end;
end;
v4.with = function(v13)
    l_l_RbxAnalyticsService_0_0 = v13 or l_RbxAnalyticsService_0;
end;
v4.FireRccAnalyticsWithEventName = function(v14, v15)
    v12("rcc", "experienceChat", v14, v15);
end;
v4.FireClientAnalyticsWithEventName = function(v16, v17)
    v12("client", "experienceChat", v16, v17);
end;
v4.reportCounter = function(v18, v19)
    if l_l_RbxAnalyticsService_0_0 then
        v3:debug("Counter: {}", v18);
        l_l_RbxAnalyticsService_0_0:ReportCounter(v18, v19 or 1);
    end;
end;
return v4;
