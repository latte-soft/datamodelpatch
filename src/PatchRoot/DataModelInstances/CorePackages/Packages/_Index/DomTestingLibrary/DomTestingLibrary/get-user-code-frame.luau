local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local v5 = require(l_Parent_0.Chalk);
local v6 = require(script.Parent.jsHelpers.fs);
local l_codeFrameColumns_0 = require(script.Parent.jsHelpers["babel-code-frame"]).codeFrameColumns;
local function v18(v8)
    local v9, v10 = string.find(v8, "%s+");
    local v11 = if v9 then v10 + 1 else 1;
    local v12 = string.sub(v8, v11, (string.find(v8:sub(v11), " ") or #v8 + 1) - 1);
    local v13 = v12:split(":");
    local v14 = v13[1];
    local v15 = tonumber(v13[2], 10);
    local v16 = tonumber(v13[3], 10);
    local v17 = "";
    if pcall(function()
        v17 = v6.readFileSync(v14);
    end) then
        return ("%s\n%s\n"):format(v5.dim(v12), (l_codeFrameColumns_0(v17, {
            start = {
                line = v15, 
                column = v16
            }
        }, {
            highlightCode = true, 
            linesBelow = 0
        })));
    else
        return "";
    end;
end;
v4.getUserCodeFrame = function()
    if v6.readFileSync and l_Boolean_0.toJSBoolean(l_codeFrameColumns_0) then
        return v18((l_Array_0.find(l_Array_0.slice((v1.Error.new().stack or ""):split("\n"), 2), function(v19)
            return not v19:find("Packages%._Index");
        end)));
    else
        return "";
    end;
end;
return v4;
