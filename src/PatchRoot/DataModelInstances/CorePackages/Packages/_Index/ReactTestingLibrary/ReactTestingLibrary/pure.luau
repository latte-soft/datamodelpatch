local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local l_console_0 = v1.console;
local v7 = require(l_Parent_0.Promise);
local v8 = require(l_Parent_0.ReactRoblox);
local v9 = {};
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.DomTestingLibrary);
local l_getQueriesForElement_0 = v11.getQueriesForElement;
local l_prettyDOM_0 = v11.prettyDOM;
local l_configure_0 = v11.configure;
local v15 = require(script.Parent["act-compat"]);
local l_default_0 = v15.default;
local l_asyncAct_0 = v15.asyncAct;
local l_fireEvent_0 = require(script.Parent["fire-event"]).fireEvent;
local v19 = nil;
l_configure_0({
    asyncWrapper = function(v20)
        return v7.resolve():andThen(function()
            local v21 = nil;
            l_asyncAct_0(function()
                return v7.resolve():andThen(function()
                    v21 = v20():expect();
                end);
            end):expect();
            return v21;
        end);
    end, 
    eventWrapper = function(v22)
        local v23 = nil;
        l_default_0(function()
            v23 = v22();
        end);
        return v23;
    end
});
local v24 = l_Set_0.new();
local v25 = nil;
local function v26(v27, v28)
    local v29 = if v28 == nil then {} else v28;
    local l_container_0 = v29.container;
    local v31 = if v29.baseElement == nil then v29.container else v29.baseElement;
    local l_queries_0 = v29.queries;
    local v33 = not (v29.hydrate == nil) and v29.hydrate;
    local l_wrapper_0 = v29.wrapper;
    if not v31 then
        v31 = v11.document;
    end;
    if not l_container_0 then
        l_container_0 = Instance.new("Folder");
        l_container_0.Parent = v31;
        v25 = v8.createLegacyRoot(l_container_0);
    end;
    v24:add(l_container_0);
    local function _(v35)
        if not l_wrapper_0 then
            return v35;
        else
            return (v10.createElement(l_wrapper_0, nil, v35));
        end;
    end;
    l_default_0(function()
        if not v33 then
            local l_v25_0 = v25;
            local l_v27_0 = v27;
            l_v25_0:render(if not l_wrapper_0 then l_v27_0 else v10.createElement(l_wrapper_0, nil, l_v27_0));
            return ;
        else
            error(l_Error_0.new("hydrate not supported"));
            return ;
        end;
    end);
    return l_Object_0.assign({}, {
        container = l_container_0, 
        baseElement = v31, 
        debug = function(v39, v40, v41)
            if v39 == nil then
                v39 = v31;
            end;
            if not l_Array_0.isArray(v39) then
                return (l_console_0.log(l_prettyDOM_0(v39, v40, v41)));
            else
                return (l_Array_0.forEach(v39, function(v42)
                    return l_console_0.log(l_prettyDOM_0(v42, v40, v41));
                end));
            end;
        end, 
        unmount = function()
            l_default_0(function()
                v25:unmount();
            end);
        end, 
        rerender = function(v43)
            v26(if not l_wrapper_0 then v43 else v10.createElement(l_wrapper_0, nil, v43), {
                container = l_container_0, 
                baseElement = v31
            });
        end, 
        asFragment = function()
            warn("asFragment not supported");
        end
    }, l_getQueriesForElement_0(v31, l_queries_0));
end;
local function v44()
    v24:forEach(v19);
end;
v19 = function(v45)
    l_default_0(function()
        v25:unmount();
    end);
    if v45.Parent == v11.document then
        v45.Parent = nil;
    end;
    v24:delete(v45);
end;
l_Object_0.assign(v9, require(l_Parent_0.DomTestingLibrary));
v9.render = v26;
v9.cleanup = v44;
v9.act = l_default_0;
v9.fireEvent = l_fireEvent_0;
return v9;
