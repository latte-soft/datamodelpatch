local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.flags.getFIntMeshDivision);
local v3 = require(l_Parent_0.flags.getFIntMeshDivisionFull);
local v4 = require(l_Parent_0.flags.getFIntMeshDivisionFullExtended);
local v5 = require(l_Parent_0.flags.getFIntMeshDivisionMedium);
local v6 = require(l_Parent_0.flags.getFIntMeshDivisionNarrow);
local v7 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v8 = require(l_Parent_0.flags.getFFlagAddUGCValidationForPackage);
local v9 = require(l_Parent_0.flags.getFFlagUGCValidationAdjustLegBounds);
local v10 = require(l_Parent_0.flags.getFFlagUGCValidateSurfaceAppearanceAlphaMode);
local v11 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateRestrictAttachmentPositions);
local _ = function(v13)
    local v14 = {};
    for _, v16 in pairs(v13) do
        v14[v16] = true;
    end;
    return v14;
end;
local v18 = {
    MAX_HAT_TRIANGLES = 4000, 
    MAX_TEXTURE_SIZE = 1024
};
local v19 = {
    Enum.Material.Plastic
};
local v20 = {};
for _, v22 in pairs(v19) do
    v20[v22] = true;
end;
v18.MATERIAL_WHITELIST = v20;
v18.BANNED_CLASS_NAMES = {
    "Script", 
    "LocalScript", 
    "ModuleScript", 
    "ParticleEmitter", 
    "Fire", 
    "Smoke", 
    "Sparkles"
};
v18.R6_BODY_PARTS = {
    "Torso", 
    "Left Leg", 
    "Right Leg", 
    "Left Arm", 
    "Right Arm"
};
v18.R15_BODY_PARTS = {
    "UpperTorso", 
    "LowerTorso", 
    "LeftUpperLeg", 
    "LeftLowerLeg", 
    "LeftFoot", 
    "RightUpperLeg", 
    "RightLowerLeg", 
    "RightFoot", 
    "LeftUpperArm", 
    "LeftLowerArm", 
    "LeftHand", 
    "RightUpperArm", 
    "RightLowerArm", 
    "RightHand"
};
v18.UGC_BODY_PARTS = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "LeftUpperLeg", 
    "LeftLowerLeg", 
    "LeftHand", 
    "RightUpperArm", 
    "RightLowerArm", 
    "RightHand", 
    "LeftUpperArm", 
    "LeftLowerArm", 
    "LeftFoot", 
    "RightUpperLeg", 
    "RightLowerLeg", 
    "RightFoot", 
    "EyebrowAccessory", 
    "EyelashAccessory", 
    "HairAccessory"
};
v18.UGC_BODY_PART_NAMES_TO_ASSET_TYPE = {
    Head = Enum.AssetType.DynamicHead, 
    UpperTorso = Enum.AssetType.Torso, 
    LowerTorso = Enum.AssetType.Torso, 
    LeftUpperArm = Enum.AssetType.LeftArm, 
    LeftLowerArm = Enum.AssetType.LeftArm, 
    LeftHand = Enum.AssetType.LeftArm, 
    RightUpperArm = Enum.AssetType.RightArm, 
    RightLowerArm = Enum.AssetType.RightArm, 
    RightHand = Enum.AssetType.RightArm, 
    LeftUpperLeg = Enum.AssetType.LeftLeg, 
    LeftLowerLeg = Enum.AssetType.LeftLeg, 
    LeftFoot = Enum.AssetType.LeftLeg, 
    RightUpperLeg = Enum.AssetType.RightLeg, 
    RightLowerLeg = Enum.AssetType.RightLeg, 
    RightFoot = Enum.AssetType.RightLeg, 
    EyebrowAccessory = Enum.AssetType.EyebrowAccessory, 
    EyelashAccessory = Enum.AssetType.EyelashAccessory, 
    HairAccessory = Enum.AssetType.HairAccessory
};
v18.ASSET_TYPES_THAT_SKIP_FOLDER = {
    Enum.AssetType.DynamicHead, 
    Enum.AssetType.EyebrowAccessory, 
    Enum.AssetType.EyelashAccessory, 
    Enum.AssetType.HairAccessory
};
v18.FOLDER_NAMES = {
    R6 = "R6", 
    R15ArtistIntent = "R15ArtistIntent", 
    R15Fixed = "R15Fixed"
};
v18.EXTRA_BANNED_NAMES = {
    "Head", 
    "HumanoidRootPart", 
    "Humanoid"
};
for _, v24 in ipairs({
    "Body Colors", 
    "Shirt Graphic", 
    "Shirt", 
    "Pants", 
    "Health", 
    "Animate"
}) do
    table.insert(v18.EXTRA_BANNED_NAMES, v24);
