local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_WeakMap_0 = v1.WeakMap;
local l_Number_0 = v1.Number;
local l_Object_0 = v1.Object;
local l_HttpService_0 = game:GetService("HttpService");
local v7 = {};
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v9 = require(l_Parent_0.ReactIs);
local l_isElement_0 = v9.isElement;
local l_typeOf_0 = v9.typeOf;
local l_ContextConsumer_0 = v9.ContextConsumer;
local l_ContextProvider_0 = v9.ContextProvider;
local l_ForwardRef_0 = v9.ForwardRef;
local l_Fragment_0 = v9.Fragment;
local l_Lazy_0 = v9.Lazy;
local l_Memo_0 = v9.Memo;
local l_Portal_0 = v9.Portal;
local l_Profiler_0 = v9.Profiler;
local l_StrictMode_0 = v9.StrictMode;
local l_Suspense_0 = v9.Suspense;
local l_REACT_SUSPENSE_LIST_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_SUSPENSE_LIST_TYPE;
local v23 = require(script.Parent.constants);
local l_TREE_OPERATION_ADD_0 = v23.TREE_OPERATION_ADD;
local l_TREE_OPERATION_REMOVE_0 = v23.TREE_OPERATION_REMOVE;
local l_TREE_OPERATION_REORDER_CHILDREN_0 = v23.TREE_OPERATION_REORDER_CHILDREN;
local l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 = v23.TREE_OPERATION_UPDATE_TREE_BASE_DURATION;
local v28 = require(script.Parent.types);
local l_ElementTypeRoot_0 = v28.ElementTypeRoot;
local l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0 = v23.LOCAL_STORAGE_FILTER_PREFERENCES_KEY;
local l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0 = v23.LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS;
local l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0 = v23.LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY;
local l_ComponentFilterElementType_0 = v28.ComponentFilterElementType;
local l_ElementTypeHostComponent_0 = v28.ElementTypeHostComponent;
local l_ElementTypeClass_0 = v28.ElementTypeClass;
local l_ElementTypeForwardRef_0 = v28.ElementTypeForwardRef;
local l_ElementTypeFunction_0 = v28.ElementTypeFunction;
local l_ElementTypeMemo_0 = v28.ElementTypeMemo;
local v39 = require(script.Parent.storage);
local l_localStorageGetItem_0 = v39.localStorageGetItem;
local l_localStorageSetItem_0 = v39.localStorageSetItem;
local l_meta_0 = require(script.Parent.hydration).meta;
local v43 = l_WeakMap_0.new();
v7.alphaSortKeys = function(v44, v45)
    return tostring(v45) < tostring(v44);
end;
v7.getAllEnumerableKeys = function(v46)
    return l_Object_0.keys(v46);
end;
v7.getDisplayName = function(v47, v48)
    v48 = v48 or "Anonymous";
    local v49 = v43:get(v47);
    if v49 ~= nil then
        return v49;
    else
        local l_v48_0 = v48;
        if typeof(v47) == "table" and typeof(v47.__componentName) == "string" then
            l_v48_0 = v47.__componentName;
        elseif (typeof(v47) == "table" and typeof(v47.name) == "string") and v47.name ~= "" then
            l_v48_0 = v47.name;
        elseif typeof(v47) == "function" then
            l_v48_0 = l_getComponentName_0(v47) or l_v48_0;
        end;
        v43:set(v47, l_v48_0);
        return l_v48_0;
    end;
end;
local v51 = 0;
v7.getUID = function()
    v51 = v51 + 1;
    return v51;
