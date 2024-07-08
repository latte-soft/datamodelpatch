local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Analytics.EventStreamActionList);
local v3 = require(l_Parent_0.Analytics.EventNames);
local l_llama_0 = v1.llama;
return function(v5, v6)
    assert(v3.isEnumValue(v5), "Invalid event name");
    local v7 = v2[v5];
    return v7.context, v7.eventType, l_llama_0.Dictionary.join(v7.additionalInfo, {
        btn = if not not v7.additionalInfo and v7.additionalInfo.btn then v7.additionalInfo.btn.rawValue() else nil
    }, v6);
end;
