local v0 = require(game:GetService("CorePackages").Lumberyak).Logger.new(nil, "Authentication");
v0:addSink({
    maxLevel = v0.Levels.Warning, 
    log = function(_, v2, _)
        print(v2);
    end
});
return v0;
