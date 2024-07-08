local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local l_isObjectLike_0 = require(l_Parent_0.jsutils.isObjectLike).isObjectLike;
local function v3(v4)
    if l_isObjectLike_0(v4) then
        if type(v4.toJSON) == "function" then
            return v4:toJSON();
        elseif not l_Array_0.isArray(v4) then
            local v5 = {};
            for v6, v7 in pairs(v4) do
                v5[v6] = v3(v7);
            end;
            return v5;
        else
            return l_Array_0.map(v4, v3);
        end;
    else
        return v4;
    end;
end;
return {
    toJSONDeep = v3
};
