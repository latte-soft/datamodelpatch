local v0 = require(game:GetService("CorePackages").Packages.Otter);
return function(v1)
    local l_SizeAnimation_0 = v1.SizeAnimation;
    if l_SizeAnimation_0.Enabled then
        local v3 = {
            dampingRatio = l_SizeAnimation_0.SpringDampingRatio, 
            frequency = l_SizeAnimation_0.SpringFrequency
        };
        return function(v4)
            return v0.spring(v4, v3);
        end;
    else
        return v0.instant;
    end;
end;
