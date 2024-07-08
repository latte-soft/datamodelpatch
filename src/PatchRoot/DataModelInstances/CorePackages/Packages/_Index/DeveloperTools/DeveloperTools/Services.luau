local v1 = {
    isRunningUnderCLI = function()
        local l_RunningUnderCLI_0 = script.Parent:FindFirstChild("RunningUnderCLI");
        return not not l_RunningUnderCLI_0 and (l_RunningUnderCLI_0.Value or false);
    end
};
v1.getStudioService = function()
    return not not v1.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("StudioService");
end;
v1.getCoreGui = function()
    return not not v1.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("CoreGui");
end;
v1.getRobloxPluginGuiService = function()
    return not not v1.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("RobloxPluginGuiService");
end;
return v1;
