local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
return require(l_CorePackages_0.Rodux).createReducer({}, {
    [require(l_Modules_0.Luobu.Actions.ReadTencentNoticeId).name] = function(v3, v4)
        return v2.Dictionary.join(v3, {
            [v4.noticeId] = true
        });
    end
});
