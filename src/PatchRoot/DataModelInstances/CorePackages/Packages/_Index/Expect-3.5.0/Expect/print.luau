local l_Parent_0 = script.Parent.Parent;
local l_Number_0 = require(l_Parent_0.LuauPolyfill).Number;
local v2 = require(l_Parent_0.JestMatcherUtils);
local l_EXPECTED_COLOR_0 = v2.EXPECTED_COLOR;
local l_INVERTED_COLOR_0 = v2.INVERTED_COLOR;
local l_RECEIVED_COLOR_0 = v2.RECEIVED_COLOR;
local l_printReceived_0 = v2.printReceived;
local l_stringify_0 = v2.stringify;
local function _(v8)
    return (v8:gsub("(\\)", "\\%1"):gsub("(\")", "\\%1"));
end;
local function v13(v10, v11, v12)
    return l_RECEIVED_COLOR_0("\"" .. v10:sub(0, v11 - 1):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1")) .. l_INVERTED_COLOR_0((v10:sub(v11, (v11 + v12) - 1):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1"))) .. l_RECEIVED_COLOR_0((v10:sub(v11 + v12, #v10):gsub("(\\)", "\\%1"):gsub("(\")", "\\%1"))) .. "\"";
end;
local function v16(v14, v15)
    if v15 == nil then
        return l_printReceived_0(v14);
    else
        return (v13(v14, v15.index, #v15[1]));
    end;
end;
local function v23(v17, v18)
    local v19 = {};
    for v20, v21 in ipairs(v17) do
        local v22 = l_stringify_0(v21);
        if v20 == v18 then
            v19[v20] = l_INVERTED_COLOR_0(v22);
        else
            v19[v20] = l_RECEIVED_COLOR_0(v22);
        end;
    end;
    return l_RECEIVED_COLOR_0("{") .. table.concat(v19, l_RECEIVED_COLOR_0(", ")) .. l_RECEIVED_COLOR_0("}");
end;
local function v30(v24, v25, v26, v27)
    local v28 = l_stringify_0(v24);
    local v29 = nil;
    if not v28:find("e") then
        v29 = if v26 >= 0 and v26 < 20 then string.format("%." .. v26 + 1 .. "f", v25) else l_stringify_0(v25);
    else
        v28 = v28:gsub("%+0", "+"):gsub("%-0", "-");
        v29 = l_Number_0.toExponential(v25, 0);
    end;
    if not v27 then
        return string.format("Expected precision:  %s  %s\n" .. "Expected difference: %s< %s\n" .. "Received difference: %s  %s", "", l_stringify_0(v26), "", l_EXPECTED_COLOR_0(v29), "", l_RECEIVED_COLOR_0(v28));
    else
        return string.format("Expected precision:  %s  %s\n" .. "Expected difference: %s< %s\n" .. "Received difference: %s  %s", "      ", l_stringify_0(v26), "never ", l_EXPECTED_COLOR_0(v29), "      ", l_RECEIVED_COLOR_0(v28));
    end;
end;
local function v33(v31, v32)
    return printConstructorName(v31, v32, false, true) .. "\n";
end;
local function v36(v34, v35)
    return printConstructorName(v34, v35, true, true) .. "\n";
end;
local function v39(v37, v38)
    return printConstructorName(v37, v38, false, false) .. "\n";
end;
local function v41(v40)
    if typeof(v40) == "table" then
        return tostring(v40):find("table: 0x") == nil;
    elseif typeof(v40) == "function" then
        return tostring(v40):find("function: 0x") == nil;
    elseif typeof(v40) == "userdata" then
        return tostring(v40):find("userdata: 0x") == nil;
    elseif typeof(v40) == "thread" then
        return tostring(v40):find("thread: 0x") == nil;
    else
        return true;
    end;
end;
local function v46(v42, v43, v44)
    local v45 = nil;
    if ((typeof((tostring(v44))) == "string" and #tostring(v44) ~= 0) and typeof((tostring(v43))) == "string") and #tostring(v43) ~= 0 then
        if not v41(v44) or not v41(v43) then
            return printConstructorName(v42, v43, true, false) .. "\n";
        else
            v45 = printConstructorName(v42, v43, true, false);
            return if not not getmetatable(v43) and getmetatable(v43).__index == v44 then v45 .. " extends " else v45 .. " extends \226\128\166 extends " .. l_EXPECTED_COLOR_0((tostring(v44))) .. "\n";
        end;
    else
        return printConstructorName(v42, v43, false, false) .. "\n";
    end;
end;
printConstructorName = function(v47, v48, v49, v50)
    local v51 = v47 .. ": ";
    v51 = if v49 then if v50 then v51 .. "never " else v51 .. "      " else v51 .. "";
    if not v41(v48) then
        local v52 = "{ ";
        local v53 = true;
        local v54 = false;
        for v55, v56 in pairs(v48) do
            local v57 = nil;
            if not v41(v55) or not v41(v56) then
                if v41(v55) and v55:find("__") ~= 1 then
                    v57 = string.format("%s, ", l_stringify_0(v55));
                end;
            else
                v57 = string.format("%s: %s, ", l_stringify_0(v55), l_stringify_0(v56));
            end;
            if v57 then
                if #v52 + #v57 > 64 then
                    v53 = false;
                    break;
                else
                    v54 = true;
                    v52 = v52 .. v57;
                end;
            end;
        end;
        if v54 == false then
            if not v50 then
                return v51 .. l_RECEIVED_COLOR_0((tostring(v48)));
            else
                return v51 .. l_EXPECTED_COLOR_0((tostring(v48)));
            end;
        else
            v52 = if not v53 then v52 .. "... }" else v52:sub(1, -3) .. " }";
            if not v50 then
                return v51 .. l_RECEIVED_COLOR_0(v52);
            else
                return v51 .. l_EXPECTED_COLOR_0(v52);
            end;
        end;
    elseif #tostring(v48) == 0 then
        return string.format("%s name is an empty string", v47);
    elseif not v50 then
        return v51 .. l_RECEIVED_COLOR_0((tostring(v48)));
    else
        return v51 .. l_EXPECTED_COLOR_0((tostring(v48)));
    end;
end;
return {
    printReceivedStringContainExpectedSubstring = v13, 
    printReceivedStringContainExpectedResult = v16, 
    printReceivedArrayContainExpectedItem = v23, 
    printCloseTo = v30, 
    printExpectedConstructorName = v33, 
    printExpectedConstructorNameNot = v36, 
    printReceivedConstructorName = v39, 
    printReceivedConstructorNameNot = v46
};
