local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayabilityRodux");
local v1 = require(l_script_FirstAncestor_0.Enums.PlayabilityStatusEnum);
local v2 = require(l_script_FirstAncestor_0.Parent.Result);
local v3 = {
    new = function()
        return {};
    end
};
v3.mock = function()
    local v4 = v3.new();
    v4.universeId = "149757";
    v4.isPlayable = true;
    v4.playabilityStatus = v1.Playable;
    return v4;
end;
v3.fromJsonData = function(v5)
    if type(v5.universeId) ~= "number" and type(v5.universeId) ~= "string" then
        return v2.error("PlayabilityStatus.fromJsonData expects universeId to be a number or a string");
    elseif type(v5.isPlayable) ~= "boolean" then
        return v2.error("PlayabilityStatus.fromJsonData expects isPlayable to be a boolean");
    elseif type(v5.playabilityStatus) ~= "string" then
        return v2.error("PlayabilityStatus.fromJsonData expects playabilityStatus to be a string");
    else
        local v6 = v3.new();
        v6.universeId = tostring(v5.universeId);
        v6.isPlayable = v5.isPlayable;
        v6.playabilityStatus = v5.playabilityStatus;
        return v2.success(v6);
    end;
end;
return v3;
