local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = require(l_Parent_0.Promise);
local l_it_0 = require(l_Parent_0.JestGlobals).it;
local v4 = {};
local function _(v5)
    return function(v6, v7, v8)
        return (if not v5 then l_it_0 else l_it_0[v5])(v6, function()
            return v2.new(function(v9, v10)
                v7(v9, v10);
            end):andThen(function(v11)
                return v2.delay(0.016666666666666666):andThenReturn(v11);
            end);
        end, v8);
    end;
end;
local v13 = nil;
local function v20(v14, v15, v16)
    return (if not v13 then l_it_0 else l_it_0[v13])(v14, function()
        return v2.new(function(v17, v18)
            v15(v17, v18);
        end):andThen(function(v19)
            return v2.delay(0.016666666666666666):andThenReturn(v19);
        end);
    end, v16);
end;
local v21 = {};
local v22 = "only";
local l_v22_0 = v22 --[[ copy: 12 -> 13 ]];
v21.only = function(v24, v25, v26)
    return (if not l_v22_0 then l_it_0 else l_it_0[l_v22_0])(v24, function()
        return v2.new(function(v27, v28)
            v25(v27, v28);
        end):andThen(function(v29)
            return v2.delay(0.016666666666666666):andThenReturn(v29);
        end);
    end, v26);
end;
v22 = "skip";
local l_v22_1 = v22 --[[ copy: 12 -> 14 ]];
v21.skip = function(v31, v32, v33)
    return (if not l_v22_1 then l_it_0 else l_it_0[l_v22_1])(v31, function()
        return v2.new(function(v34, v35)
            v32(v34, v35);
        end):andThen(function(v36)
            return v2.delay(0.016666666666666666):andThenReturn(v36);
        end);
    end, v33);
end;
v22 = "todo";
v21.todo = function(v37, v38, v39)
    return (if not v22 then l_it_0 else l_it_0[v22])(v37, function()
        return v2.new(function(v40, v41)
            v38(v40, v41);
        end):andThen(function(v42)
            return v2.delay(0.016666666666666666):andThenReturn(v42);
        end);
    end, v39);
end;
v4.itAsync = setmetatable(v21, {
    __call = function(_, v44, v45, v46)
        return v20(v44, v45, v46);
    end
});
return v4;
