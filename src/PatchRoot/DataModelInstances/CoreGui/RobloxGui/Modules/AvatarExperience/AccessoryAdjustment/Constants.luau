local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.Constants);
return {
    AdjustmentLimits = {
        [v2.AssetTypeIdStrings.Hat] = {
            Position = {
                AttachmentPoint = {
                    xMin = 1.5, 
                    xMax = 1.5, 
                    yMin = 2, 
                    yMax = 2, 
                    zMin = 1.5, 
                    zMax = 1.5
                }, 
                DefaultPosition = v1.None
            }, 
            Rotation = v1.None, 
            Scale = {
                min = 0.5, 
                max = 1.5
            }
        }, 
        [v2.AssetTypeIdStrings.FaceAccessory] = {
            Position = {
                AttachmentPoint = {
                    xMin = 1.5, 
                    xMax = 1.5, 
                    yMin = 1, 
                    yMax = 1, 
                    zMin = 1, 
                    zMax = 1
                }, 
                DefaultPosition = v1.None
            }, 
            Rotation = v1.None, 
            Scale = {
                min = 0.5, 
                max = 1.5
            }
        }, 
        [v2.AssetTypeIdStrings.BackAccessory] = {
            Position = {
                AttachmentPoint = {
                    xMin = 5, 
                    xMax = 5, 
                    yMin = 3.5, 
                    yMax = 3.5, 
                    zMin = 3, 
                    zMax = 1.5
                }, 
                DefaultPosition = {
                    xMin = 5, 
                    xMax = 5, 
                    yMin = 3.5, 
                    yMax = 3.5, 
                    zMin = 3, 
                    zMax = 0.5
                }
            }, 
            Rotation = {
                min = -30, 
                max = 30
            }, 
            Scale = {
                min = 0.8, 
                max = 1.2
            }
        }, 
        [v2.AssetTypeIdStrings.ShoulderAccessory] = {
            Position = {
                AttachmentPoint = {
                    xMin = 1.5, 
                    xMax = 1.5, 
                    yMin = 1.5, 
                    yMax = 1.5, 
                    zMin = 1.5, 
                    zMax = 1.5
                }, 
                DefaultPosition = v1.None
            }, 
            Rotation = {
                min = -90, 
                max = 90
            }, 
            Scale = {
                min = 0.5, 
                max = 1.5
            }
        }, 
        [v2.AssetTypeIdStrings.NeckAccessory] = {
            Position = {
                AttachmentPoint = {
                    xMin = 1.5, 
                    xMax = 1.5, 
                    yMin = 1.5, 
                    yMax = 1.5, 
                    zMin = 1, 
                    zMax = 1
                }, 
                DefaultPosition = v1.None
            }, 
            Rotation = v1.None, 
            Scale = {
                min = 0.5, 
                max = 1.5
            }
        }, 
        [v2.AssetTypeIdStrings.WaistAccessory] = {
            Position = {
                AttachmentPoint = {
                    xMin = 2, 
                    xMax = 2, 
                    yMin = 2, 
                    yMax = 1.5, 
                    zMin = 3.5, 
                    zMax = 3.5
                }, 
                DefaultPosition = {
                    xMin = 0.5, 
                    xMax = 0.5, 
                    yMin = 0.25, 
                    yMax = 0.25, 
                    zMin = 1, 
                    zMax = 1
                }
            }, 
            Rotation = {
                min = -60, 
                max = 60
            }, 
            Scale = {
                min = 0.8, 
                max = 1.2
            }
        }, 
        [v2.AssetTypeIdStrings.FrontAccessory] = {
            Position = {
                AttachmentPoint = {
                    xMin = 1.5, 
                    xMax = 1.5, 
                    yMin = 1.5, 
                    yMax = 1.5, 
                    zMin = 1.5, 
                    zMax = 1.5
                }, 
                DefaultPosition = {
                    xMin = 0.5, 
                    xMax = 0.5, 
                    yMin = 0.5, 
                    yMax = 0.5, 
                    zMin = 0.5, 
                    zMax = 0.5
                }
            }, 
            Rotation = {
                min = -60, 
                max = 60
            }, 
            Scale = {
                min = 0.8, 
                max = 1.2
            }
        }
    }
};
