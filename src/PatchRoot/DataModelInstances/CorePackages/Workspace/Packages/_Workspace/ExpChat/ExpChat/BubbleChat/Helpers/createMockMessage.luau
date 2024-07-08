local l_Dictionary_0 = require(script:FindFirstAncestor("ExpChat").Parent.llama).Dictionary;
local v1 = 0;
return function(v2)
    v1 = v1 + 1;
    return l_Dictionary_0.join({
        name = "Foo", 
        id = tostring(v1), 
        userId = "1", 
        text = "Hello, World", 
        timestamp = v1
    }, v2);
end;
