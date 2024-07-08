local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Toast_0 = v3.App.Dialog.Toast;
local l_Images_0 = v3.App.ImageSet.Images;
local v7 = v1.PureComponent:extend("Toast");
v7.validateProps = v4.strictInterface({
    toastTitle = v4.optional(v4.string), 
    toastSubtitle = v4.optional(v4.string)
});
v7.render = function(v8)
    if v8.props.toastTitle then
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 100
        }, {
            Toast = v1.createElement(l_Toast_0, {
                duration = 3, 
                toastContent = {
                    iconImage = l_Images_0["icons/status/success"], 
                    toastTitle = v8.props.toastTitle, 
                    toastSubtitle = v8.props.toastSubtitle
                }
            })
        });
    else
        return nil;
    end;
end;
return v2.UNSTABLE_connect2(function(v9, _)
    return {
        toastTitle = v9.common.toastTitle, 
        toastSubtitle = v9.common.toastSubtitle
    };
end, nil)(v7);
