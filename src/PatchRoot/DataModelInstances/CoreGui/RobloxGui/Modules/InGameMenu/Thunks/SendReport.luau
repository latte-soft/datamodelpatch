local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Parent.Actions.OpenReportSentDialog);
return function(v3, v4, v5)
    return function(v6)
        if v5 ~= nil then
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v5);
            if l_l_Players_0_PlayerByUserId_0 then
                coroutine.wrap(function()
                    l_Players_0:ReportAbuse(l_l_Players_0_PlayerByUserId_0, v3, v4);
                    v6:dispatch(v2());
                end)();
                return ;
            end;
        else
            local v8 = v6:getState();
            local l_name_0 = v8.gameInfo.name;
            local l_description_0 = v8.gameInfo.description;
            if l_name_0 ~= "" then
                local v11 = string.format("User Report: \n    %s \n" .. "Place Title: \n    %s \n" .. "PlaceId: \n    %s \n" .. "Place Description: \n    %s \n", v4, l_name_0, tostring(game.PlaceId), l_description_0);
                coroutine.wrap(function()
                    if not l_RunService_0:IsStudio() then
                        l_Players_0:ReportAbuse(nil, v3, v11);
                    end;
                    v6:dispatch(v2());
                end)();
            end;
        end;
    end;
end;
