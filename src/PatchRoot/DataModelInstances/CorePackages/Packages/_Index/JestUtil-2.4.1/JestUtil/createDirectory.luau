local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = {};
local v3 = require(l_Parent_0.getFileSystemService);
local _ = require(l_Parent_1.JestTypes);
v2.default = function(v5)
    local v6 = v3();
    local v7, v8, v9 = pcall(function()
        v6:CreateDirectories(v5);
    end);
    if not v7 then
        if v8:find("Error%(13%): Access Denied%. Path is outside of sandbox%.") then
            error("Provided path is invalid: you likely need to provide a different argument to --fs.readwrite.\n" .. "You may need to pass in `--fs.readwrite=$PWD`");
        end;
        if v8.code ~= "EEXIST" then
            error(v8);
        end;
    end;
    if not v9 then
        return ;
    else
        return v8;
    end;
end;
return v2;
