local l_Parent_0 = script.Parent;
local l_try_0 = require(l_Parent_0.Parent.SharedUtils).try;
local v2 = require(l_Parent_0.tryGetService);
local _ = require(l_Parent_0.Location);
local v4 = require(l_Parent_0.PathUtils);
local l_SEPARATOR_0 = v4.SEPARATOR;
local v6 = {};
local v7 = {
    __index = v6
};
v6.new = function(v8)
    return (setmetatable({
        _location = v8, 
        _fileSystemService = v2("FileSystemService"), 
        _fileSyncService = v2("FileSyncService"), 
        _warn = warn
    }, v7));
end;
v6.write = function(v9, v10)
    if not v9._fileSystemService then
        local v11 = "Attempting to write file in an environment where FileSystemService is " .. "inaccessible.\n\n" .. "Instead, the file content has been written to a ModuleScript instance in the DataModel. ";
        if not v9._fileSyncService then
            v9._warn(" " .. v11 .. "Since FileSyncService is not available, the new ModuleScript will only live " .. "in the current DataModel");
        else
            v9._warn(v11 .. "Since FileSyncService is available, the new ModuleScript should sync back " .. "to the file system.");
        end;
        v9._location:getOrCreateInstance("ModuleScript").Source = v10;
        return ;
    else
        local v12 = v9._location:resolvePath();
        assert(v12:sub(-1) ~= l_SEPARATOR_0, ("File location `%s` cannot end with `%s`"):format(v12, l_SEPARATOR_0));
        v9:_ensureParentDirectoryExists(v12);
        v9._fileSystemService:WriteFile(v12, v10);
        return ;
    end;
end;
v6._ensureParentDirectoryExists = function(v13, v14)
    local v15 = v4.parent(v14);
    if v15 == nil then
        return ;
    else
        local v17, v18 = l_try_0(function()
            local l__fileSystemService_0 = v13._fileSystemService;
            if not l__fileSystemService_0:Exists(v15) then
                l__fileSystemService_0:CreateDirectories(v15);
            end;
        end);
        if not v17 then
            if string.find(v18.message, "Error(13): Access Denied. Path is outside of sandbox.", 1, true) then
                v18.message = "Access Denied. Path is outside of sandbox: " .. v14 .. "\n\nProvided file system path is invalid: you likely need to provide a different" .. " argument to --fs.readwrite.\nYou may need to pass in `--fs.readwrite=$PWD`";
            end;
            error(v18);
            return ;
        else
            return ;
        end;
    end;
end;
return v6;
