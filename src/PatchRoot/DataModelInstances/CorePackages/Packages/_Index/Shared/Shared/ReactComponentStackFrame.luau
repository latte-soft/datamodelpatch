local _ = require(script.Parent.ReactElementType);
local _ = require(script.Parent["flowtypes.roblox"]);
local v2 = require(script.Parent.ReactSymbols);
local l_REACT_SUSPENSE_TYPE_0 = v2.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = v2.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = v2.REACT_FORWARD_REF_TYPE;
local l_REACT_MEMO_TYPE_0 = v2.REACT_MEMO_TYPE;
local l_REACT_BLOCK_TYPE_0 = v2.REACT_BLOCK_TYPE;
local l_REACT_LAZY_TYPE_0 = v2.REACT_LAZY_TYPE;
local v9 = require(script.Parent["ConsolePatchingDev.roblox"]);
local l_disableLogs_0 = v9.disableLogs;
local l_reenableLogs_0 = v9.reenableLogs;
local l_ReactCurrentDispatcher_0 = require(script.Parent.ReactSharedInternals).ReactCurrentDispatcher;
local v13 = nil;
local v14 = nil;
local function _(v15)
    if type(v15) == "function" then
        return debug.info(v15, "n");
    elseif type(v15) == "table" then
        return (tostring(v15));
    else
        return nil;
    end;
end;
local function v21(v17, v18, v19)
    local v20 = nil;
    if not (not _G.__DEV__ or not v19) then
        v20 = if type(v19) == "function" then debug.info(v19, "n") else if type(v19) == "table" then tostring(v19) else nil;
    end;
    return v13(v17, v18, v20);
end;
local v22 = false;
local v23 = nil;
if _G.__DEV__ then
    v23 = setmetatable({}, {
        __mode = "k"
    });
end;
local function v45(v24, v25)
    if v24 and not v22 then
        if _G.__DEV__ then
            local v26 = v23[v24];
            if v26 ~= nil then
                return v26;
            end;
        end;
        local v27 = nil;
        v22 = true;
        local v28 = nil;
        if _G.__DEV__ then
            v28 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = nil;
            l_disableLogs_0();
        end;
        local v29 = nil;
        local _, v34 = xpcall(function()
            if not v25 then
                local _, l_result_0 = pcall(function()
                    v29 = debug.traceback();
                    error({
                        stack = v29
                    });
                end);
                v27 = l_result_0;
                v24();
                return ;
            else
                return ;
            end;
        end, function(v32)
            return {
                message = v32, 
                stack = v29
            };
        end);
        local v35 = nil;
        if not (not v34 or not v27) and type(v34.stack) == "string" then
            local v36 = string.split(v34.stack, "\n");
            local v37 = string.split(v27.stack, "\n");
            local v38 = #v36 - 1;
            local v39 = #v37 - 1;
            while (v38 >= 2 and v39 >= 0) and v36[v38] ~= v37[v39] do
                v39 = v39 - 1;
            end;
            while v38 >= 3 and v39 >= 1 do
                v38 = v38 - 1;
                v39 = v39 - 1;
                if v36[v38] ~= v37[v39] then
                    if not (v38 == 1) or v39 ~= 1 then
                        while true do
                            v38 = v38 - 1;
                            v39 = v39 - 1;
                            if not (v39 >= 0) or v36[v38] ~= v37[v39] then
                                local v40 = "\n" .. "    in " .. v36[v38];
                                if _G.__DEV__ then
                                    v23[v24] = v40;
                                end;
                                v35 = v40;
                            end;
                            if not (v38 >= 3 and v39 >= 1) then
                                goto label0;
                            end;
                        end;
                    else
                        break;
                    end;
                end;
            end;
        end;
        ::label0::;
        v22 = false;
        if _G.__DEV__ then
            l_ReactCurrentDispatcher_0.current = v28;
            l_reenableLogs_0();
        end;
        if v35 ~= nil then
            return v35;
        else
            local v41 = if type(v24) == "function" then debug.info(v24, "n") else if type(v24) == "table" then tostring(v24) else "";
            local v42 = "";
            if v41 ~= nil and v41 ~= "" then
                local v43 = nil;
                local _ = _G.__DEV__;
                v42 = v13(v41, nil, v43);
            end;
            if _G.__DEV__ then
                v23[v24] = v42;
            end;
            return v42;
        end;
    else
        return "";
    end;
