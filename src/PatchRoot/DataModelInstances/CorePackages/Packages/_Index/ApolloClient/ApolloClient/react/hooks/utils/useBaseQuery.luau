local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Promise);
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v4.Boolean;
local l_Object_0 = v4.Object;
local v7 = require(l_Parent_1.React);
local l_useContext_0 = v7.useContext;
local l_useEffect_0 = v7.useEffect;
local l_useReducer_0 = v7.useReducer;
local l_useRef_0 = v7.useRef;
local _ = require(l_Parent_1.GraphQL);
local _ = require(l_Parent_0.jsutils.typedDocumentNode);
local _ = require(script.Parent.Parent.Parent.types.types);
local l_QueryData_0 = require(script.Parent.Parent.Parent.data).QueryData;
local l_useDeepMemo_0 = require(script.Parent.useDeepMemo).useDeepMemo;
local _ = require(script.Parent.Parent.Parent.Parent.core);
local l_getApolloContext_0 = require(script.Parent.Parent.Parent.context).getApolloContext;
local l_useAfterFastRefresh_0 = require(script.Parent.useAfterFastRefresh).useAfterFastRefresh;
local v20 = {
    __value = "nil placeholder"
};
v0.useBaseQuery = function(v21, v22, v23)
    if v23 == nil then
        v23 = false;
    end;
    local v24 = l_useContext_0(l_getApolloContext_0());
    local v26, v27 = l_useReducer_0(function(v25)
        return v25 + 1;
    end, 0);
    local v28 = not not l_Boolean_0.toJSBoolean(v22) and l_Object_0.assign({}, v22, {
        query = v21
    }) or {
        query = v21
    };
    local v29 = l_useRef_0(nil);
    local v30 = nil;
    v30 = v29.current or (function()
        v29.current = l_QueryData_0.new({
            options = v28, 
            context = v24, 
            onNewData = function(_)
                if l_Boolean_0.toJSBoolean(v30:ssrInitiated()) then
                    v27(nil);
                    return ;
                else
                    v3.delay(0):andThen(function()
                        if not (v29.current ~= nil) or not v29.current.isMounted then
                            return ;
                        else
                            return v27(nil);
                        end;
                    end);
                    return ;
                end;
            end
        });
        return v29.current;
    end)();
    v30:setOptions(v28);
    v30.context = v24;
    local v32 = l_useDeepMemo_0(function()
        if not v23 then
            return v30:execute();
        else
            return v30:executeLazy();
        end;
    end, {
        options = l_Object_0.assign({}, v28, {
            onError = l_Object_0.None, 
            onCompleted = l_Object_0.None
        }), 
        context = v24, 
        tick = v26
    });
    local v33 = if not v23 then v32 else v32[2];
    if _G.__DEV__ then
        l_useAfterFastRefresh_0(v27);
    end;
    l_useEffect_0(function()
        return function()
            v30:cleanup();
            v29.current = nil;
        end;
    end, {});
    l_useEffect_0(function()
        return v30:afterExecute({
            lazy = v23
        });
    end, {
        v33.loading ~= nil and v33.loading or v20, 
        v33.networkStatus ~= nil and v33.networkStatus or v20, 
        v33.error ~= nil and v33.error or v20, 
        v33.data ~= nil and v33.data or v20
    });
    return v32;
end;
return v0;
