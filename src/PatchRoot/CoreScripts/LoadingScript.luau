local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_PlaceId_0 = game.PlaceId;
local v3 = select("#", ...);
if l_PlaceId_0 <= 0 and v3 > 0 then
    l_PlaceId_0 = select(1, ...);
end;
coroutine.wrap(require(l_CorePackages_0.Workspace.Packages.ExperienceLoadingScript).loadingScript)(l_PlaceId_0, 72);
