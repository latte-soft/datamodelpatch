local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.AdorneeAdded);
local v6 = require(l_Actions_0.PlayerRemoved);
local v7 = require(l_Actions_0.HumanoidDied);
local function v13(v8, v9, v10)
    for _, v12 in ipairs(v8:GetChildren()) do
        if not (not (v12.Name == v9) or not v12:IsA(v10)) then
            return v12;
        end;
    end;
    return nil;
end;
return v2.createReducer({}, {
    [v5.name] = function(v14, v15)
        return l_Dictionary_0.join(v14, {
            [v15.userId] = if v15.humanoid.Health == 0 then v13(v15.character, "Head", "BasePart") else v15.character
        });
    end, 
    [v7.name] = function(v16, v17)
        local v18 = v16[v17.userId];
        local v19 = nil;
        if v18 then
            v19 = v13(v18, "Head", "BasePart") or v18;
        end;
        return l_Dictionary_0.join(v16, {
            [v17.userId] = v19
        });
    end, 
    [v6.name] = function(v20, v21)
        return l_Dictionary_0.removeKey(v20, v21.userId);
    end
});
