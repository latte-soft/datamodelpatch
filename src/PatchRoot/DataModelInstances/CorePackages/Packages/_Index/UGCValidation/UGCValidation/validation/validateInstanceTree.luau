local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.util.validateWithSchema);
local v4 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
return function(v5, v6)
    local v7 = v3(v5, v6);
    if v7.success == false then
        v1.reportFailure(v1.ErrorType.validateInstanceTree);
        if not v4() then
            return false, {
                v7.message
            };
        else
            return false, {
                "Detected the following error(s): " .. v7.message
            };
        end;
    else
        local v8 = {};
        if v2.BANNED_NAMES[v6.Name] then
            table.insert(v8, string.format("%s has an invalid name", v6:GetFullName()));
        end;
        for _, v10 in pairs(v6:GetDescendants()) do
            for _, v12 in pairs(v2.BANNED_CLASS_NAMES) do
                if v10:IsA(v12) then
                    table.insert(v8, string.format("%s is of type %s which is not allowed", v10:GetFullName(), v12));
                end;
            end;
            if v2.BANNED_NAMES[v10.Name] then
                table.insert(v8, string.format("%s has an invalid name", v10:GetFullName()));
            end;
        end;
        if #v8 > 0 then
            v1.reportFailure(v1.ErrorType.validateInstanceTree_InvalidDescendants);
            return false, v8;
        else
            return true;
        end;
    end;
end;
