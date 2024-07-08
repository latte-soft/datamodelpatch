local v0 = {};
local v1 = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local v3 = v1.Map.new(nil);
local v4 = {
    "0", 
    "1", 
    "2", 
    "3", 
    "4", 
    "5", 
    "6", 
    "7", 
    "8", 
    "9", 
    "a", 
    "b", 
    "c", 
    "d", 
    "e", 
    "f", 
    "g", 
    "h", 
    "i", 
    "j", 
    "k", 
    "l", 
    "m", 
    "n", 
    "o", 
    "p", 
    "q", 
    "r", 
    "s", 
    "t", 
    "u", 
    "v", 
    "w", 
    "x", 
    "y", 
    "z"
};
math.randomseed(os.clock());
local function v7()
    local v5 = "";
    for _ = 1, 11 do
        v5 = v5 .. v4[math.random(1, 36)];
    end;
    return v5;
end;
local function v11(v8)
    local v9 = v7();
    local v10 = not not l_Boolean_0.toJSBoolean(v3:get(v8)) and v3:get(v8) or 1;
    v3:set(v8, v10 + 1);
    return ("%s:%s:%s"):format(v8, tostring(v10), v9);
end;
v0.uuid = v7;
v0.makeUniqueId = v11;
return v0;
