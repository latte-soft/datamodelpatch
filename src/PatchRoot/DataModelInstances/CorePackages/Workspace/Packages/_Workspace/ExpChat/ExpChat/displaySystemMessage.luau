local l_List_0 = require(script:FindFirstAncestor("ExpChat").Parent.llama).List;
local v1 = require(script.Parent.Logger):new("ExpChat/" .. script.Name);
local v2 = require(script.Parent.sanitizeForRichText);
return function(v3, v4, v5, v6, v7, v8)
    v1:debug("Display system message: {}", v5);
    local v9 = nil;
    if type(v3) == "string" then
        if v3 ~= "" then
            local v10 = nil;
            local l_status_0, l_result_0 = pcall(function()
                return v6:FormatByKey(v3, v4);
            end);
            v10 = l_status_0;
            v9 = l_result_0;
            if not v10 then
                v9 = v8;
            end;
        end;
    else
        v9 = table.concat(l_List_0.map(v3, function(v13)
            return v6:FormatByKey(v13, v4);
        end), "\n");
    end;
    if not (not v7 or not v9) then
        v7:DisplaySystemMessage(v2(v9), v5);
    end;
end;
