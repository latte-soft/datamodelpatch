local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.ReactRoblox);
local v5 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local l_InExperienceAppChat_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).App.InExperienceAppChat;
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "AppChat";
l_ScreenGui_0.Parent = l_CoreGui_0;
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.IgnoreGuiInset = true;
l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
l_ScreenGui_0.DisplayOrder = 7;
v4.createRoot(l_ScreenGui_0):render(v3.createElement(l_InExperienceAppChat_0, {
    apolloClient = v5
}));
