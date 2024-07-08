local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Types.DevSubTypes);
local v2 = require(l_Modules_0.LuaApp.Enum.DevSubStatus);
local v3 = require(l_Modules_0.LuaApp.Enum.DevSubPlanStatus);
local v4 = {
    new = function()
        return {};
    end
};
v4.mock = function()
    local v5 = {
        v2.Active, 
        v2.Inactive
    };
    local v6 = {
        v3.Open, 
        v3.Closed, 
        v3.Archived
    };
    local function _(v7)
        local v8 = math.random(1, #v7);
        return v7:sub(v8, v8);
    end;
    local function _()
        local v10 = math.random(1, 6);
        local v11 = ("aeiouy"):sub(v10, v10);
        v10 = math.random(1, 20);
        return v11 .. ("bcdfghjklmnpqrstvwxz"):sub(v10, v10);
    end;
    local _ = function()
        local v13 = "";
        for _ = 1, math.random(1, 4) do
            local l_v13_0 = v13;
            local v16 = math.random(1, 6);
            local v17 = ("aeiouy"):sub(v16, v16);
            v16 = math.random(1, 20);
            v13 = l_v13_0 .. v17 .. ("bcdfghjklmnpqrstvwxz"):sub(v16, v16);
        end;
        return v13;
    end;
    local function v26()
        local v19 = {};
        for _ = 1, math.random(1, 32) do
            local v21 = "";
            for _ = 1, math.random(1, 4) do
                local l_v21_0 = v21;
                local v24 = math.random(1, 6);
                local v25 = ("aeiouy"):sub(v24, v24);
                v24 = math.random(1, 20);
                v21 = l_v21_0 .. v25 .. ("bcdfghjklmnpqrstvwxz"):sub(v24, v24);
            end;
            table.insert(v19, v21);
        end;
        return table.concat(v19, " ");
    end;
    local v27 = v4.new();
    v27.id = math.random(1, 420);
    v27.status = v5[math.random(1, #v5)];
    local v28 = "";
    for _ = 1, math.random(1, 4) do
        local l_v28_0 = v28;
        local v31 = math.random(1, 6);
        local v32 = ("aeiouy"):sub(v31, v31);
        v31 = math.random(1, 20);
        v28 = l_v28_0 .. v32 .. ("bcdfghjklmnpqrstvwxz"):sub(v31, v31);
    end;
    v27.name = v28;
    v27.price = math.random(1, 420);
    v27.image = 0;
    v27.planStatus = v6[math.random(1, #v6)];
    v27.description = v26();
    v27.gameId = 1515;
    v27.isAutoRenewing = true;
    v27.expirationDate = "";
    v27.gameData = {};
    return v27;
end;
v4.fromJsonData = function(v33)
    if v1.DevSubJsonCheck(v33) then
        local v34 = v4.new();
        v34.id = v33.id;
        v34.status = v33.status;
        v34.isAutoRenewing = v33.isAutoRenewing;
        v34.expirationDate = v33.expirationDate;
        v34.name = v33.planData.name;
        v34.price = v33.planData.priceInRobux;
        v34.image = v33.planData.imageAssetId;
        v34.planStatus = v33.planData.status;
        v34.description = v33.planData.description;
        v34.gameId = v33.planData.universeId;
        v34.gameData = v33.gameData;
        return v34;
    else
        return nil;
    end;
end;
return v4;
