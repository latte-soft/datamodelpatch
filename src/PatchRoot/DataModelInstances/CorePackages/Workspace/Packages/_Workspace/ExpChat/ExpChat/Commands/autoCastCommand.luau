local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Promise);
local v2 = require(l_script_FirstAncestor_0.context);
local _ = require(script:FindFirstAncestor("Commands").types);
local function v8(v4, v5)
    for _, v7 in pairs(v4) do
        if string.find(v5, "^" .. v7 .. " ") then
            return true;
        end;
    end;
    return false;
end;
return function(v9, v10, v11)
    return v1.try(function()
        assert(v2.store, "Store should exist");
        if v8(v2.store:getState().AutoCastCommands[v9.name], v11) then
            local v12 = v9.clientRun(v2.store, v10, v11);
            if not (not v12 or not string.find(v12.metadata, "Success")) then
                return v1.resolve(v12);
            end;
        end;
        return v1.reject();
    end);
end;
