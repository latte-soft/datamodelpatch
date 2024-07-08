local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(script.Parent.ReactInternalTypes);
local v3 = require(script.Parent.ReactWorkTags);
local l_HostComponent_0 = v3.HostComponent;
local l_LazyComponent_0 = v3.LazyComponent;
local l_SuspenseComponent_0 = v3.SuspenseComponent;
local l_SuspenseListComponent_0 = v3.SuspenseListComponent;
local l_FunctionComponent_0 = v3.FunctionComponent;
local l_IndeterminateComponent_0 = v3.IndeterminateComponent;
local l_ForwardRef_0 = v3.ForwardRef;
local l_SimpleMemoComponent_0 = v3.SimpleMemoComponent;
local l_ClassComponent_0 = v3.ClassComponent;
local l_ReactComponentStackFrame_0 = require(l_Parent_0.Shared).ReactComponentStackFrame;
local l_describeBuiltInComponentFrame_0 = l_ReactComponentStackFrame_0.describeBuiltInComponentFrame;
local l_describeFunctionComponentFrame_0 = l_ReactComponentStackFrame_0.describeFunctionComponentFrame;
local l_describeClassComponentFrame_0 = l_ReactComponentStackFrame_0.describeClassComponentFrame;
local function v21(v17)
    local v18 = nil;
    if _G.__DEV__ then
        local l__debugOwner_0 = v17._debugOwner;
        if l__debugOwner_0 then
            v18 = l__debugOwner_0.type;
        end;
    end;
    local v20 = nil;
    if _G.__DEV__ then
        v20 = v17._debugSource;
    end;
    if v17.tag == l_HostComponent_0 then
        return l_describeBuiltInComponentFrame_0(v17.type, v20, v18);
    elseif v17.tag == l_LazyComponent_0 then
        return l_describeBuiltInComponentFrame_0("Lazy", v20, v18);
    elseif v17.tag == l_SuspenseComponent_0 then
        return l_describeBuiltInComponentFrame_0("Suspense", v20, v18);
    elseif v17.tag == l_SuspenseListComponent_0 then
        return l_describeBuiltInComponentFrame_0("SuspenseList", v20, v18);
    elseif not (v17.tag ~= l_FunctionComponent_0 and v17.tag ~= l_IndeterminateComponent_0) or v17.tag == l_SimpleMemoComponent_0 then
        return l_describeFunctionComponentFrame_0(v17.type, v20, v18);
    elseif v17.tag == l_ForwardRef_0 then
        return l_describeFunctionComponentFrame_0(v17.type.render, v20, v18);
    elseif v17.tag == l_ClassComponent_0 then
        return l_describeClassComponentFrame_0(v17.type, v20, v18);
    else
        return "";
    end;
end;
return {
    getStackByFiberInDevAndProd = function(v22)
        local l_status_0, l_result_0 = pcall(function()
            local v23 = "";
            local l_v22_0 = v22;
            while true do
                v23 = v23 .. v21(l_v22_0);
                l_v22_0 = l_v22_0.return_;
                if not (l_v22_0 ~= nil) then
                    break;
                end;
            end;
            return v23;
        end);
        if l_status_0 then
            return l_result_0;
        elseif (not (typeof(l_result_0) == "table") or not l_result_0.message) or not l_result_0.stack then
            return "\nError generating stack: " .. tostring(l_result_0);
        else
            return "\nError generating stack: " .. l_result_0.message .. "\n" .. tostring(l_result_0.stack);
        end;
    end
};