end;
v7.printOperationsArray = function(v52)
    local v53 = {
        string.format("operations for renderer:%s and root:%s", tostring(v52[1]), (tostring(v52[2])))
    };
    local v54 = 3;
    local function _()
        local l_v54_0 = v54;
        v54 = v54 + 1;
        return l_v54_0;
    end;
    local v57 = {
        ""
    };
    local l_v54_1 = v54;
    v54 = v54 + 1;
    local v59 = v54 + v52[l_v54_1];
    while v54 < v59 do
        local l_v54_2 = v54;
        v54 = v54 + 1;
        table.insert(v57, v52[l_v54_2]);
    end;
    while v54 < #v52 do
        l_v54_1 = v52[v54];
        if l_v54_1 == l_TREE_OPERATION_ADD_0 then
            local v61 = v52[v54 + 1];
            local v62 = v52[v54 + 2];
            v54 = v54 + 3;
            if v62 == l_ElementTypeRoot_0 then
                table.insert(v53, string.format("Add new root node %d", v61));
                v54 = v54 + 1;
                v54 = v54 + 1;
            else
                local v63 = v52[v54];
                v54 = v54 + 1;
                v54 = v54 + 1;
                local v64 = v57[v52[v54] + 1];
                v54 = v54 + 1;
                v54 = v54 + 1;
                table.insert(v53, string.format("Add node %d (%s) as child of %d", v61, v64 or "null", v63));
            end;
        elseif l_v54_1 == l_TREE_OPERATION_REMOVE_0 then
            local v65 = v52[v54 + 1];
            v54 = v54 + 2;
            for _ = 1, v65 do
                local v67 = v52[v54];
                v54 = v54 + 1;
                table.insert(v53, string.format("Remove node %d", v67));
            end;
        elseif l_v54_1 == l_TREE_OPERATION_REORDER_CHILDREN_0 then
            local v68 = v52[v54 + 1];
            local v69 = v52[v54 + 2];
            v54 = v54 + 3;
            local v70 = l_Array_0.slice(v52, v54, v54 + v69);
            v54 = v54 + v69;
            table.insert(v53, string.format("Re-order node %d children %s", v68, l_Array_0.join(v70, ",")));
        elseif l_v54_1 == l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 then
            v54 = v54 + 3;
        else
            error(string.format("Unsupported Bridge operation %d", l_v54_1));
        end;
    end;
    print(table.concat(v53, "\n  "));
end;
v7.getDefaultComponentFilters = function()
    return {
        {
            type = l_ComponentFilterElementType_0, 
            value = l_ElementTypeHostComponent_0, 
            isEnabled = true
        }
    };
end;
v7.getSavedComponentFilters = function()
    local l_status_0, l_result_0 = pcall(function()
        local v71 = l_localStorageGetItem_0(l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0);
        if v71 ~= nil then
            return l_HttpService_0:JSONDecode(v71);
        else
            return nil;
        end;
    end);
    if l_status_0 then
        return l_result_0;
    else
        return v7.getDefaultComponentFilters();
    end;
end;
v7.saveComponentFilters = function(v74)
    l_localStorageSetItem_0(l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0, l_HttpService_0:JSONEncode(v74));
end;
v7.getAppendComponentStack = function()
    local l_status_1, l_result_1 = pcall(function()
        local v75 = l_localStorageGetItem_0(l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0);
        if v75 ~= nil then
            return l_HttpService_0:JSONDecode(v75);
        else
            return nil;
        end;
    end);
    if l_status_1 then
        return l_result_1;
    else
        return true;
    end;
end;
v7.setAppendComponentStack = function(v78)
    l_localStorageSetItem_0(l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0, l_HttpService_0:JSONEncode(v78));
end;
v7.getBreakOnConsoleErrors = function()
    local l_status_2, l_result_2 = pcall(function()
        local v79 = l_localStorageGetItem_0(l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0);
        if v79 ~= nil then
            return l_HttpService_0:JSONDecode(v79);
        else
            return nil;
        end;
    end);
    if not l_status_2 then
        return false;
    else
        return l_result_2;
    end;
end;
v7.setBreakOnConsoleErrors = function(v82)
    l_localStorageSetItem_0(l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0, l_HttpService_0:JSONEncode(v82));
