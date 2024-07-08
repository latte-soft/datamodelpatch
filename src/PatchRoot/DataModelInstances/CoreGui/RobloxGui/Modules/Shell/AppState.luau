local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(script.Parent.Reducers.AppShellReducer);
local v5 = require(l_Modules_0.AvatarExperience.Common.Managers.PageObjectManager);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.PaginatedFetchThunk);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.AvatarEditorServiceThunk);
local v8 = require(l_CorePackages_0.Rodux);
local v10 = {
    Destruct = function(v9)
        v9.store:destruct();
    end
};
local v11 = {
    v8.thunkMiddleware
};
local v12 = v5.new();
table.insert(v11, (v6.middleware(v12, l_AvatarEditorService_0)));
v10.pageObjectManager = v12;
table.insert(v11, (v7.middleware(l_AvatarEditorService_0)));
v10.store = v8.Store.new(v4, {}, v11, nil);
return v10;
