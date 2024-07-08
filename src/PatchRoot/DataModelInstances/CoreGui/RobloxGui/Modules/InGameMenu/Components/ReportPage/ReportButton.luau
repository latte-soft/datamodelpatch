local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_t_0 = v0.t;
local l_UIBlox_0 = v0.UIBlox;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.GlobalConfig);
local v7 = require(l_Parent_0.Resources.Assets);
local v8 = require(l_Parent_0.Actions.OpenReportDialog);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v12 = l_t_0.strictInterface({
    userId = l_t_0.optional(l_t_0.integer), 
    userName = l_t_0.optional(l_t_0.string), 
    LayoutOrder = l_t_0.integer, 
    dispatchOpenReportDialog = l_t_0.callback
});
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v13)
    return {
        dispatchOpenReportDialog = function(v14, v15)
            v13(v8(v14, v15));
        end
    };
end)(function(v16)
    if v6.propValidation then
        assert(v12(v16));
    end;
    return l_withSelectionCursorProvider_0(function(v17)
        return l_Roact_0.createElement(l_ImageSetButton_0, {
            Selectable = false, 
            Image = v7.Images.ReportIcon, 
            Size = UDim2.new(0, 36, 0, 36), 
            ImageColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 1, 
            LayoutOrder = v16.LayoutOrder, 
            SelectionImageObject = v17(l_CursorKind_0.RoundedRectNoInset), 
            [l_Roact_0.Event.Activated] = function()
                v16.dispatchOpenReportDialog(v16.userId, v16.userName);
            end
        });
    end);
end);
