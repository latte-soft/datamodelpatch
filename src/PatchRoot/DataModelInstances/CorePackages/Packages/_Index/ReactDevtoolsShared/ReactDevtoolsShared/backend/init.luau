local l_Array_0 = require(script.Parent.Parent.LuauPolyfill).Array;
local _ = require(script.agent);
local _ = require(script.types);
return {
    initBackend = function(v3, v4, v5)
        if v3 == nil then
            return function()
            end;
        else
            local v10 = {
                v3.sub("renderer-attached", function(v6)
                    local l_id_0 = v6.id;
                    local l_rendererInterface_0 = v6.rendererInterface;
                    v4:setRendererInterface(l_id_0, l_rendererInterface_0);
                    l_rendererInterface_0.flushInitialOperations();
                end), 
                v3.sub("unsupported-renderer-version", function(v9)
                    v4:onUnsupportedRenderer(v9);
                end), 
                v3.sub("operations", function(...)
                    v4:onHookOperations(...);
                end), 
                v3.sub("traceUpdates", function(...)
                    v4:onTraceUpdates(...);
                end)
            };
            local function v15(v11, v12)
                local l_attach_0 = require(script.renderer).attach;
                local v14 = v3.rendererInterfaces:get(v11);
                if v14 == nil then
                    if type(v12.findFiberByHostInstance) == "function" then
                        v14 = l_attach_0(v3, v11, v12, v5);
                    elseif not v12.ComponentTree then
                    end;
                    if v14 ~= nil then
                        v3.rendererInterfaces:set(v11, v14);
                    end;
                end;
                if v14 ~= nil then
                    v3.emit("renderer-attached", {
                        id = v11, 
                        renderer = v12, 
                        rendererInterface = v14
                    });
                    return ;
                else
                    v3.emit("unsupported-renderer-version", v11);
                    return ;
                end;
            end;
            v3.renderers:forEach(function(v16, v17)
                v15(v17, v16);
            end);
            table.insert(v10, v3.sub("renderer", function(v18)
                v15(v18.id, v18.renderer);
            end));
            v3.emit("react-devtools", v4);
            v3.reactDevtoolsAgent = v4;
            local function v21()
                l_Array_0.forEach(v10, function(v19)
                    v19();
                end);
                v3.rendererInterfaces:forEach(function(v20)
                    v20.cleanup();
                end);
                v3.reactDevtoolsAgent = nil;
            end;
            v4:addListener("shutdown", v21);
            table.insert(v10, function()
                v4:removeListener("shutdown", v21);
            end);
            return function()
                for _, v23 in v10, nil, nil do
                    v23();
                end;
            end;
        end;
    end, 
    agent = require(script.agent), 
    NativeStyleEditor = {
        types = require(script.NativeStyleEditor.types)
    }
};
