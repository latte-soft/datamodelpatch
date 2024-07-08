local l_Path_0 = require(script.path).Path;
makePathImpl = function()
    local v1 = l_Path_0.new();
    v1:initialize("/", "/");
    return v1;
end;
return {
    path = makePathImpl(), 
    Path = l_Path_0
};
