local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local v1 = require(l_Shell_0.Http);
local v2 = require(l_Shell_0.Utility);
game:DefineFastInt("XboxCrossDeviceLoginPollDelay", 6);
return function()
    local v3 = {};
    local l_game_FastInt_0 = game:GetFastInt("XboxCrossDeviceLoginPollDelay");
    v3.CrossDeviceLoginStatus = {
        Created = "Created", 
        UserLinked = "UserLinked", 
        Validated = "Validated", 
        Expired = "Expired", 
        Cancelled = "Cancelled"
    };
    local v5 = "";
    local v6 = "";
    local v7 = nil;
    local l_Cancelled_0 = v3.CrossDeviceLoginStatus.Cancelled;
    local v9 = "";
    v3.CrossDeviceLoginStatusChanged = v2.Signal();
    local function _()
        return v7.UnixTimestamp < DateTime.now().UnixTimestamp;
    end;
    local function _()
        spawn(function()
            while true do
                if not (v7.UnixTimestamp < DateTime.now().UnixTimestamp) then
                    if l_Cancelled_0 == v3.CrossDeviceLoginStatus.Cancelled then
                        v3.CrossDeviceLoginStatusChanged:fire(l_Cancelled_0);
                        return ;
                    else
                        local v11 = v1.CheckCrossDeviceLoginStatus(v5, v6);
                        l_Cancelled_0 = v3.CrossDeviceLoginStatus[v11.status];
                        v9 = v11.accountName;
                        v3.CrossDeviceLoginStatusChanged:fire(l_Cancelled_0);
                        if l_Cancelled_0 ~= v3.CrossDeviceLoginStatus.Validated then
                            wait(l_game_FastInt_0);
                        else
                            return ;
                        end;
                    end;
                else
                    l_Cancelled_0 = v3.CrossDeviceLoginStatus.Expired;
                    v3.CrossDeviceLoginStatusChanged:fire(l_Cancelled_0);
                    return ;
                end;
            end;
        end);
    end;
    v3.StartCrossDeviceLogin = function(_)
        local v14 = v1.CreateCrossDeviceLoginCode();
        if v14 then
            v5 = v14.code;
            v6 = v14.privateKey;
            v7 = DateTime.fromIsoDate(v14.expirationTime);
            l_Cancelled_0 = v3.CrossDeviceLoginStatus.Created;
            v3.CrossDeviceLoginStatusChanged:fire(l_Cancelled_0);
            spawn(function()
                while true do
                    if not (v7.UnixTimestamp < DateTime.now().UnixTimestamp) then
                        if l_Cancelled_0 == v3.CrossDeviceLoginStatus.Cancelled then
                            v3.CrossDeviceLoginStatusChanged:fire(l_Cancelled_0);
                            return ;
                        else
                            local v15 = v1.CheckCrossDeviceLoginStatus(v5, v6);
                            l_Cancelled_0 = v3.CrossDeviceLoginStatus[v15.status];
                            v9 = v15.accountName;
                            v3.CrossDeviceLoginStatusChanged:fire(l_Cancelled_0);
                            if l_Cancelled_0 ~= v3.CrossDeviceLoginStatus.Validated then
                                wait(l_game_FastInt_0);
                            else
                                return ;
                            end;
                        end;
                    else
                        l_Cancelled_0 = v3.CrossDeviceLoginStatus.Expired;
                        v3.CrossDeviceLoginStatusChanged:fire(l_Cancelled_0);
                        return ;
                    end;
                end;
            end);
            return ;
        else
            l_Cancelled_0 = v3.CrossDeviceLoginStatus.Cancelled;
            v3.CrossDeviceLoginStatusChanged:fire(l_Cancelled_0);
            return ;
        end;
    end;
    v3.GetCode = function(_)
        return v5;
    end;
    v3.GetPrivateKey = function(_)
        return v6;
    end;
    v3.GetAccountName = function(_)
        return v9;
    end;
    v3.CancelCrossDeviceLogin = function(_)
        l_Cancelled_0 = v3.CrossDeviceLoginStatus.Cancelled;
        spawn(function()
            v1.CancelCrossDeviceLogin(v5);
        end);
    end;
    return v3;
end;
