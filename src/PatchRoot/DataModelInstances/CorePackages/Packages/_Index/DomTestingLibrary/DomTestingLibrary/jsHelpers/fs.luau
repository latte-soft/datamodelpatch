local l_Error_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Error;
local v1 = nil;
local function _()
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("FileSystemService");
    end);
    return not not l_status_0 and l_result_0 or nil;
end;
local function v10(v5)
    local v6 = v5:split("/");
    local v7 = table.concat(table.pack(table.unpack(v6, 1, #v6 - 1)), "/");
    local l_status_1, l_result_1 = pcall(function()
        if not v1:Exists(v7) then
            v1:CreateDirectories(v7);
        end;
    end);
    if not (l_status_1 or not l_result_1:find("Error%(13%): Access Denied%. Path is outside of sandbox%.")) then
        error("Provided path is invalid: you likely need to provide a different argument to --fs.read.\n" .. "You may need to pass in `--fs.read=$PWD`");
    end;
end;
return {
    readFileSync = function(v11)
        if v1 == nil then
            local l_status_2, l_result_2 = pcall(function()
                return game:GetService("FileSystemService");
            end);
            v1 = not not l_status_2 and l_result_2 or nil;
        end;
        if not v1 then
            error(l_Error_0.new("Attempting to read file in an environment where FileSystemService is inaccessible."));
        end;
        v10(v11);
        return v1:ReadFile(v11);
    end
};
