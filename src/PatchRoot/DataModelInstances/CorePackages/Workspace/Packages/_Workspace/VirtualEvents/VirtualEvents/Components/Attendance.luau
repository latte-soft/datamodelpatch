local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_Players_0 = game:GetService("Players");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.AttendanceCount);
local v5 = require(l_script_FirstAncestor_0.Components.FacePile);
local _ = require(l_script_FirstAncestor_0.types);
return function(v7)
    local l_experienceDetails_0 = v7.virtualEvent.experienceDetails;
    local l_rsvpCounters_0 = v7.virtualEvent.rsvpCounters;
    local v13 = v3.useMemo(function()
        local v10 = {};
        if v7.virtualEvent.rsvps then
            for _, v12 in v7.virtualEvent.rsvps, nil, nil do
                if v12.rsvpStatus == "going" then
                    table.insert(v10, (tostring(v12.userId)));
                end;
            end;
        end;
        return v10;
    end, {
        v7.virtualEvent
    });
    if not ((not (v7.eventStatus == "Ongoing") or not l_experienceDetails_0) or l_experienceDetails_0.playing ~= 0) or not (not (v7.eventStatus ~= "Ongoing") or not l_rsvpCounters_0) and l_rsvpCounters_0.going == 0 then
        return nil;
    else
        return v3.createElement("Folder", nil, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            AttendanceCount = v3.createElement(v4, {
                layoutOrder = 1, 
                eventStatus = v7.eventStatus, 
                interested = if not not l_rsvpCounters_0 and l_rsvpCounters_0.going then l_rsvpCounters_0.going else 0, 
                attending = if not not l_experienceDetails_0 and l_experienceDetails_0.playing then l_experienceDetails_0.playing else 0
            }), 
            FacePile = v3.createElement(v5, {
                layoutOrder = 2, 
                userIds = v13, 
                desiredFirstUserId = if not l_Players_0.LocalPlayer then nil else tostring(l_Players_0.LocalPlayer.UserId)
            })
        });
    end;
end;
