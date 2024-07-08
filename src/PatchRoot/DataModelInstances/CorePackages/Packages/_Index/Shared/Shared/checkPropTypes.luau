local l_Error_0 = require(script.Parent.Parent.LuauPolyfill).Error;
local v1 = require(script.Parent.console);
local v2 = {};
local l_describeUnknownElementTypeFrameInDEV_0 = require(script.Parent.ReactComponentStackFrame).describeUnknownElementTypeFrameInDEV;
local v4 = require(script.Parent.ReactSharedInternals);
local l_describeError_0 = require(script.Parent["ErrorHandling.roblox"]).describeError;
local l_ReactDebugCurrentFrame_0 = v4.ReactDebugCurrentFrame;
local function _(v7)
    if _G.__DEV__ then
        if not v7 then
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
        else
            local l__owner_0 = v7._owner;
            l_ReactDebugCurrentFrame_0.setExtraStackFrame((l_describeUnknownElementTypeFrameInDEV_0(v7.type, v7._source, if l__owner_0 ~= nil then l__owner_0.type else nil)));
            return ;
        end;
    end;
end;
return function(v10, v11, v12, v13, v14, v15)
    if not (not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) then
        if not (not v10 or not v11) then
            v1.warn("You've defined both propTypes and validateProps on " .. (v14 or "a component"));
        end;
        if v11 then
            if typeof(v11) ~= "function" then
                v1.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(v11), v14 or ""));
            else
                local v16, v17 = v11(v12);
                if not v16 then
                    error((string.format("validateProps failed on a %s type in %s: %s", v13, v14 or "<UNKNOWN Component>", (tostring(v17 or "<Validator function did not supply a message>")))));
                end;
            end;
        end;
        if v10 then
            assert(typeof(v10) == "table", "propTypes needs to be a table");
            for v18, _ in v10, nil, nil do
                local _, v22 = xpcall(function()
                    if typeof(v10[v18]) ~= "function" then
                        local v20 = l_Error_0.new((v14 or "React class") .. ": " .. v13 .. " type `" .. v18 .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(v10[v18]) .. "`." .. "This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.");
                        v20.name = "Invariant Violation";
                        error(v20);
                    end;
                    return v10[v18](v12, v18, v14, v13, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");
                end, l_describeError_0);
                local v23 = typeof(v22) == "table";
                if not (not (v22 ~= nil) or v23) then
                    if _G.__DEV__ then
                        if not v15 then
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        else
                            local l__owner_1 = v15._owner;
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame((l_describeUnknownElementTypeFrameInDEV_0(v15.type, v15._source, if l__owner_1 ~= nil then l__owner_1.type else nil)));
                        end;
                    end;
                    v1.error(string.format("%s: type specification of %s" .. " `%s` is invalid; the type checker " .. "function must return `nil` or an `Error` but returned a %s. " .. "You may have forgotten to pass an argument to the type checker " .. "creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and " .. "shape all require an argument).", v14 or "React class", v13, v18, (typeof(v22))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
                if v23 and v2[v22.message] == nil then
                    v2[tostring(v22.message)] = true;
                    if _G.__DEV__ then
                        if not v15 then
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        else
                            local l__owner_2 = v15._owner;
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame((l_describeUnknownElementTypeFrameInDEV_0(v15.type, v15._source, if l__owner_2 ~= nil then l__owner_2.type else nil)));
                        end;
                    end;
                    v1.warn(string.format("Failed %s type: %s", v13, (tostring(v22.message))));
                    if _G.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
            end;
        end;
    end;
end;
