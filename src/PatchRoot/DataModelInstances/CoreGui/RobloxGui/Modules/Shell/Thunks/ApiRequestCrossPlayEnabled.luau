local l_Shell_0 = game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("Shell");
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_SafeAsyncRodux_0 = require(l_Shell_0:FindFirstChild("SafeAsyncRodux"));
local v3 = require(l_Shell_0.Actions.RequestCrossPlayEnabled);
local v4 = require(l_Shell_0.Actions.SetCrossPlayEnabled);
local v5 = require(l_Shell_0.Actions.GetCrossPlayEnabledFailed);
local v6 = require(l_Shell_0.Actions.PostCrossPlayEnabledFailed);
local v7 = require(l_Shell_0.Actions.AddError);
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local v13 = l_SafeAsyncRodux_0({
    asyncFunc = function(_)
        local v10 = l_Http_0.GetCrossplayEnabledStatusAsync();
        if v10 ~= nil then
            return v10.xboxCrossPlaySetting.isEnabled;
        else
            return ;
        end;
    end, 
    callback = function(v11, v12)
        if v12 ~= nil then
            v11:dispatch(v4(v12, tick()));
            return ;
        else
            v11:dispatch(v5());
            v11:dispatch(v7(l_Errors_0.CPPSettingError.SetCPPSettingError, tick()));
            return ;
        end;
    end, 
    userRelated = true
});
local v18 = l_SafeAsyncRodux_0({
    asyncFunc = function(_, v15)
        if not l_Http_0.PostCrossplayStatusAsync(v15) then
            return ;
        else
            return v15;
        end;
    end, 
    callback = function(v16, v17)
        if v17 ~= nil then
            v16:dispatch(v4(v17, tick()));
            return ;
        else
            v16:dispatch(v6());
            return ;
        end;
    end, 
    userRelated = true
});
return function(v19)
    return function(v20)
        local l_CrossPlayEnabledState_0 = v20:getState().CrossPlayEnabledState;
        local l_isRequesting_0 = l_CrossPlayEnabledState_0.isRequesting;
        if v19 == "GET" then
            if not l_isRequesting_0 then
                v20:dispatch(v3());
                spawn(function()
                    v13(v20);
                end);
                return ;
            end;
        elseif v19 == "POST" then
            local l_enabled_0 = l_CrossPlayEnabledState_0.enabled;
            if not l_isRequesting_0 and l_enabled_0 ~= nil then
                v20:dispatch(v3());
                local v24 = not l_enabled_0;
                spawn(function()
                    v18(v20, v24);
                end);
            end;
        end;
    end;
end;
