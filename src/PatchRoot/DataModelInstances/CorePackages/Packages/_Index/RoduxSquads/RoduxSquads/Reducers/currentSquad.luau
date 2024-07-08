local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local l_CurrentSquadUpdated_0 = require(l_script_FirstAncestor_0.Actions).CurrentSquadUpdated;
local l_SquadModel_0 = require(l_script_FirstAncestor_0.Models).SquadModel;
local _ = require(script.Parent.Parent.RoduxSquadsTypes);
return function(v5)
    local l_NetworkingSquads_0 = v5.NetworkingSquads;
    local function _(v7, v8)
        if not (v7 ~= nil) or v7.createdUtc <= v8.createdUtc then
            return v8;
        else
            return v7;
        end;
    end;
    return v1.createReducer(nil, {
        [l_NetworkingSquads_0.CreateOrJoinSquad.Succeeded.name] = function(v10, v11)
            local v12 = l_SquadModel_0.format(v11.responseBody.squad);
            if not (v10 ~= nil) or v10.createdUtc <= v12.createdUtc then
                return v12;
            else
                return v10;
            end;
        end, 
        [l_NetworkingSquads_0.GetSquadActive.Succeeded.name] = function(v13, v14)
            local l_squad_0 = v14.responseBody.squad;
            if not l_squad_0 then
                return nil;
            else
                local v16 = l_SquadModel_0.format(l_squad_0);
                if not (v13 ~= nil) or v13.createdUtc <= v16.createdUtc then
                    return v16;
                else
                    return v13;
                end;
            end;
        end, 
        [l_NetworkingSquads_0.GetSquadFromSquadId.Succeeded.name] = function(v17, v18)
            local v19 = l_SquadModel_0.format(v18.responseBody.squad);
            if not (v17 ~= nil) or v17.createdUtc <= v19.createdUtc then
                return v19;
            else
                return v17;
            end;
        end, 
        [l_NetworkingSquads_0.JoinSquad.Succeeded.name] = function(v20, v21)
            local v22 = l_SquadModel_0.format(v21.responseBody.squad);
            if not (v20 ~= nil) or v20.createdUtc <= v22.createdUtc then
                return v22;
            else
                return v20;
            end;
        end, 
        [l_NetworkingSquads_0.LeaveSquad.Succeeded.name] = function(v23, v24)
            if v23 ~= nil and tostring(v24.ids[1]) ~= v23.squadId then
                return v23;
            else
                return nil;
            end;
        end, 
        [l_CurrentSquadUpdated_0.name] = function(v25, v26)
            local v27 = l_SquadModel_0.format(v26.payload.squad);
            if not (v25 ~= nil) or v25.createdUtc <= v27.createdUtc then
                return v27;
            else
                return v25;
            end;
        end
    });
end;
