local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Server.ServerUtil);
return function()
    if game:GetService("StarterPlayer"):FindFirstChild("PlayerSettings") == nil then
        local l_ModuleScript_0 = Instance.new("ModuleScript");
        l_ModuleScript_0.Name = "PlayerSettings";
        if not v0.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_0.Source = script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings").Source;
        else
            l_ModuleScript_0.Source = v0.getSourceForServerScript(script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings"));
        end;
        l_ModuleScript_0.Parent = game:GetService("StarterPlayer");
        l_ModuleScript_0.Archivable = false;
    end;
end;
