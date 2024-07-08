local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Logging);
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.Packages.t);
local _ = require(l_CorePackages_0.UIBlox).App.Button.TextButton;
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Actions.EndReportFlow);
local _ = require(l_Parent_0.Resources.Constants);
local v9 = require(l_Parent_0.Flags.GetFFlagReportAnythingDebugCanvas);
local v10 = v2.PureComponent:extend("DebugCanvas");
v10.render = function(v11)
    if v9() and v11.props.identifiedAvatars then
        local v12 = {};
        for _, v14 in pairs(v11.props.identifiedAvatars) do
            local l_boundingBox_0 = v14.boundingBox;
            v12[#v12 + 1] = v2.createElement("Frame", {
                Position = UDim2.fromScale(l_boundingBox_0.min.X, l_boundingBox_0.min.Y), 
                Size = UDim2.fromScale(l_boundingBox_0.max.X - l_boundingBox_0.min.X, l_boundingBox_0.max.Y - l_boundingBox_0.min.Y), 
                BackgroundTransparency = 0.8, 
                BackgroundColor3 = Color3.fromRGB(20, 0, 255 * v14.hitRate)
            });
            local v16 = #v14.convexHull;
            for v17, v18 in v14.convexHull, nil, nil do
                v12[#v12 + 1] = v2.createElement("Frame", {
                    Position = UDim2.new(v18.X, -2, v18.Y, -2), 
                    Size = UDim2.fromOffset(4, 4), 
                    BackgroundTransparency = 0.2, 
                    BackgroundColor3 = Color3.fromHSV(v17 / v16, 1, 0.65)
                });
            end;
        end;
        for _, v20 in pairs(v11.props.identifiedAds) do
            local l_boundingBox_1 = v20.boundingBox;
            v12[#v12 + 1] = v2.createElement("Frame", {
                Position = UDim2.fromScale(l_boundingBox_1.min.X, l_boundingBox_1.min.Y), 
                Size = UDim2.fromScale(l_boundingBox_1.max.X - l_boundingBox_1.min.X, l_boundingBox_1.max.Y - l_boundingBox_1.min.Y), 
                BackgroundTransparency = 0.8, 
                BackgroundColor3 = Color3.fromRGB(20, 0, 255)
            });
            for _, v23 in v20.visibleRegions, nil, nil do
                local v24 = #v23.convexHull;
                for v25, v26 in v23.convexHull, nil, nil do
                    v12[#v12 + 1] = v2.createElement("Frame", {
                        Position = UDim2.new(v26.X, -2, v26.Y, -2), 
                        Size = UDim2.fromOffset(4, 4), 
                        BackgroundTransparency = 0.2, 
                        BackgroundColor3 = Color3.fromHSV(v25 / v24, 1, 0.65)
                    });
                end;
            end;
        end;
        return v2.createElement("Frame", {
            BackgroundTransparency = 0.9, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v11.props.ZIndex
        }, v12);
    else
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(0, 0)
        });
    end;
end;
return v10;
