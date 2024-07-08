local v0 = require(script.Parent.createImageSetComponent);
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CorePackages");
local v3 = require(script.Parent.Parent.Parent.App.ImageSet.Images);
local l_status_0, l_result_0 = pcall(l_GuiService_0.GetResolutionScale, l_GuiService_0);
if not (l_status_0 and l_script_FirstAncestor_0) then
    l_result_0 = 1;
end;
l_result_0 = v3.ImagesResolutionScale;
return {
    Button = v0("ImageButton", l_result_0), 
    Label = v0("ImageLabel", l_result_0)
};
