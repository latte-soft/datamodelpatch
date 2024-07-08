local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Boolean_0 = v0.Boolean;
local l_Error_0 = v0.Error;
local l_Object_0 = v0.Object;
local v5 = require(script.Parent["config-default-ignore"]);
local v6 = {};
local _ = require(script.Parent.types.config);
local l_prettyDOM_0 = require(script.Parent["pretty-dom"]).prettyDOM;
local v15 = {
    testIdAttribute = "data-testid", 
    asyncUtilTimeout = 1000, 
    asyncWrapper = function(v9)
        return v9();
    end, 
    unstable_advanceTimersWrapper = function(v10)
        return v10();
    end, 
    eventWrapper = function(v11)
        return v11();
    end, 
    defaultHidden = false, 
    defaultIgnore = v5.getIgnore(), 
    showOriginalStackTrace = false, 
    throwSuggestions = false, 
    getElementError = function(v12, v13)
        local v14 = l_Error_0.new(l_Array_0.join(l_Array_0.filter({
            v12, 
            (l_prettyDOM_0(v13))
        }, l_Boolean_0.toJSBoolean), "\n\n"));
        v14.name = "TestingLibraryElementError";
        return v14;
    end, 
    _disableExpensiveErrorDiagnostics = false, 
    computedStyleSupportsPseudoElements = false
};
v6.runWithExpensiveErrorDiagnosticsDisabled = function(v16)
    local l_status_0, l_result_0 = pcall(function()
        v15._disableExpensiveErrorDiagnostics = true;
        return v16();
    end);
    v15._disableExpensiveErrorDiagnostics = false;
    if not l_status_0 then
        error(l_result_0);
    end;
    return l_result_0;
end;
v6.configure = function(v19)
    if typeof(v19) == "function" then
        v19 = v19(v15);
    end;
    if v19.defaultIgnore then
        v5.setIgnore(v19.defaultIgnore);
    end;
    v15 = l_Object_0.assign({}, l_Object_0.assign(v15, {
        defaultIgnore = l_Object_0.None
    }), v19);
end;
v6.getConfig = function()
    return l_Object_0.assign({}, v15, {
        defaultIgnore = v5.getIgnore()
    });
end;
return v6;
