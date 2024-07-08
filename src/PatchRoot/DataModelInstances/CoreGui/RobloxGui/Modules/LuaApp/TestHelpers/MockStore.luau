local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.AvatarEditorServiceThunk);
local v3 = require(l_Modules_0.LuaApp.TestHelpers.MockAvatarEditorService);
local v4 = require(l_Modules_0.LuaApp.TestHelpers.makeMockThunkMiddleware);
local v5 = require(script.Parent.StoreWrapper);
return {
    new = function(v6, v7)
        if v7 == nil then
            v7 = {};
        end;
        return v5.new(v6, (v1.List.join(v7, {
            v4(), 
            (v2.middleware(v3.new()))
        })));
    end
};
