local v0 = require(game:GetService("CorePackages").Packages.Otter);
return function(v1)
    local l_TransparencyAnimation_0 = v1.TransparencyAnimation;
    if l_TransparencyAnimation_0.Enabled then
        local v3 = {
            dampingRatio = l_TransparencyAnimation_0.SpringDampingRatio, 
            frequency = l_TransparencyAnimation_0.SpringFrequency
        };
        return function(v4)
            return v0.spring(v4, v3);
        end;
    else
        return v0.instant;
    end;
end;
