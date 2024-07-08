local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.SetRCCProfilerState);
return function(v2, v3)
    local v4 = v2 or {
        waitingForRecording = false, 
        lastFileOutputLocation = ""
    };
    if v3.type == v1.name then
        return (v0.JoinDictionaries(v4, {
            waitingForRecording = v3.waitingForRecording, 
            lastFileOutputLocation = v3.lastFileOutputLocation
        }));
    else
        return v4;
    end;
end;
