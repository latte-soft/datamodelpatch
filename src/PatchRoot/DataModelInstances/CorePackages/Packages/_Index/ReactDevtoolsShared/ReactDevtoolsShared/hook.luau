local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Map_0 = v0.Map;
local l_Set_0 = v0.Set;
local v4 = {};
local v5 = require(script.Parent.backend.console);
local l_patch_0 = v5.patch;
local l_registerRenderer_0 = v5.registerRenderer;
local _ = require(script.Parent.backend.types);
local l__G_0 = _G;
v4.installHook = function(v10)
    if not v10.__REACT_DEVTOOLS_GLOBAL_HOOK__ then
        local v11 = nil;
        local v12 = {};
        local v13 = l_Map_0.new();
        local v14 = {};
        local v15 = l_Map_0.new();
        local _ = function(_)
            return "production";
        end;
        local function v19(_)
        end;
        local v20 = 1;
        local function _()
            v20 = v20 + 1;
            return v20;
        end;
        v11 = {
            rendererInterfaces = v13, 
            listeners = v14, 
            renderers = v15, 
            emit = function(v22, v23)
                if v14[v22] then
                    for _, v25 in v14[v22], nil, nil do
                        v25(v23);
                    end;
                end;
            end, 
            getFiberRoots = function(v26)
                local l_v12_0 = v12;
                if not l_v12_0[v26] then
                    l_v12_0[v26] = l_Set_0.new();
                end;
                return l_v12_0[v26];
            end, 
            inject = function(v28)
                v20 = v20 + 1;
                local l_v20_0 = v20;
                v15:set(l_v20_0, v28);
                local v30 = "production";
                if _G.__DEV__ then
                    pcall(function()
                        local v31 = l__G_0.__REACT_DEVTOOLS_APPEND_COMPONENT_STACK__ ~= false;
                        local v32 = l__G_0.__REACT_DEVTOOLS_BREAK_ON_CONSOLE_ERRORS__ == true;
                        if not (not v31 and not v32) then
                            l_registerRenderer_0(v28);
                            l_patch_0({
                                appendComponentStack = v31, 
                                breakOnConsoleErrors = v32
                            });
                        end;
                    end);
                end;
                local l___REACT_DEVTOOLS_ATTACH___0 = v10.__REACT_DEVTOOLS_ATTACH__;
                if type(l___REACT_DEVTOOLS_ATTACH___0) == "function" then
                    v11.rendererInterfaces:set(l_v20_0, (l___REACT_DEVTOOLS_ATTACH___0(v11, l_v20_0, v28, v10)));
                end;
                v11.emit("renderer", {
                    id = l_v20_0, 
                    renderer = v28, 
                    reactBuildType = v30
                });
                return l_v20_0;
            end, 
            on = function(v34, v35)
                if not v14[v34] then
                    v14[v34] = {};
                end;
                table.insert(v14[v34], v35);
            end, 
            off = function(v36, v37)
                if v14[v36] then
                    local v38 = l_Array_0.indexOf(v14[v36], v37);
                    if v38 ~= -1 then
                        l_Array_0.splice(v14[v36], v38, 1);
                    end;
                    if #v14[v36] == 0 then
                        v14[v36] = nil;
                    end;
                    return ;
                else
                    return ;
                end;
            end, 
            sub = function(v39, v40)
                v11.on(v39, v40);
                return function()
                    return v11.off(v39, v40);
                end;
            end, 
            supportsFiber = true, 
            checkDCE = v19, 
            onCommitFiberUnmount = function(v41, v42)
                local v43 = v13:get(v41);
                if v43 ~= nil then
                    v43.handleCommitFiberUnmount(v42);
                end;
            end, 
            onCommitFiberRoot = function(v44, v45, v46)
                local v47 = v11.getFiberRoots(v44);
                local l_current_0 = v45.current;
                local v49 = v47[v45] ~= nil;
                local v50 = true;
                if l_current_0.memoizedState ~= nil then
                    v50 = l_current_0.memoizedState.element == nil;
                end;
                if v49 or v50 then
                    if not (not v49 or not v50) then
                        v47[v45] = nil;
                    end;
                else
                    v47[v45] = true;
                end;
                local v51 = v13:get(v44);
                if v51 ~= nil then
                    v51.handleCommitFiberRoot(v45, v46);
                end;
            end
        };
        v10.__REACT_DEVTOOLS_GLOBAL_HOOK__ = v11;
        return v11;
    else
        return nil;
    end;
end;
return v4;
