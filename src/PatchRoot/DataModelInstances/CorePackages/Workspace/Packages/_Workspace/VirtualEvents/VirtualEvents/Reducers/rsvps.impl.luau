local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local _ = require(l_script_FirstAncestor_0.Parent.NetworkingVirtualEvents);
return function(v4, v5)
    return (v1.combineReducers({
        page = v1.createReducer({
            nextPageCursor = nil, 
            prevPageCursor = nil
        }, {
            [v4.GetVirtualEventRsvps.Succeeded.name] = function(_, v7)
                return {
                    nextPageCursor = v7.responseBody.nextPageCursor, 
                    prevPageCursor = v7.responseBody.prevPageCursor
                };
            end
        }), 
        counters = v1.createReducer({}, {
            [v4.GetVirtualEventRsvpCounts.Succeeded.name] = function(v8, v9)
                return v2.Dictionary.join(v8, {
                    [v9.ids[1]] = v9.responseBody.counters
                });
            end, 
            [v4.GetVirtualEventRsvpCounts.Failed.name] = function(v10, _)
                return v10;
            end, 
            [v4.UpdateMyRsvpStatus.Succeeded.name] = function(v12, v13)
                local v14 = v13.ids[1];
                local v15 = v12[v14];
                if not v15 then
                    return v12;
                else
                    local l_rsvpStatus_0 = v13.postBody.rsvpStatus;
                    local v17 = 0;
                    if l_rsvpStatus_0 == "going" then
                        v17 = 1;
                    elseif l_rsvpStatus_0 == "notGoing" then
                        v17 = -1;
                    end;
                    return v2.Dictionary.join(v12, {
                        [v14] = v2.Dictionary.join(v15, {
                            going = math.clamp(v15.going + v17, 0, math.huge)
                        })
                    });
                end;
            end, 
            [v4.UpdateMyRsvpStatus.Failed.name] = function(v18, _)
                return v18;
            end
        }), 
        byVirtualEventId = v1.createReducer({}, {
            [v4.GetVirtualEventRsvps.Succeeded.name] = function(v20, v21)
                local v22 = v21.ids[1];
                local v23 = {};
                for _, v25 in v21.responseBody.data, nil, nil do
                    v23[tostring(v25.userId)] = v25;
                end;
                return v2.Dictionary.join(v20, {
                    [v22] = v2.Dictionary.join(v20[v22] or {}, v23)
                });
            end, 
            [v4.GetVirtualEventRsvps.Failed.name] = function(v26, _)
                return v26;
            end, 
            [v4.UpdateMyRsvpStatus.Succeeded.name] = function(v28, v29)
                local v30 = v29.ids[1];
                local v31 = not v5.LocalPlayer and -1 or v5.LocalPlayer.UserId;
                return v2.Dictionary.join(v28, {
                    [v30] = v2.Dictionary.join(v28[v30] or {}, {
                        [tostring(v31)] = {
                            userId = v31, 
                            rsvpStatus = v29.postBody.rsvpStatus
                        }
                    })
                });
            end, 
            [v4.UpdateMyRsvpStatus.Failed.name] = function(v32, _)
                return v32;
            end
        })
    }));
end;
