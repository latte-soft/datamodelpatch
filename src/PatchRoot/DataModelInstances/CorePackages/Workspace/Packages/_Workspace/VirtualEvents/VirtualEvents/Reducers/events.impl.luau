local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local _ = require(l_script_FirstAncestor_0.types);
local l_VirtualEventModel_0 = require(l_script_FirstAncestor_0.network).NetworkingVirtualEvents.VirtualEventModel;
local v5 = require(l_script_FirstAncestor_0.logger);
return function(v6)
    return (v1.createReducer({}, {
        [v6.GetActiveVirtualEvents.Succeeded.name] = function(_, v8)
            local v9 = {};
            for _, v11 in v8.responseBody.data, nil, nil do
                local v12 = l_VirtualEventModel_0.fromResponse(v11);
                if v12 then
                    if not v12.eventTime.startTime or not v12.eventTime.endTime then
                        v5:debug("Discarding VirtualEvent with ID {} (malformed start or end time)", v11.id);
                    else
                        v9[v11.id] = v12;
                    end;
                end;
            end;
            return v9;
        end, 
        [v6.GetActiveVirtualEvents.Failed.name] = function(_, _)
            return {};
        end, 
        [v6.GetVirtualEvent.Succeeded.name] = function(v15, v16)
            local v17 = {};
            local v18 = l_VirtualEventModel_0.fromResponse(v16.responseBody);
            if v18 then
                v17[v18.id] = v18;
            end;
            return v2.Dictionary.join(v15, v17);
        end, 
        [v6.GetVirtualEvent.Failed.name] = function(v19, _)
            return v19;
        end, 
        [v6.UpdateMyRsvpStatus.Succeeded.name] = function(v21, v22)
            local v23 = v22.ids[1];
            local v24 = v21[v23];
            if not v24 then
                return v21;
            else
                return v2.Dictionary.join(v21, {
                    [v23] = v2.Dictionary.join(v24, {
                        userRsvpStatus = v22.postBody.rsvpStatus
                    })
                });
            end;
        end
    }));
end;
