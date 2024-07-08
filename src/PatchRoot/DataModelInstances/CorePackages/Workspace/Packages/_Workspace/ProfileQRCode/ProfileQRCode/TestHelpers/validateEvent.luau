local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Analytics.EventStreamActionList);
local v3 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v4 = require(l_Parent_0.Dash);
return function(v5, v6)
    assert(v3.isEnumValue(v5), "Invalid event name");
    local v7 = v2[v5];
    return v7.context, v7.eventType, v4.join(v7.additionalInfo, {
        btn = if not not v7.additionalInfo and v7.additionalInfo.btn then v7.additionalInfo.btn.rawValue() else nil
    }, v6);
end;
