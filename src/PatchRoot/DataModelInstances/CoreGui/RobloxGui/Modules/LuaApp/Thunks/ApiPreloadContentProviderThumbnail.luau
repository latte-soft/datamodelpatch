local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.mutedError);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(game:GetService("CorePackages").Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
return function(v6, v7, v8)
    return function(_)
        local v10 = {};
        for _, v12 in ipairs(v6) do
            table.insert(v10, (l_getRbxthumbWithTypeSizeAndOptions_0(v12, v7, v8)));
        end;
        return v4.new(function(v13, _)
            task.spawn(function()
                if not pcall(function()
                    l_ContentProvider_0:PreloadAsync(v10);
                end) then
                    v3("Could not preload content provider thumbnails");
                end;
                v13();
            end);
        end);
    end;
end;