end;
v7.separateDisplayNameAndHOCs = function(v83, v84)
    if v83 == nil then
        return nil, nil;
    else
        local v85 = nil;
        if not (not (not ((v84 ~= l_ElementTypeClass_0 and v84 ~= l_ElementTypeForwardRef_0) and v84 ~= l_ElementTypeFunction_0) or v84 == l_ElementTypeMemo_0) or not string.find(v83, "(", 1, true)) then
            local v86 = {};
            for v87 in string.gmatch(v83, "[^()]+") do
                table.insert(v86, v87);
            end;
            local v88 = #v86;
            local v89 = v86[v88];
            v86[v88] = nil;
            v83 = v89;
            v85 = v86;
        end;
        if v84 == l_ElementTypeMemo_0 then
            if v85 == nil then
                v85 = {
                    "Memo"
                };
            else
                l_Array_0.unshift(v85, "Memo");
            end;
        elseif v84 == l_ElementTypeForwardRef_0 then
            if v85 == nil then
                v85 = {
                    "ForwardRef"
                };
            else
                l_Array_0.unshift(v85, "ForwardRef");
            end;
        end;
        return v83, v85;
    end;
end;
v7.shallowDiffers = function(v90, v91)
    for v92, v93 in v90, nil, nil do
        if v91[v92] ~= v93 then
            return true;
        end;
    end;
    return false;
end;
v7.getInObject = function(v94, v95)
    return l_Array_0.reduce(v95, function(v96, v97)
        if v96 and v96[v97] ~= nil then
            return v96[v97];
        else
            return nil;
        end;
    end, v94);
end;
v7.deletePathInObject = function(v98, v99)
    local v100 = #v99;
    local v101 = v99[v100];
    if v98 ~= nil then
        local v102 = v7.getInObject(v98, l_Array_0.slice(v99, 0, v100));
        if v102 then
            if not l_Array_0.isArray(v102) then
                v102[v101] = nil;
            else
                l_Array_0.splice(v102, v101, 1);
                return ;
            end;
        end;
    end;
end;
v7.renamePathInObject = function(v103, v104, v105)
    local v106 = #v104;
    if v103 ~= nil then
        local v107 = v7.getInObject(v103, l_Array_0.slice(v104, 1, v106));
        if v107 then
            local v108 = v104[v106];
            v107[v105[v106]] = v107[v108];
            if not l_Array_0.isArray(v107) then
                v107[v108] = nil;
            else
                l_Array_0.splice(v107, v108, 1);
                return ;
            end;
        end;
    end;
end;
v7.setInObject = function(v109, v110, v111)
    local v112 = #v110;
    local v113 = v110[v112];
    if v109 ~= nil then
        local v114 = v7.getInObject(v109, l_Array_0.slice(v110, 1, v112));
        if v114 then
            v114[v113] = v111;
        end;
    end;
end;
v7.getDataType = function(v115)
    if v115 == nil then
        return "null";
    elseif not l_isElement_0(v115) then
        local v116 = typeof(v115);
        if v116 == "bigint" then
            return "bigint";
        elseif v116 == "boolean" then
            return "boolean";
        elseif v116 == "function" then
            return "function";
        elseif v116 == "number" then
            if not l_Number_0.isNaN(v115) then
                if l_Number_0.isFinite(v115) then
                    return "number";
                else
                    return "infinity";
                end;
            else
                return "nan";
            end;
        elseif v116 == "object" then
            if not l_Array_0.isArray(v115) then
                return "object";
            else
                return "array";
            end;
        elseif v116 == "string" then
            return "string";
        elseif v116 == "nil" then
            return "nil";
        else
            return "unknown";
        end;
    else
        return "react_element";
    end;
end;
v7.getDisplayNameForReactElement = function(v117)
    local v118 = l_typeOf_0(v117);
    if v118 == l_ContextConsumer_0 then
        return "ContextConsumer";
    elseif v118 == l_ContextProvider_0 then
        return "ContextProvider";
    elseif v118 == l_ForwardRef_0 then
        return "ForwardRef";
    elseif v118 == l_Fragment_0 then
        return "Fragment";
    elseif v118 == l_Lazy_0 then
        return "Lazy";
    elseif v118 == l_Memo_0 then
        return "Memo";
    elseif v118 == l_Portal_0 then
        return "Portal";
    elseif v118 == l_Profiler_0 then
        return "Profiler";
    elseif v118 == l_StrictMode_0 then
        return "StrictMode";
    elseif v118 == l_Suspense_0 then
        return "Suspense";
    elseif v118 == l_REACT_SUSPENSE_LIST_TYPE_0 then
        return "SuspenseList";
    else
        local v119 = if not v117 then nil else v117.type;
        if typeof(v119) == "string" then
            return v119;
        elseif typeof(v119) == "function" then
            return v7.getDisplayName(v119, "Anonymous");
        elseif v119 ~= nil then
            return "NotImplementedInDevtools";
        else
            return "Element";
        end;
    end;
