local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.AppCommonLib);
local v2 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCallback_0 = v2.useCallback;
local l_useReducer_0 = v2.useReducer;
local l_Immutable_0 = v1.Immutable;
local function v9(v7, v8)
    if v8.callback == nil then
        return l_Immutable_0.RemoveFromDictionary(v7, v8.screen);
    else
        assert(v8.callback ~= nil, "");
        return l_Immutable_0.Set(v7, v8.screen, v8.callback);
    end;
end;
return function()
    local v10, v11 = l_useReducer_0(v9, {});
    return v10, (l_useCallback_0(function(v12, v13)
        v11({
            callback = v12, 
            screen = v13
        });
    end, l_dependencyArray_0(v11)));
end;
