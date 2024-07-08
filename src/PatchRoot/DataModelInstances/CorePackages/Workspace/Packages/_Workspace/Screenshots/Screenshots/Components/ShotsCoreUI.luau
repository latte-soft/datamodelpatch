local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.Components.EntrypointButton);
local v6 = require(l_Parent_0.Components.ToastContainer);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
return function(_)
    return v2.createElement(v2.Fragment, {}, {
        EntrypointButtonFrame = if not l_useSelector_0(function(v9)
            return v9.Screenshots.IsCapturesCoreGuiEnabled;
        end) then nil else v2.createElement("Frame", {
            Active = false, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v4.ZIndex.Entrypoint
        }, {
            EntrypointButtonContainer = v2.createElement(v5)
        }), 
        ToastsFrame = if l_useSelector_0(function(v10)
            return v10.Screenshots.Carousel.IsOpen;
        end) then nil else v2.createElement("Frame", {
            Active = false, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v4.ZIndex.Toasts
        }, {
            ToastContainer = v2.createElement(v6)
        })
    });
end;
