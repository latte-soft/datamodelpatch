local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local _ = require(l_Parent_0.Shared);
local l_Symbol_0 = v1.Symbol;
local v5 = require(script.Parent["createSignal.roblox"]);
local v6 = l_Symbol_0("BindingImpl");
local v7 = {};
local v12 = {
    __index = {
        getValue = function(v8)
            return v7.getValue(v8);
        end, 
        map = function(v9, v10)
            return v7.map(v9, v10);
        end
    }, 
    __tostring = function(v11)
        return string.format("RoactBinding(%s)", (tostring(v11:getValue())));
    end
};
v7.update = function(v13, v14)
    return v13[v6].update(v14);
end;
v7.subscribe = function(v15, v16)
    return v15[v6].subscribe(v16);
end;
v7.getValue = function(v17)
    return v17[v6]:getValue();
end;
v7.create = function(v18)
    local v19, v20 = v5();
    local v21 = {
        value = v18, 
        subscribe = v19
    };
    v21.update = function(v22)
        v21.value = v22;
        v20(v22);
    end;
    v21.getValue = function()
        return v21.value;
    end;
    local v23 = nil;
    if _G.__DEV__ then
        v23 = debug.traceback("Binding created at:", 3);
    end;
    return setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v21, 
        _source = v23
    }, v12), v21.update;
end;
v7.map = function(v24, v25)
    if _G.__DEV__ then
        local v26 = false;
        if typeof(v24) == "table" then
            v26 = v24["$$typeof"] == l_ReactSymbols_0.REACT_BINDING_TYPE;
        end;
        assert(v26, "Expected `self` to be a binding");
        assert(typeof(v25) == "function", "Expected arg #1 to be a function");
    end;
    local v30 = {
        subscribe = function(v27)
            return v7.subscribe(v24, function(v28)
                v27(v25(v28));
            end);
        end, 
        update = function(_)
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2);
        end, 
        getValue = function()
            return v25(v24:getValue());
        end
    };
    local v31 = nil;
    if _G.__DEV__ then
        v31 = debug.traceback("Mapped binding created at:", 3);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v30, 
        _source = v31
    }, v12));
end;
v7.join = function(v32)
    if _G.__DEV__ then
        assert(typeof(v32) == "table", "Expected arg #1 to be of type table");
        for v33, v34 in v32, nil, nil do
            if not (typeof(v34) == "table") or v34["$$typeof"] ~= l_ReactSymbols_0.REACT_BINDING_TYPE then
                error(("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v33))), 2);
            end;
        end;
    end;
    local v35 = {};
    local function v39()
        local v36 = {};
        for v37, v38 in pairs(v32) do
            v36[v37] = v38:getValue();
        end;
        return v36;
    end;
    v35.subscribe = function(v40)
        local v41 = {};
        for v42, v43 in v32, nil, nil do
            v41[v42] = v7.subscribe(v43, function(_)
                v40((v39()));
            end);
        end;
        return function()
            if v41 == nil then
                return ;
            else
                for _, v46 in v41, nil, nil do
                    v46();
                end;
                v41 = nil;
                return ;
            end;
        end;
    end;
    v35.update = function(_)
        error("Bindings created by joinBindings(...) cannot be updated directly", 2);
    end;
    v35.getValue = function()
        return (v39());
    end;
    local v48 = nil;
    if _G.__DEV__ then
        v48 = debug.traceback("Joined binding created at:", 2);
    end;
    return (setmetatable({
        ["$$typeof"] = l_ReactSymbols_0.REACT_BINDING_TYPE, 
        [v6] = v35, 
        _source = v48
    }, v12));
end;
return v7;
