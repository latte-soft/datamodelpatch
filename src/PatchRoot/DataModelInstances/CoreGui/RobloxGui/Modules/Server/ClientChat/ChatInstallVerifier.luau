local l_Players_0 = game:GetService("Players");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local function v5(v2, v3)
    local l_v2_FirstChildOfClass_0 = v2:FindFirstChildOfClass(v3);
    while not l_v2_FirstChildOfClass_0 or l_v2_FirstChildOfClass_0.ClassName ~= v3 do
        l_v2_FirstChildOfClass_0 = v2.ChildAdded:Wait();
    end;
    return l_v2_FirstChildOfClass_0;
end;
local v6 = v5(l_Players_0.LocalPlayer, "PlayerScripts");
local v7 = v5(l_StarterPlayer_0, "StarterPlayerScripts");
VerifyScriptExistence = function()
    local l_Value_0 = script:WaitForChild("ScriptToVerify").Value;
    if not v6:FindFirstChild(l_Value_0) then
        local l_v7_FirstChild_0 = v7:FindFirstChild(l_Value_0);
        if l_v7_FirstChild_0 then
            local l_Archivable_0 = l_v7_FirstChild_0.Archivable;
            l_v7_FirstChild_0.Archivable = true;
            l_v7_FirstChild_0:Clone().Parent = v6;
            l_v7_FirstChild_0.Archivable = l_Archivable_0;
        end;
    end;
end;
VerifyScriptExistence();
script:Destroy();
