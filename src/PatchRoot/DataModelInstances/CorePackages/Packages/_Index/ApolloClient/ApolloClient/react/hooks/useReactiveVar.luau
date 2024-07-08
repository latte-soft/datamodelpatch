local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.React);
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local _ = require(l_Parent_0.cache);
local v6 = {
    __value = "nil placeholder"
};
v0.useReactiveVar = function(v7)
    local v8 = v7();
    local _, v10 = l_useState_0(v8);
    l_useEffect_0(function()
        local v11 = v7();
        if v8 ~= v11 then
            v10(v11);
            return ;
        else
            return v7:onNextChange(v10);
        end;
    end, {
        v8 or v6
    });
    return v8;
end;
return v0;
