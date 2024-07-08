local v0 = game:DefineFastFlag("AllowLuobuFreecamGroup", false);
local v1 = {
    4358041
};
local v2 = {
    7842878
};
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_PolicyService_0 = game:GetService("PolicyService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_0.Modules.Common.Url);
local v10 = require(l_RobloxGui_0.Modules.Server.ServerUtil);
return function()
    local function v14(v11, v12)
        local l_v11_FirstChildOfClass_0 = v11:FindFirstChildOfClass(v12);
        while not l_v11_FirstChildOfClass_0 or l_v11_FirstChildOfClass_0.ClassName ~= v12 do
            l_v11_FirstChildOfClass_0 = v11.ChildAdded:Wait();
        end;
        return l_v11_FirstChildOfClass_0;
    end;
    local function v20(v15)
        local v16 = v14(v15, "PlayerGui");
        local l_FreeCamera_0 = script.Parent:WaitForChild("FreeCamera");
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "Freecam";
        l_ScreenGui_0.ResetOnSpawn = false;
        local l_LocalScript_0 = Instance.new("LocalScript");
        l_LocalScript_0.Name = "FreecamScript";
        if not v10.getFFlagServerCoreScriptSourceCode() then
            l_LocalScript_0.Source = l_FreeCamera_0.Source;
        else
            l_LocalScript_0.Source = v10.getSourceForServerScript(l_FreeCamera_0);
        end;
        l_LocalScript_0.Parent = l_ScreenGui_0;
        l_ScreenGui_0.Parent = v16;
    end;
    local function v32(v21)
        if not l_RunService_0:IsStudio() then
            if v21.UserId <= 0 then
                return false;
            else
                local l_status_0, l_result_0 = pcall(function()
                    return l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:PostAsyncFullUrl(string.format(v9.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions"), (l_HttpService_0:JSONEncode({
                        requests = {
                            {
                                subject = {
                                    subjectType = "User", 
                                    subjectId = v21.UserId
                                }, 
                                action = "Edit", 
                                assetId = game.PlaceId
                            }
                        }
                    })))));
                end);
                if l_status_0 then
                    l_result_0 = l_result_0.results[1];
                    if l_result_0.value and l_result_0.value.status == "HasPermission" then
                        return true;
                    end;
                end;
                for _, v25 in ipairs(v1) do
                    local l_status_1, l_result_1 = pcall(v21.IsInGroup, v21, v25);
                    if not (not l_status_1 or not l_result_1) then
                        return true;
                    end;
                end;
                if not (not v0 or not game:GetEngineFeature("LuobuModerationStatus")) and l_PolicyService_0.IsLuobuServer == Enum.TriStateBoolean.True then
                    for _, v29 in ipairs(v2) do
                        local l_status_2, l_result_2 = pcall(v21.IsInGroup, v21, v29);
                        if not (not l_status_2 or not l_result_2) then
                            return true;
                        end;
                    end;
                end;
                return false;
            end;
        else
            return true;
        end;
    end;
    local function v34(v33)
        if v32(v33) then
            v20(v33);
        end;
    end;
    l_Players_0.PlayerAdded:Connect(v34);
    for _, v36 in ipairs(l_Players_0:GetPlayers()) do
        coroutine.wrap(v34)(v36);
    end;
end;