end;
v13 = function(v46, v47, v48)
    local v49 = "";
    if not _G.__DEV__ or not v47 then
        if v48 then
            v49 = " (created by " .. v48 .. ")";
        end;
    else
        local l_fileName_0 = v47.fileName;
        local v51 = string.gsub(l_fileName_0, "^(.*)[\\/]", "");
        if string.match(v51, "^init%.") then
            local v52 = string.match(l_fileName_0, "^(.*)[\\/]");
            if v52 and #v52 ~= 0 then
                v51 = string.gsub(v52, "^(.*)[\\/]", "") .. "/" .. v51;
            end;
        end;
        v49 = " (at " .. v51 .. ":" .. v47.lineNumber .. ")";
    end;
    return "\n    in " .. (v46 or "Unknown") .. v49;
end;
local function v58(v53, v54, v55)
    local v56 = tostring(v53);
    local v57 = nil;
    if not (not _G.__DEV__ or not v55) then
        v57 = if type(v55) == "function" then debug.info(v55, "n") else if type(v55) == "table" then tostring(v55) else nil;
    end;
    return v13(v56, v54, v57);
end;
v14 = function(v59, v60, v61)
    if v59 then
        local v62 = if type(v59) == "function" then debug.info(v59, "n") else tostring(v59);
        local v63 = nil;
        if not (not _G.__DEV__ or not v61) then
            v63 = if type(v61) == "function" then debug.info(v61, "n") else if type(v61) == "table" then tostring(v61) else nil;
        end;
        return v13(v62, v60, v63);
    else
        return "";
    end;
end;
local function v64(v65, v66, v67)
    if _G.__DEV__ then
        if v65 == nil then
            return "";
        elseif type(v65) == "table" and type(v65.__ctor) == "function" then
            return v58(v65, v66, v67);
        elseif type(v65) == "function" then
            return v14(v65, v66, v67);
        elseif type(v65) == "string" then
            return v21(v65, v66, v67);
        elseif v65 == l_REACT_SUSPENSE_TYPE_0 then
            return v21("Suspense", v66, v67);
        elseif v65 == l_REACT_SUSPENSE_LIST_TYPE_0 then
            return v21("SuspenseList", v66, v67);
        else
            if type(v65) == "table" then
                local v68 = v65["$$typeof"];
                if v68 == l_REACT_FORWARD_REF_TYPE_0 then
                    return v14(v65.render, v66, v67);
                elseif v68 == l_REACT_MEMO_TYPE_0 then
                    return v64(v65.type, v66, v67);
                elseif v68 == l_REACT_BLOCK_TYPE_0 then
                    return v14(v65._render, v66, v67);
                elseif v68 == l_REACT_LAZY_TYPE_0 then
                    local l__payload_0 = v65._payload;
                    local l__init_0 = v65._init;
                    local l_status_1, l_result_1 = pcall(function()
                        v64(l__init_0(l__payload_0), v66, v67);
                    end);
                    if l_status_1 then
                        return l_result_1;
                    end;
                end;
            end;
            return "";
        end;
    else
        return "";
    end;
end;
return {
    describeComponentFrame = v13, 
    describeBuiltInComponentFrame = v21, 
    describeNativeComponentFrame = v45, 
    describeClassComponentFrame = v58, 
    describeFunctionComponentFrame = v14, 
    describeUnknownElementTypeFrameInDEV = v64
};