end;
v20 = v1.Dictionary.join(v18.R6_BODY_PARTS, v18.R15_BODY_PARTS, v18.EXTRA_BANNED_NAMES);
local v25 = {};
for _, v27 in pairs(v20) do
    v25[v27] = true;
end;
v18.BANNED_NAMES = v25;
v18.ASSET_STATUS = {
    UNKNOWN = "Unknown", 
    REVIEW_PENDING = "ReviewPending", 
    MODERATED = "Moderated"
};
v18.ASSET_TYPE_INFO = {};
v18.ASSET_TYPE_INFO[Enum.AssetType.Hat] = {
    attachmentNames = {
        "HatAttachment"
    }, 
    bounds = {
        HatAttachment = {
            size = Vector3.new(3, 4, 3)
        }
    }, 
    rigidAllowed = true
};
v18.ASSET_TYPE_INFO[Enum.AssetType.HairAccessory] = {
    attachmentNames = {
        "HairAttachment"
    }, 
    bounds = {
        HairAttachment = {
            size = Vector3.new(3, 5, 3.5), 
            offset = Vector3.new(0, -0.5, 0.25)
        }
    }, 
    rigidAllowed = true
};
v19 = {
    size = Vector3.new(3, 2, 2)
};
v18.ASSET_TYPE_INFO[Enum.AssetType.FaceAccessory] = {
    attachmentNames = {
        "FaceFrontAttachment", 
        "FaceCenterAttachment"
    }, 
    bounds = {
        FaceFrontAttachment = v19, 
        FaceCenterAttachment = v19
    }, 
    rigidAllowed = true
};
v18.ASSET_TYPE_INFO[Enum.AssetType.NeckAccessory] = {
    attachmentNames = {
        "NeckAttachment"
    }, 
    bounds = {
        NeckAttachment = {
            size = Vector3.new(3, 3, 2)
        }
    }, 
    rigidAllowed = true
};
v20 = {
    size = Vector3.new(3, 3, 3)
};
v18.ASSET_TYPE_INFO[Enum.AssetType.ShoulderAccessory] = {
    attachmentNames = {
        "NeckAttachment", 
        "LeftCollarAttachment", 
        "RightCollarAttachment", 
        "LeftShoulderAttachment", 
        "RightShoulderAttachment"
    }, 
    bounds = {
        NeckAttachment = {
            size = Vector3.new(7, 3, 3)
        }, 
        LeftCollarAttachment = v20, 
        RightCollarAttachment = v20, 
        LeftShoulderAttachment = v20, 
        RightShoulderAttachment = v20
    }, 
    rigidAllowed = true
};
v18.ASSET_TYPE_INFO[Enum.AssetType.FrontAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }, 
    bounds = {
        BodyFrontAttachment = {
            size = Vector3.new(3, 3, 3)
        }
    }, 
    rigidAllowed = true
};
v18.ASSET_TYPE_INFO[Enum.AssetType.BackAccessory] = {
    attachmentNames = {
        "BodyBackAttachment"
    }, 
    bounds = {
        BodyBackAttachment = {
            size = Vector3.new(10, 7, 4.5), 
            offset = Vector3.new(0, 0, 0.75)
        }
    }, 
    rigidAllowed = true
};
v25 = {
    size = Vector3.new(4, 3.5, 7), 
    offset = Vector3.new(0, -0.25, 0)
};
v18.ASSET_TYPE_INFO[Enum.AssetType.WaistAccessory] = {
    attachmentNames = {
        "WaistBackAttachment", 
        "WaistFrontAttachment", 
        "WaistCenterAttachment"
    }, 
    bounds = {
        WaistBackAttachment = v25, 
        WaistFrontAttachment = v25, 
        WaistCenterAttachment = v25
    }, 
    rigidAllowed = true
};
v18.ASSET_TYPE_INFO[Enum.AssetType.TShirtAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.ShirtAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.PantsAccessory] = {
    attachmentNames = {
        "WaistCenterAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.JacketAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.SweaterAccessory] = {
    attachmentNames = {
        "BodyFrontAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.ShortsAccessory] = {
    attachmentNames = {
        "WaistCenterAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.LeftShoeAccessory] = {
    attachmentNames = {
        "LeftFootAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.RightShoeAccessory] = {
    attachmentNames = {
        "RightFootAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.DressSkirtAccessory] = {
    attachmentNames = {
        "WaistCenterAttachment"
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.EyebrowAccessory] = {
    attachmentNames = {
        "FaceFrontAttachment", 
        "FaceCenterAttachment"
    }, 
    layeredClothingBounds = {
        FaceFrontAttachment = {
            size = Vector3.new(1.5, 0.5, 0.5)
        }, 
        FaceCenterAttachment = {
            size = Vector3.new(1.5, 0.5, 0.5)
        }
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.EyelashAccessory] = {
    attachmentNames = {
        "FaceFrontAttachment", 
        "FaceCenterAttachment"
    }, 
    layeredClothingBounds = {
        FaceFrontAttachment = {
            size = Vector3.new(1.5, 0.5, 0.5)
        }, 
        FaceCenterAttachment = {
            size = Vector3.new(1.5, 0.5, 0.5)
        }
    }
};
v18.AvatarPartScaleTypes = {
    Classic = true, 
    ProportionsSlender = true, 
    ProportionsNormal = true
};
local v28 = v4() / 100;
local v29 = v2() / 100;
local v30 = v3() / 100;
local v31 = v5() / 100;
local v32 = if not v12() then nil else v6() / 100;
local v33 = {
    min = Vector3.new(-v30, -v30, -v30), 
    max = Vector3.new(v30, v30, v30)
};
local v34 = {
    min = Vector3.new(-v28, -v28, -v28), 
    max = Vector3.new(v28, v28, v28)
};
local v35 = {
    min = v33.min, 
    max = Vector3.new(-v31, v33.max.y, v33.max.z)
};
local v36 = {
    min = Vector3.new(v31, v33.min.y, v33.min.z), 
    max = v33.max
};
local v37 = {
    min = Vector3.new(v33.min.x, v29, v33.min.z), 
    max = v33.max
};
local v38 = if not v12() then nil else {
    min = Vector3.new(v33.min.X, v29, -v32), 
    max = Vector3.new(-v29, v33.max.Y, v32)
};
local v39 = if not v12() then nil else {
    min = Vector3.new(v29, v29, -v32), 
    max = Vector3.new(v33.max.X, v33.max.Y, v32)
};
local v40 = if not v12() then nil else {
    min = Vector3.new(-v32, v29, -v32), 
    max = Vector3.new(v32, v33.max.Y, v32)
};
local v41 = {
    min = Vector3.new(v33.min.x, v29, v33.min.z), 
    max = Vector3.new(v33.max.x, v28, v33.max.z)
};
local v42 = {
    min = v33.min, 
    max = Vector3.new(v33.max.x, -v29, v33.max.z)
};
local v43 = if not v12() then nil else {
    min = Vector3.new(v33.min.X, v33.min.Y, -v32), 
    max = Vector3.new(-v29, -v29, v32)
};
local v44 = if not v12() then nil else {
    min = Vector3.new(v29, v33.min.Y, -v32), 
    max = Vector3.new(v33.max.X, -v29, v32)
};
local v45 = if not v12() then nil else {
    min = Vector3.new(-v32, v33.min.Y, -v32), 
    max = Vector3.new(v32, -v29, v32)
};
local v46 = {
    min = v33.min, 
    max = Vector3.new(v33.max.x, v33.max.y, -v29)
};
local v47 = {
    min = Vector3.new(v33.min.x, v33.min.y, v29), 
    max = v33.max
};
v18.ASSET_TYPE_INFO[Enum.AssetType.RightArm] = {
    isBodyPart = true, 
    bounds = {
        Classic = {
            minSize = Vector3.new(0.25, 1.5, 0.25), 
            maxSize = Vector3.new(2, 3, 2)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.25, 1.5, 0.25), 
            maxSize = Vector3.new(1.5, 4, 2)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.25, 1.5, 0.25), 
            maxSize = Vector3.new(2, 4.5, 2)
        }
    }, 
    subParts = {
        RightHand = {
            rigAttachmentToParent = {
                name = "RightWristRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                RightGripAttachment = {
                    bounds = v34
                }
            }
        }, 
        RightUpperArm = {
            rigAttachmentToParent = {
                name = "RightShoulderRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                RightShoulderAttachment = {
                    bounds = v37
                }, 
                RightElbowRigAttachment = {
                    bounds = v42
                }
            }
        }, 
        RightLowerArm = {
            rigAttachmentToParent = {
                name = "RightElbowRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                RightWristRigAttachment = {
                    bounds = v42
                }
            }
        }
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.DynamicHead] = {
    isBodyPart = true, 
    bounds = {
        Classic = {
            minSize = Vector3.new(0.5, 0.5, 0.5), 
            maxSize = Vector3.new(1.5, 1.75, 2)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.5, 0.5, 0.5), 
            maxSize = Vector3.new(2, 2, 2)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.5, 0.5, 0.5), 
            maxSize = Vector3.new(3, 2, 2)
        }
    }, 
    subParts = {
        Head = {
            rigAttachmentToParent = {
                name = "NeckRigAttachment", 
                bounds = v42
            }, 
            otherAttachments = {
                FaceFrontAttachment = {
                    bounds = v46
                }, 
                HatAttachment = {
                    bounds = v37
                }, 
                HairAttachment = {
                    bounds = v37
                }, 
                FaceCenterAttachment = {
                    bounds = v33
                }
            }
        }
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.LeftArm] = {
    isBodyPart = true, 
    bounds = {
        Classic = {
            minSize = Vector3.new(0.25, 1.5, 0.25), 
            maxSize = Vector3.new(2, 3, 2)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.25, 1.5, 0.25), 
            maxSize = Vector3.new(1.5, 4, 2)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.25, 1.5, 0.25), 
            maxSize = Vector3.new(2, 4.5, 2)
        }
    }, 
    subParts = {
        LeftLowerArm = {
            rigAttachmentToParent = {
                name = "LeftElbowRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                LeftWristRigAttachment = {
                    bounds = v42
                }
            }
        }, 
        LeftUpperArm = {
            rigAttachmentToParent = {
                name = "LeftShoulderRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                LeftElbowRigAttachment = {
                    bounds = v42
                }, 
                LeftShoulderAttachment = {
                    bounds = v37
                }
            }
        }, 
        LeftHand = {
            rigAttachmentToParent = {
                name = "LeftWristRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                LeftGripAttachment = {
                    bounds = v34
                }
            }
        }
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.Torso] = {
    isBodyPart = true, 
    bounds = {
        Classic = {
            minSize = Vector3.new(1, 2, 0.7), 
            maxSize = Vector3.new(3.5, 3.25, 2)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(1, 2, 0.7), 
            maxSize = Vector3.new(2.5, 3, 2)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(1, 2, 0.7), 
            maxSize = Vector3.new(4, 3, 2.25)
        }
    }, 
    subParts = {
        UpperTorso = {
            rigAttachmentToParent = {
                name = "WaistRigAttachment", 
                bounds = if not v12() then v42 else v45
            }, 
            otherAttachments = {
                LeftShoulderRigAttachment = {
                    bounds = if not v12() then v35 else v38
                }, 
                RightCollarAttachment = {
                    bounds = v36
                }, 
                BodyBackAttachment = {
                    bounds = v47
                }, 
                NeckRigAttachment = {
                    bounds = v37
                }, 
                BodyFrontAttachment = {
                    bounds = v46
                }, 
                RightShoulderRigAttachment = {
                    bounds = if not v12() then v36 else v39
                }, 
                LeftCollarAttachment = {
                    bounds = v35
                }, 
                NeckAttachment = {
                    bounds = v41
                }
            }
        }, 
        LowerTorso = {
            rigAttachmentToParent = {
                name = "RootRigAttachment", 
                bounds = v33
            }, 
            otherAttachments = {
                WaistCenterAttachment = {
                    bounds = v33
                }, 
                LeftHipRigAttachment = {
                    bounds = if not v12() then v35 else v43
                }, 
                RightHipRigAttachment = {
                    bounds = if not v12() then v36 else v44
                }, 
                WaistRigAttachment = {
                    bounds = if not v12() then v37 else v40
                }, 
                WaistBackAttachment = {
                    bounds = v47
                }, 
                WaistFrontAttachment = {
                    bounds = v46
                }
            }
        }
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.RightLeg] = {
    isBodyPart = true, 
    bounds = {
        Classic = {
            minSize = Vector3.new(0.25, 2, 0.5), 
            maxSize = Vector3.new(1.5, 2.75, 2)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.25, 2, 0.5), 
            maxSize = if not v9() then Vector3.new(1.5, 3, 2) else Vector3.new(1.5, 3.3, 2)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.25, 2, 0.5), 
            maxSize = if not v9() then Vector3.new(1.5, 3, 2) else Vector3.new(1.5, 3.3, 2)
        }
    }, 
    subParts = {
        RightUpperLeg = {
            rigAttachmentToParent = {
                name = "RightHipRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                RightKneeRigAttachment = {
                    bounds = v42
                }
            }
        }, 
        RightFoot = {
            rigAttachmentToParent = {
                name = "RightAnkleRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                RightFootAttachment = {
                    bounds = v33
                }
            }
        }, 
        RightLowerLeg = {
            rigAttachmentToParent = {
                name = "RightKneeRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                RightAnkleRigAttachment = {
                    bounds = v42
                }
            }
        }
    }
};
v18.ASSET_TYPE_INFO[Enum.AssetType.LeftLeg] = {
    isBodyPart = true, 
    bounds = {
        Classic = {
            minSize = Vector3.new(0.25, 2, 0.5), 
            maxSize = Vector3.new(1.5, 2.75, 2)
        }, 
        ProportionsSlender = {
            minSize = Vector3.new(0.25, 2, 0.5), 
            maxSize = if not v9() then Vector3.new(1.5, 3, 2) else Vector3.new(1.5, 3.3, 2)
        }, 
        ProportionsNormal = {
            minSize = Vector3.new(0.25, 2, 0.5), 
            maxSize = if not v9() then Vector3.new(1.5, 3, 2) else Vector3.new(1.5, 3.3, 2)
        }
    }, 
    subParts = {
        LeftFoot = {
            rigAttachmentToParent = {
                name = "LeftAnkleRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                LeftFootAttachment = {
                    bounds = v33
                }
            }
        }, 
        LeftUpperLeg = {
            rigAttachmentToParent = {
                name = "LeftHipRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                LeftKneeRigAttachment = {
                    bounds = v42
                }
            }
        }, 
        LeftLowerLeg = {
            rigAttachmentToParent = {
                name = "LeftKneeRigAttachment", 
                bounds = v37
            }, 
            otherAttachments = {
                LeftAnkleRigAttachment = {
                    bounds = v42
                }
            }
        }
    }
};
v18.RenderVsWrapMeshMaxDiff = 1;
v18.LC_BOUNDS = {
    size = Vector3.new(8, 8, 8)
};
v18.PROPERTIES = {
    Instance = {
        Archivable = true
    }, 
    Attachment = {
        Visible = false
    }, 
    SpecialMesh = {
        MeshType = Enum.MeshType.FileMesh, 
        Offset = Vector3.new(0, 0, 0), 
        VertexColor = Vector3.new(1, 1, 1)
    }, 
    BasePart = {
        Anchored = false, 
        Color = BrickColor.new("Medium stone grey").Color, 
        CollisionGroupId = 0, 
        CustomPhysicalProperties = v1.None, 
        Elasticity = 0.5, 
        Friction = 0.3, 
        LocalTransparencyModifier = 0, 
        Massless = false, 
        Reflectance = 0, 
        RootPriority = 0, 
        RotVelocity = Vector3.new(0, 0, 0), 
        Transparency = 0, 
        Velocity = Vector3.new(0, 0, 0), 
        BackParamA = -0.5, 
        BackParamB = 0.5, 
        BackSurfaceInput = Enum.InputType.NoInput, 
        BottomParamA = -0.5, 
        BottomParamB = 0.5, 
        BottomSurfaceInput = Enum.InputType.NoInput, 
        FrontParamA = -0.5, 
        FrontParamB = 0.5, 
        FrontSurfaceInput = Enum.InputType.NoInput, 
        LeftParamA = -0.5, 
        LeftParamB = 0.5, 
        LeftSurfaceInput = Enum.InputType.NoInput, 
        RightParamA = -0.5, 
        RightParamB = 0.5, 
        RightSurfaceInput = Enum.InputType.NoInput, 
        TopParamA = -0.5, 
        TopParamB = 0.5, 
        TopSurfaceInput = Enum.InputType.NoInput, 
        BackSurface = Enum.SurfaceType.Smooth, 
        BottomSurface = Enum.SurfaceType.Smooth, 
        FrontSurface = Enum.SurfaceType.Smooth, 
        LeftSurface = Enum.SurfaceType.Smooth, 
        RightSurface = Enum.SurfaceType.Smooth, 
        TopSurface = Enum.SurfaceType.Smooth
    }, 
    Part = {
        Shape = Enum.PartType.Block
    }, 
    SurfaceAppearance = if not v10() then nil else {
        AlphaMode = Enum.AlphaMode.Overlay
    }
};
v18.CONTENT_ID_FIELDS = {
    SpecialMesh = {
        "MeshId", 
        "TextureId"
    }, 
    MeshPart = {
        "MeshId", 
        "TextureID"
    }, 
    SurfaceAppearance = {
        "ColorMap", 
        "MetalnessMap", 
        "NormalMap", 
        "RoughnessMap"
    }, 
    WrapLayer = {
        "CageMeshId", 
        "ReferenceMeshId"
    }, 
    WrapTarget = {
        "CageMeshId"
    }
};
v18.CONTENT_ID_REQUIRED_FIELDS = {
    SpecialMesh = {
        MeshId = true, 
        TextureId = true
    }, 
    MeshPart = {
        MeshId = true
    }, 
    WrapTarget = {
        CageMeshId = true
    }
};
v18.MESH_CONTENT_ID_FIELDS = {
    SpecialMesh = {
        "MeshId"
    }, 
    MeshPart = {
        "MeshId"
    }, 
    WrapTarget = {
        "CageMeshId"
    }, 
    WrapLayer = if not v7() then nil else {
        "CageMeshId", 
        "ReferenceMeshId"
    }
};
v18.TEXTURE_CONTENT_ID_FIELDS = {
    SpecialMesh = {
        "TextureId"
    }, 
    MeshPart = {
        "TextureID"
    }, 
    SurfaceAppearance = {
        "ColorMap", 
        "MetalnessMap", 
        "NormalMap", 
        "RoughnessMap"
    }
};
v18.ASSET_RENDER_MESH_MAX_TRIANGLES = {
    DynamicHead = 4000, 
    LeftArm = 1248, 
    RightArm = 1248, 
    Torso = 1750, 
    LeftLeg = 1248, 
    RightLeg = 1248
};
v18.WRAP_TARGET_CAGE_MESH_UV_COUNTS = {
    Head = 343, 
    LeftUpperArm = 77, 
    LeftLowerArm = 77, 
    LeftHand = 86, 
    RightUpperArm = 77, 
    RightLowerArm = 77, 
    RightHand = 86, 
    UpperTorso = 257, 
    LowerTorso = 105, 
    LeftUpperLeg = 88, 
    LeftLowerLeg = 88, 
    LeftFoot = 86, 
    RightUpperLeg = 88, 
    RightLowerLeg = 88, 
    RightFoot = 86
};
if v8() then
    v18.PACKAGE_CONTENT_ID_FIELDS = v1.Dictionary.join(v18.CONTENT_ID_FIELDS, if not v11() then {
        Sound = {
            "SoundId"
        }, 
        Decal = {
            "Texture"
        }, 
        VideoFrame = {
            "Video"
        }, 
        PackageLink = {
            "PackageId"
        }, 
        CharacterMesh = {
            "baseTextureAssetId", 
            "overlayTextureAssetId", 
            "meshAssetId"
        }, 
        Tool = {
            "TextureId"
        }, 
        Sky = {
            "SkyUp", 
            "SkyLf", 
            "SkyRt", 
            "SkyBk", 
            "SkyFt", 
            "SkyDn", 
            "Sun", 
            "Moon"
        }, 
        Trail = {
            "texture"
        }, 
        Beam = {
            "texture"
        }, 
        ShirtGraphic = {
            "Graphic"
        }, 
        Shirt = {
            "ShirtTemplate"
        }, 
        Pants = {
            "PantsTemplate"
        }, 
        AdGui = {
            "FallbackImage"
        }
    } else {
        Sound = {
            "SoundId"
        }, 
        Decal = {
            "Texture"
        }, 
        VideoFrame = {
            "Video"
        }, 
        PackageLink = {
            "PackageId"
        }, 
        CharacterMesh = {
            "OverlayTextureId", 
            "MeshId", 
            "BaseTextureId"
        }, 
        Tool = {
            "TextureId"
        }, 
        Trail = {
            "Texture"
        }, 
        Beam = {
            "Texture"
        }, 
        ShirtGraphic = {
            "Graphic"
        }, 
        Shirt = {
            "ShirtTemplate"
        }, 
        Pants = {
            "PantsTemplate"
        }, 
        AdGui = {
            "FallbackImage"
        }
    });
    v18.ExperienceAuthHeaderKey = "RBX-ExperienceAuthorization";
    v18.ContentType = "Content-Type";
    v18.ApplicationJson = "application/json";
end;
v18.GUIDAttributeName = "RBXGUID";
v18.GUIDAttributeMaxLength = 100;
return v18;
