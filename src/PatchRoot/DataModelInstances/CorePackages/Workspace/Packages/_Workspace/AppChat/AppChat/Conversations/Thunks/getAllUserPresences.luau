local v0 = require(script:FindFirstAncestor("AppChat").Http.NetworkingPresence);
return function()
    return function(v1)
        local l_Users_0 = v1:getState().Users;
        local v3 = {};
        for v4, _ in pairs(l_Users_0) do
            if v4 ~= "-1" then
                table.insert(v3, v4);
            end;
        end;
        v1:dispatch(v0.GetPresencesFromUserIds.API(v3)):catch(function(v6)
            warn("NetworkingPresence failure in getAllUserPresences, Status: " .. tostring(v6));
        end);
    end;
end;
