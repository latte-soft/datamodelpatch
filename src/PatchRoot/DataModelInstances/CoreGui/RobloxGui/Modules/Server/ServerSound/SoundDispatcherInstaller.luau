local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local v2 = require(script.Parent.Parent.ServerUtil);
local function _()
    if not l_ServerScriptService_0:FindFirstChild("SoundDispatcher") then
        local l_StarterCharacterScripts_0 = l_StarterPlayer_0:FindFirstChildOfClass("StarterCharacterScripts");
        if not l_StarterCharacterScripts_0 or not l_StarterCharacterScripts_0:FindFirstChild("Sound") then
            return false;
        else
            return true;
        end;
    else
        return true;
    end;
end;
local function v9(v5, v6)
    local v7 = script.Parent:WaitForChild(v5);
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Name = v5;
    if not v2.getFFlagServerCoreScriptSourceCode() then
        l_Script_0.Source = v7.Source;
    else
        l_Script_0.Source = v2.getSourceForServerScript(v7);
    end;
    l_Script_0.Parent = v6;
    return l_Script_0;
end;
return function()
    local v10;
    if not l_ServerScriptService_0:FindFirstChild("SoundDispatcher") then
        local l_StarterCharacterScripts_1 = l_StarterPlayer_0:FindFirstChildOfClass("StarterCharacterScripts");
        v10 = not not l_StarterCharacterScripts_1 and (l_StarterCharacterScripts_1:FindFirstChild("Sound") and true or false);
    else
        v10 = true;
    end;
    if v10 then
        v10 = true;
        local l_SoundDispatcher_0 = l_ServerScriptService_0:FindFirstChild("SoundDispatcher");
        if not l_SoundDispatcher_0 then
            v10 = false;
            l_SoundDispatcher_0 = v9("SoundDispatcher", l_ServerScriptService_0);
        end;
        if not l_ServerScriptService_0:FindFirstChild("SoundDispatcher") then
            local v13 = l_SoundDispatcher_0:Clone();
            v13.Archivable = false;
            v13.Parent = l_ServerScriptService_0;
        end;
        l_SoundDispatcher_0.Archivable = v10;
        return ;
    else
        return ;
    end;
end;
