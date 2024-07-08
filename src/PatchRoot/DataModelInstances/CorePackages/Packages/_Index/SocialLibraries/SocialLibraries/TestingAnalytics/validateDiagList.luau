local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_llama_0 = v0.llama;
local v2 = require(script.Parent.Parent.Utils.isEnum);
local l_t_0 = v0.t;
local v4 = require(script.Parent.formatKeyValidationError);
local v5 = require(script.Parent.formatErrorForIncorrectKey)(l_t_0.strictInterface({
    name = l_t_0.any, 
    counter = l_t_0.optional(l_t_0.any)
}));
return function(v6)
    l_llama_0.Dictionary.map(v6, function(v7, v8)
        local v9 = if not v2(v8) then v8 else v8.rawValue();
        assert(type(v7.name) == "string", v4("name", "a string", v9));
        local v10 = true;
        if type(v7.counter) ~= "number" then
            v10 = v7.counter == nil;
        end;
        assert(v10, v4("counter", "nil or a number", v9));
        assert(v5(v7, v9));
    end);
    return true;
end;