end;
local function v122(v120, v121)
    v121 = v121 or 50;
    if v121 < string.len(v120) then
        return string.sub(v120, 1, v121 + 1) .. "\226\128\166";
    else
        return v120;
    end;
end;
v7.formatDataForPreview = function(v123, v124)
    if v123[l_meta_0.type] ~= nil then
        if not v124 then
            return v123[l_meta_0.preview_short];
        else
            return v123[l_meta_0.preview_long];
        end;
    else
        local v125 = v7.getDataType(v123);
        if v125 == "html_element" then
            local l_format_0 = string.format;
            local v127 = "<%s />";
            local v128, v129 = string.lower(v123.tagName);
            v129 = v129 or 50;
            return l_format_0(v127, if v129 < string.len(v128) then string.sub(v128, 1, v129 + 1) .. "\226\128\166" else v128);
        elseif v125 == "function" then
            local v130, v131 = string.format("\198\146 %s() {}", typeof(v123.name) == "function" and "" or v123.name);
            v131 = v131 or 50;
            if v131 < string.len(v130) then
                return string.sub(v130, 1, v131 + 1) .. "\226\128\166";
            else
                return v130;
            end;
        elseif v125 == "string" then
            return string.format("\"%s\"", (tostring(v123)));
        elseif v125 == "react_element" then
            local l_format_1 = string.format;
            local v133 = "<%s />";
            local v134 = v7.getDisplayNameForReactElement(v123) or "Unknown";
            local v135 = nil or 50;
            return l_format_1(v133, if v135 < string.len(v134) then string.sub(v134, 1, v135 + 1) .. "\226\128\166" else v134);
        elseif v125 == "array" then
            if not v124 then
                return string.format("Array(%s)", if v123[#l_meta_0] ~= nil then v123[#l_meta_0] else #v123);
            else
                local v136 = "";
                for v137 = 1, #v123 do
                    if v137 > 1 then
                        v136 = v136 .. ", ";
                    end;
                    v136 = v136 .. v7.formatDataForPreview(v123[v137], false);
                    if not (string.len(v136) <= 50) then
                        break;
                    end;
                end;
                local l_format_2 = string.format;
                local v139 = "[%s]";
                local l_v136_0 = v136;
                local v141 = nil or 50;
                return l_format_2(v139, if v141 < string.len(l_v136_0) then string.sub(l_v136_0, 1, v141 + 1) .. "\226\128\166" else l_v136_0);
            end;
        elseif v125 == "object" then
            if not v124 then
                return "{\226\128\166}";
            else
                local v142 = v7.getAllEnumerableKeys(v123);
                table.sort(v142, v7.alphaSortKeys);
                local v143 = "";
                for v144 = 1, #v142 do
                    local v145 = v142[v144];
                    if v144 > 1 then
                        v143 = v143 .. ", ";
                    end;
                    v143 = v143 .. string.format("%s: %s", tostring(v145), v7.formatDataForPreview(v123[v145], false));
                    if not (string.len(v143) <= 50) then
                        break;
                    end;
                end;
                local l_format_3 = string.format;
                local v147 = "{%s}";
                local l_v143_0 = v143;
                local v149 = nil or 50;
                return l_format_3(v147, if v149 < string.len(l_v143_0) then string.sub(l_v143_0, 1, v149 + 1) .. "\226\128\166" else l_v143_0);
            end;
        elseif not ((((v125 ~= "boolean" and v125 ~= "number") and v125 ~= "infinity") and v125 ~= "nan") and v125 ~= "null") or v125 == "undefined" then
            return (tostring(v123));
        else
            local l_status_3, l_result_3 = pcall(v122, "" .. tostring(v123));
            if not l_status_3 then
                return "unserializable";
            else
                return l_result_3;
            end;
        end;
    end;
end;
return v7;
