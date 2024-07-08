local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local v5 = require(script.Parent.jsHelpers.typeError);
local v6 = require(script.Parent.jsHelpers.document);
local v7 = {};
local function v9()
    local l_jest_0 = require(l_Parent_0.JestGlobals).jest;
    if l_jest_0 ~= nil then
        return (pcall(l_jest_0.getTimerCount));
    else
        return false;
    end;
end;
local function v10()
    return v6;
end;
local function v12(v11)
    if not l_Boolean_0.toJSBoolean(v11.defaultView) then
        if not l_Boolean_0.toJSBoolean(v11.ownerDocument) or not l_Boolean_0.toJSBoolean(v11.ownerDocument.defaultView) then
            if not l_Boolean_0.toJSBoolean(v11.window) then
                if not l_Boolean_0.toJSBoolean(v11.ownerDocument) or not l_Boolean_0.toJSBoolean(v11.ownerDocument.defaultView == nil) then
                    if typeof(v11.andThen) == "function" then
                        error(l_Error_0.new("It looks like you passed a Promise object instead of a DOM node. Did you do something like `fireEvent.click(screen.findBy...` when you meant to use a `getBy` query `fireEvent.click(screen.getBy...`, or await the findBy query `fireEvent.click(await screen.findBy...`?"));
                        return ;
                    elseif not l_Array_0.isArray(v11) then
                        if typeof(v11.debug) == "function" and typeof(v11.logTestingPlaygroundURL) == "function" then
                            error(l_Error_0.new("It looks like you passed a `screen` object. Did you do something like `fireEvent.click(screen, ...` when you meant to use a query, e.g. `fireEvent.click(screen.getBy..., `?"));
                            return ;
                        else
                            error(l_Error_0.new(("The given node is not an Element, the node type is: %s."):format((typeof(v11)))));
                            return ;
                        end;
                    else
                        error(l_Error_0.new("It looks like you passed an Array instead of a DOM node. Did you do something like `fireEvent.click(screen.getAllBy...` when you meant to use a `getBy` query `fireEvent.click(screen.getBy...`?"));
                        return ;
                    end;
                else
                    error(l_Error_0.new("It looks like the window object is not available for the provided node."));
                    return ;
                end;
            else
                return v11.window;
            end;
        else
            return v11.ownerDocument.defaultView;
        end;
    else
        return v11.defaultView;
    end;
end;
local function v16(v13)
    local function _(v14)
        return (typeof(v14));
    end;
    if not v13 or typeof(v13.GetChildren) ~= "function" then
        error(v5.new(("Expected container to be an Element, a Document or a DocumentFragment but got %s."):format((typeof(v13)))));
    end;
end;
v7.getWindowFromNode = v12;
v7.getDocument = v10;
v7.checkContainerType = v16;
v7.jestFakeTimersAreEnabled = v9;
v7.TEXT_NODE = 3;
return v7;
