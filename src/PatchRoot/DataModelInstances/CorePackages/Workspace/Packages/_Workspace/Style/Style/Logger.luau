local v0 = require(script:FindFirstAncestor("Style").Parent.Lumberyak).Logger.new(nil, "StylePackage");
v0:addSink({
    maxLevel = v0.Levels.Warning, 
    log = function(_, v2, _)
        print(v2);
    end
});
return v0;
