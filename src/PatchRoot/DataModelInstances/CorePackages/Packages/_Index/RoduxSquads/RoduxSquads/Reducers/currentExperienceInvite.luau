local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxSquads");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local l_CurrentExperienceInviteUpdated_0 = require(l_script_FirstAncestor_0.Actions).CurrentExperienceInviteUpdated;
local l_ExperienceInviteModel_0 = require(l_script_FirstAncestor_0.Models).ExperienceInviteModel;
local _ = require(script.Parent.Parent.RoduxSquadsTypes);
return function(v5)
    local l_NetworkingSquads_0 = v5.NetworkingSquads;
    local function _(v7, v8)
        if v7 == nil then
            return v8;
        elseif v7.experienceInviteId == v8.experienceInviteId and v7.version < v8.version then
            return v8;
        elseif v7.createdUtcMs < v8.createdUtcMs then
            return v8;
        else
            return v7;
        end;
    end;
    return v1.createReducer(nil, {
        [l_NetworkingSquads_0.CreateExperienceInvite.Succeeded.name] = function(v10, v11)
            local v12 = l_ExperienceInviteModel_0.format(v11.responseBody.experienceInvite);
            if v10 == nil then
                return v12;
            elseif v10.experienceInviteId == v12.experienceInviteId and v10.version < v12.version then
                return v12;
            elseif v10.createdUtcMs < v12.createdUtcMs then
                return v12;
            else
                return v10;
            end;
        end, 
        [l_NetworkingSquads_0.GetExperienceInvite.Succeeded.name] = function(v13, v14)
            local v15 = l_ExperienceInviteModel_0.format(v14.responseBody.experienceInvite);
            if v13 == nil then
                return v15;
            elseif v13.experienceInviteId == v15.experienceInviteId and v13.version < v15.version then
                return v15;
            elseif v13.createdUtcMs < v15.createdUtcMs then
                return v15;
            else
                return v13;
            end;
        end, 
        [l_NetworkingSquads_0.VoteForExperienceInvite.Succeeded.name] = function(v16, v17)
            local v18 = l_ExperienceInviteModel_0.format(v17.responseBody.experienceInvite);
            if v16 == nil then
                return v18;
            elseif v16.experienceInviteId == v18.experienceInviteId and v16.version < v18.version then
                return v18;
            elseif v16.createdUtcMs < v18.createdUtcMs then
                return v18;
            else
                return v16;
            end;
        end, 
        [l_CurrentExperienceInviteUpdated_0.name] = function(v19, v20)
            local v21 = l_ExperienceInviteModel_0.format(v20.payload.experienceInvite);
            if v19 == nil then
                return v21;
            elseif v19.experienceInviteId == v21.experienceInviteId and v19.version < v21.version then
                return v21;
            elseif v19.createdUtcMs < v21.createdUtcMs then
                return v21;
            else
                return v19;
            end;
        end
    });
end;
