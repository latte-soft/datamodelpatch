local l_Modules_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules");
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local l_LuaApp_0 = l_Modules_0:FindFirstChild("LuaApp");
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_Http_0 = require(l_Shell_0:FindFirstChild("Http"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v10 = require(l_LuaApp_0.Models.Authentication.Birthday);
local v11 = {
    AuthResults = {
        Error = -1, 
        Success = 0, 
        InProgress = 1, 
        AccountUnlinked = 2, 
        MissingGamePad = 3, 
        NoUserDetected = 4, 
        HttpErrorDetected = 5, 
        SignUpDisabled = 6, 
        Flooded = 7, 
        LeaseLocked = 8, 
        AccountLinkingDisabled = 9, 
        InvalidRobloxUser = 10, 
        RobloxUserAlreadyLinked = 11, 
        XboxUserAlreadyLinked = 12, 
        IllgealChildAccountLinking = 13, 
        InvalidPassword = 14, 
        UsernamePasswordNotSet = 15, 
        UsernameAlreadyTaken = 16, 
        SiteMaintenance = 19, 
        CodeInvalid = 22
    }, 
    InvalidUsernameReasons = {
        Valid = "Valid", 
        InvalidUsername = "Invalid Username", 
        AlreadyTaken = "Already Taken", 
        InvalidCharactersUsed = "Invalid Characters Used", 
        UsernameCannotContainSpaces = "Username Cannot Contain Spaces"
    }
};
local function _()
    return v11.AuthResults.Success;
end;
v11.LoginAsync = function(v13)
    if UserSettings().GameSettings:InStudioMode() or l_UserInputService_0:GetPlatform() == Enum.Platform.Windows then
        return v11.AuthResults.Success;
    else
        local l_status_0, l_result_0 = pcall(function()
            return v3:PerformLogin();
        end);
        if l_status_0 then
            local l_accountAuthResult_0 = l_result_0.accountAuthResult;
            if l_accountAuthResult_0 == v13.AuthResults.Success then
                l_Players_0:SetLocalPlayerInfo(l_result_0.userId, l_result_0.username, l_result_0.displayName, l_result_0.membershipType, l_result_0.isUnder13);
            end;
            return l_accountAuthResult_0;
        else
            return v13.AuthResults.Error;
        end;
    end;
end;
v11.SignupAsync = function(v17, v18, v19)
    local l_status_1, l_result_1 = pcall(function()
        return v3:BeginPlatformSignup(v18, v19);
    end);
    if not l_status_1 then
        l_result_1 = v17.AuthResults.Error;
    end;
    if l_result_1 == v17.AuthResults.Success then
        l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_New_Account_Success");
        l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Success");
    end;
    return l_result_1;
end;
v11.LinkAccountFirstStepAsync = function(v22, v23, v24)
    local l_status_2, l_result_2 = pcall(function()
        return v3:Perform2SVLinkAccount(v23, v24);
    end);
    if l_status_2 then
        if l_result_2.accountAuthResult == v22.AuthResults.Success then
            l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Account_Link_Success");
            l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Success");
        end;
        return l_result_2;
    else
        l_Utility_0.DebugLog("AccountManager:LinkAccountFirstStepAsync() failed: success = false");
        return {
            accountAuthResult = v11.AuthResults.Error
        };
    end;
end;
v11.CrossDeviceAccountLink = function(v27, v28, v29)
    local l_status_3, l_result_3 = pcall(function()
        return v3:PerformCrossDeviceAccountLink(v28, v29);
    end);
    if l_status_3 then
        if l_result_3 == v27.AuthResults.Success then
            l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Account_Link_Success");
            l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Success");
        end;
        return l_result_3;
    else
        l_Utility_0.DebugLog("AccountManager:CrossDeviceAccountLink() failed: success = false");
        return v27.AuthResults.Error;
    end;
end;
v11.VerifyAsync = function(v32, v33, v34, v35, v36)
    local l_status_4, l_result_4 = pcall(function()
        return v3:PerformVerify(v33, v34, v35, v36);
    end);
    if not l_status_4 then
        l_Utility_0.DebugLog("AccountManager:VerifyAsync() failed because ", l_result_4);
        l_result_4 = v11.AuthResults.Error;
    end;
    if l_result_4 == v32.AuthResults.Success then
        l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Verification_Success");
        l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Success");
    end;
    return l_result_4;
end;
v11.ResendAsync = function(v39, v40, v41)
    local l_status_5, l_result_5 = pcall(function()
        return v3:PerformResend(v40, v41);
    end);
    if not l_status_5 then
        l_Utility_0.DebugLog("AccountManager:ResendAsync() failed because ", l_result_5);
        l_result_5 = v11.AuthResults.Error;
    end;
    if l_result_5 == v39.AuthResults.Success then
        l_RbxAnalyticsService_0:ReportCounter("Xbox_SignUp_Resend_Success");
    end;
    return l_result_5;
end;
v11.SetRobloxCredentialsAsync = function(_, v45, v46)
    local l_status_6, l_result_6 = pcall(function()
        return v3:BeginSetRobloxCredentials(v45, v46);
    end);
    if not l_status_6 then
        l_Utility_0.DebugLog("AccountManager:SetRobloxCredentialsAsync() failed because", l_result_6);
        l_result_6 = v11.AuthResults.Error;
    end;
    return l_result_6;
end;
v11.UnlinkAccountAsync = function(_)
    local l_status_7, l_result_7 = pcall(function()
        return v3:BeginUnlinkAccount();
    end);
    if not l_status_7 then
        l_Utility_0.DebugLog("AccountManager:UnlinkAccountAsync() failed because", l_result_7);
        l_result_7 = v11.AuthResults.Error;
    end;
    return l_result_7;
end;
local v52 = false;
local function _()
    v52 = true;
    delay(15, function()
        v52 = false;
    end);
end;
v11.HasLinkedAccountAsync = function(_)
    if UserSettings().GameSettings:InStudioMode() or l_UserInputService_0:GetPlatform() == Enum.Platform.Windows then
        return v11.AuthResults.Success;
    elseif v52 == true then
        return v11.AuthResults.SiteMaintenance;
    else
        local l_status_8, l_result_8 = pcall(function()
            return v3:BeginHasLinkedAccount();
        end);
        if not l_status_8 then
            l_Utility_0.DebugLog("AccountManager:HasLinkedAccountAsync() failed because", l_result_8);
            l_result_8 = v11.AuthResults.Error;
        end;
        if l_result_8 == v11.AuthResults.SiteMaintenance then
            v52 = true;
            delay(15, function()
                v52 = false;
            end);
        end;
        return l_result_8;
    end;
end;
local function v58()
    if not l_ThirdPartyUserService_0:IsOver13() then
        local v57 = DateTime.now():ToUniversalTime();
        return v10.new({
            Month = v57.Month, 
            Day = v57.Day, 
            Year = v57.Year
        }):FormatForEndpoint();
    else
        return v10.new({
            Month = 1, 
            Day = 1, 
            Year = 1970
        }):FormatForEndpoint();
    end;
end;
v11.IsValidUsernameAsync = function(_, v60)
    local v61 = l_Http_0.IsValidUsername(v60, (v58()));
    if v61 then
        if v61.code and v61.code == 0 then
            return true;
        else
            return false, v61.message;
        end;
    else
        return nil;
    end;
end;
v11.IsValidPasswordAsync = function(_, v63, v64)
    local v65 = l_Http_0.IsValidPassword(v63, v64);
    if v65 then
        if v65.code and v65.code == 0 then
            return true;
        else
            return false, v65.message;
        end;
    else
        return nil;
    end;
end;
return v11;
