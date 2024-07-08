local v0 = require(game:GetService("CorePackages").Roact);
return function(v1, v2)
    return function(v3)
        return v0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v2
        }, {
            component = v0.createElement(v1, v3)
        });
    end;
end;
