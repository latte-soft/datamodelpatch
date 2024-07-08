local l_Error_0 = require(script.Parent.Parent.LuauPolyfill).Error;
return function()
    local l_status_0, l_result_0 = pcall(function()
        return _G.__MOCK_FILE_SYSTEM__ or game:GetService("FileSystemService");
    end);
    if not l_status_0 then
        error(l_Error_0.new("Attempting to save snapshots in an environment where FileSystemService is inaccessible."));
    end;
    return l_result_0;
end;
