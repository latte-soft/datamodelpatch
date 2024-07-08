local v0 = require(script:FindFirstAncestor("ExpChat").Parent.Otter);
local v1 = game:DefineFastFlag("LegacyBubbleChatAnimationFix", false);
return function(v2, v3)
    local v4 = nil;
    v4 = if v3 == "size" then v2.SizeAnimation else v2.TransparencyAnimation;
    if not v1 then
        if not v4.Enabled then
            return v0.instant;
        end;
    elseif v4.Enabled == false then
        return v0.instant;
    end;
    local v5 = {
        dampingRatio = v4.SpringDampingRatio, 
        frequency = v4.SpringFrequency
    };
    return function(v6)
        return v0.spring(v6, v5);
    end;
end;
