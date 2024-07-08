local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxPresence");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.getDeepValue);
local v3 = require(l_script_FirstAncestor_0.Actions.ReceivedUserPresence);
return function(v4, v5, v6)
    local l_presenceNetworking_0 = v6.presenceNetworking;
    local function v14(v8, v9)
        local v10 = v8[v4];
        local v11 = tostring(v9.userId);
        local v12 = v2(v8, string.format("byUserId.%s.%s", v11, v5));
        if not (not v12 or not v10[v12]) then
            v12 = tostring(v12);
            v10 = v1.Dictionary.join(v10, {
                [v12] = v1.List.removeValue(v10[v12], v11)
            });
        end;
        local v13 = v10[v9[v5]];
        if v13 and table.find(v13, v11) then
            return v10;
        else
            return v1.Dictionary.join(v10, {
                [tostring(v9[v5])] = v1.List.join(v13 or {}, {
                    v11
                })
            });
        end;
    end;
    return function(v15, v16)
        assert(v15, "state should not be nil");
        if v16.type == v3.name then
            return v14(v15, v16.payload);
        elseif v16.type == l_presenceNetworking_0.GetPresencesFromUserIds.Succeeded.name then
            local l_userPresences_0 = v16.responseBody.userPresences;
            local v18 = v15[v4];
            for _, v20 in ipairs(l_userPresences_0) do
                v18 = v14(v15, v20);
            end;
            return v18;
        else
            return v15[v4];
        end;
    end;
end;
