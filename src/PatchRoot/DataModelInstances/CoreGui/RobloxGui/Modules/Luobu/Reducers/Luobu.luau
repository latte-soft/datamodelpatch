local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(game:GetService("CorePackages").Rodux).combineReducers({
    TencentAuthInfo = require(l_Modules_0.Luobu.Reducers.TencentAuthInfo), 
    TencentNotice = require(l_Modules_0.Luobu.Reducers.TencentNotice), 
    TencentNoticeReadStatus = require(l_Modules_0.Luobu.Reducers.TencentNoticeReadStatus), 
    MSDKAuth = require(l_Modules_0.Luobu.Reducers.MSDKAuth), 
    SignUp = require(l_Modules_0.Luobu.Reducers.SignUp)
});
