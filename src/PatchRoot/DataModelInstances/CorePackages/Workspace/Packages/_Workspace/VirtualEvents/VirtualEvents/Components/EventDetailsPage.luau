local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useDeviceType_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppHooks).useDeviceType;
local _ = require(l_script_FirstAncestor_0.Parent.RobloxAppEnums);
local v8 = require(l_script_FirstAncestor_0.Common.getEventTimerStatus);
local v9 = require(l_script_FirstAncestor_0.Common.findFirstImageInMedia);
local v10 = require(l_script_FirstAncestor_0.Common.getGalleryItems);
local v11 = require(l_script_FirstAncestor_0.Hooks.useActionBarProps);
local v12 = require(l_script_FirstAncestor_0.Components.EventTimer);
local v13 = require(l_script_FirstAncestor_0.Components.EventDescription);
local v14 = require(l_script_FirstAncestor_0.Components.EventHostedBy);
local v15 = require(l_script_FirstAncestor_0.Components.Attendance);
local v16 = require(l_script_FirstAncestor_0.requests);
local _ = require(l_script_FirstAncestor_0.types);
local l_getFFlagHorizontalMediaOnEventDetailsPage_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).getFFlagHorizontalMediaOnEventDetailsPage;
local l_useMutation_0 = v1.useMutation;
local l_DetailsPageTemplate_0 = v5.App.Template.DetailsPage.DetailsPageTemplate;
local l_ContentPosition_0 = v5.App.Template.DetailsPage.Enum.ContentPosition;
local l_MediaGalleryPreview_0 = v5.App.Container.MediaGalleryPreview;
local l_MediaGalleryHorizontal_0 = v5.App.Container.MediaGalleryHorizontal;
local l_ListTable_0 = v5.App.Table.ListTable;
local function v25()
end;
local v26 = {
    onClose = v25, 
    onJoinEvent = v25, 
    onShare = v25
};
return function(v27)
    local v28 = v3.Dictionary.join(v26, v27);
    local l_media_0 = v27.virtualEvent.media;
    local l_experienceDetails_0 = v27.virtualEvent.experienceDetails;
    local v31 = if not l_media_0 then nil else v9(l_media_0);
    local v32, v33 = v4.useState(0);
    local v34 = l_useDeviceType_0();
    local v35 = v4.useMemo(function()
        return v10(l_media_0);
    end, {
        l_media_0
    });
    local v42 = l_useMutation_0(v16.UPDATE_RSVP_STATUS, {
        variables = {
            virtualEventId = v27.virtualEvent.id
        }, 
        update = function(_, v37, v38)
            local l_virtualEvent_0 = v38.data.virtualEventRsvp.virtualEvent;
            v37:modify({
                id = v37:identify(l_virtualEvent_0), 
                fields = {
                    rsvpCounters = function(_, v41)
                        return v3.Dictionary.join(v41, {
                            going = v41.going + (l_virtualEvent_0.userRsvpStatus == "going" and 1 or -1)
                        });
                    end
                }
            });
        end
    });
    local v43 = v4.useMemo(function()
        return v8(v28.virtualEvent, v28.currentTime);
    end, {
        v28.virtualEvent, 
        v28.currentTime
    });
    local v46 = v4.useCallback(function(v44)
        local l_Offset_0 = l_MediaGalleryPreview_0:calcSizesFromWidth(v44.AbsoluteSize.X, 5).contentSize.Y.Offset;
        if l_Offset_0 ~= v32 then
            v33(l_Offset_0);
        end;
    end, {
        v32
    });
    local v49 = v11(v28.virtualEvent, v43, {
        onClose = v28.onClose, 
        onJoinEvent = v28.onJoinEvent, 
        onShare = v28.onShare, 
        onRsvpChanged = v4.useCallback(function()
            local _ = nil;
            v42[1]({
                variables = {
                    rsvpStatus = v28.virtualEvent.userRsvpStatus ~= "going" and "going" or "notGoing"
                }
            }):andThen(function(v48)
                if v28.onRsvpChanged then
                    v28.onRsvpChanged(v48.data.virtualEventRsvp.rsvpStatus, v48.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal);
                end;
            end);
        end, {
            v28.virtualEvent
        })
    });
    return v4.createElement(l_DetailsPageTemplate_0, {
        deviceType = v34, 
        titleText = v27.virtualEvent.eventStatus == "moderated" and "[CONTENT MODERATED]" or v28.virtualEvent.title, 
        thumbnailImageUrl = v31, 
        thumbnailAspectRatio = Vector2.new(16, 9), 
        renderInfoContent = function()
            return v4.createElement(v12, {
                virtualEvent = v28.virtualEvent, 
                status = v43, 
                currentTime = v28.currentTime
            });
        end, 
        actionBarProps = if not v4.useMemo(function()
            return v49.button or #v49.icons > 0;
        end, {
            v49
        }) then nil else v49, 
        componentList = if v27.virtualEvent.eventStatus ~= "cancelled" and v27.virtualEvent.eventStatus ~= "moderated" then {
            Attendance = if v43 ~= "Elapsed" then {
                portraitLayoutOrder = 1, 
                landscapePosition = l_ContentPosition_0.Left, 
                landscapeLayoutOrder = 1, 
                renderComponent = function()
                    return v4.createElement(v15, {
                        virtualEvent = v28.virtualEvent, 
                        eventStatus = v43
                    });
                end
            } else nil, 
            MediaGallery = {
                portraitLayoutOrder = 2, 
                landscapePosition = l_ContentPosition_0.Right, 
                landscapeLayoutOrder = 1, 
                renderComponent = function()
                    if not l_getFFlagHorizontalMediaOnEventDetailsPage_0() then
                        return v4.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, v32), 
                            BackgroundTransparency = 1, 
                            [v4.Change.AbsoluteSize] = v46
                        }, {
                            Gallery = v4.createElement(l_MediaGalleryPreview_0, {
                                items = v35, 
                                numberOfThumbnails = 5
                            })
                        });
                    else
                        return v4.createElement(l_MediaGalleryHorizontal_0, {
                            items = v35
                        });
                    end;
                end
            }, 
            Description = {
                portraitLayoutOrder = 3, 
                landscapePosition = l_ContentPosition_0.Left, 
                landscapeLayoutOrder = 2, 
                renderComponent = function()
                    return v4.createElement(v13, {
                        description = v28.virtualEvent.description, 
                        experienceName = if not l_experienceDetails_0 then nil else l_experienceDetails_0.name, 
                        experienceThumbnail = v31, 
                        onExperienceTileActivated = v28.onExperienceTileActivated
                    });
                end
            }, 
            EventInfo = if not v28.virtualEvent.host then nil else {
                portraitLayoutOrder = 4, 
                landscapePosition = l_ContentPosition_0.Right, 
                landscapeLayoutOrder = 2, 
                renderComponent = function()
                    return v4.createElement(l_ListTable_0, {
                        cells = {
                            v4.createElement(v14, {
                                host = v28.virtualEvent.host, 
                                onActivated = v28.onHostActivated
                            })
                        }
                    });
                end
            }
        } else {}, 
        onClose = v28.onClose
    });
end;
