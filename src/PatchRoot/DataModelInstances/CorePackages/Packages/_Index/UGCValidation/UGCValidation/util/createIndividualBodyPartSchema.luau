local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.flags.getFFlagUseUGCValidationContext);
local v3 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v4 = require(l_Parent_0.Constants);
return function(v5, v6, v7)
    local v8 = not not v2() and if v3() and v7 then v7.allowEditableInstances else false;
    local v9 = v4.ASSET_TYPE_INFO[v5].subParts[v6];
    local v10 = {
        ClassName = "MeshPart", 
        Name = {
            v6
        }, 
        _children = {
            {
                Name = {
                    "AvatarPartScaleType"
                }, 
                ClassName = "StringValue"
            }, 
            {
                Name = {
                    v6, 
                    v6 .. "WrapTarget", 
                    "WrapTarget"
                }, 
                ClassName = "WrapTarget", 
                _children = if not v8 then nil else {
                    {
                        Name = {
                            "EditableMesh"
                        }, 
                        ClassName = "EditableMesh", 
                        _optional = true
                    }
                }
            }, 
            {
                Name = {
                    "SurfaceAppearance"
                }, 
                ClassName = "SurfaceAppearance", 
                _optional = true, 
                _children = if not v8 then nil else {
                    {
                        Name = {
                            "EditableImage"
                        }, 
                        ClassName = "EditableImage", 
                        _optional = true
                    }
                }
            }
        }
    };
    if v8 then
        table.insert(v10._children, {
            Name = {
                "EditableMesh"
            }, 
            ClassName = "EditableMesh", 
            _optional = true
        });
    end;
    table.insert(v10._children, {
        Name = {
            v9.rigAttachmentToParent.name
        }, 
        ClassName = "Attachment"
    });
    for v11 in pairs(v9.otherAttachments) do
        table.insert(v10._children, {
            Name = {
                v11
            }, 
            ClassName = "Attachment"
        });
    end;
    return v10;
end;
