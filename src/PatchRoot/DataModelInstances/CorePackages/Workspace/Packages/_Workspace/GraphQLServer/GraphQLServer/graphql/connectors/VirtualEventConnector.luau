local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v4 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local v6 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v6.fetch;
local l_Response_0 = v6.Response;
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local v10 = {};
local v11 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}");
local v12 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps");
local v13 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps/counters");
local v14 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/universes/{id}/virtual-events?cursor={cursor}&limit={limit}&fromUtc={fromUtc}");
local v15 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/notifications/modal-history");
local v16 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/notifications/preferences");
v10.findVirtualEventById = function(v17, v18)
    local v19 = v18 or l_fetch_0;
    return v4.new(function(v20, v21)
        local v22 = v19(v11({
            id = v17
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v22.ok then
            local v23 = v22:json():catch(function()
                return nil;
            end):expect();
            if v23 then
                v20(v23);
                return ;
            else
                v21(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for VirtualEvent matching id: %s.", v17)));
                return ;
            end;
        else
            v21(l_GraphQLError_0.new(string.format("Failed to find VirtualEvent matching id: %s.", v17)));
            return ;
        end;
    end);
end;
v10.findVirtualEventsByUniverseId = function(v24, v25, v26)
    local v27 = v26 or l_fetch_0;
    return v4.new(function(v28, v29)
        local v30 = v27(v14({
            id = v24, 
            cursor = if not not v25 and v25.cursor then v25.cursor else "", 
            limit = if not not v25 and v25.limit then v25.limit else 25, 
            fromUtc = if not not v25 and v25.fromUtc then v25.fromUtc else ""
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v30.ok then
            local v31 = v30:json():catch(function()
                return nil;
            end):expect();
            if v31 then
                v28({
                    cursor = v31.nextPageCursor, 
                    virtualEvents = v31.data
                });
                return ;
            else
                v29(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for experience matching universeId: %i", v24)));
                return ;
            end;
        else
            v29(l_GraphQLError_0.new(string.format("Failed to find experience matching universeId: %i", v24)));
            return ;
        end;
    end);
end;
v10.findRsvpsByVirtualEventId = function(v32, v33)
    local v34 = v33 or l_fetch_0;
    return v4.new(function(v35, v36)
        local v37 = v34(v12({
            id = v32
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v37.ok then
            local v38 = v37:json():catch(function()
                return nil;
            end):expect();
            if v38 then
                v35(v38.data);
                return ;
            else
                v36(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for RSVPs matching VirtualEvent id: %s.", v32)));
                return ;
            end;
        else
            v36(l_GraphQLError_0.new(string.format("Failed to find RSVPs matching VirtualEvent id: %s.", v32)));
            return ;
        end;
    end);
end;
v10.findRsvpCountersByVirtualEventId = function(v39, v40)
    local v41 = v40 or l_fetch_0;
    return v4.new(function(v42, v43)
        local v44 = v41(v13({
            id = v39
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v44.ok then
            local v45 = v44:json():catch(function()
                return nil;
            end):expect();
            if v45 then
                v42(v45.counters);
                return ;
            else
                v43(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for RSVP counters matching VirtualEvent id: %s.", v39)));
                return ;
            end;
        else
            v43(l_GraphQLError_0.new(string.format("Failed to find RSVP counters matching VirtualEvent id: %s.", v39)));
            return ;
        end;
    end);
end;
v10.updateRsvpStatus = function(v46, v47, v48)
    local v49 = v48 or l_fetch_0;
    return v4.new(function(v50, v51)
        local v52 = v49(v12({
            id = v46
        }), {
            method = "POST", 
            body = l_HttpService_0:JSONEncode({
                rsvpStatus = v47
            }), 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v52.ok then
            local v53 = v52:json():catch(function()
                return nil;
            end):expect();
            if v53 then
                v50({
                    shouldSeeNotificationsUpsellModal = v53.shouldSeeNotificationsUpsellModal, 
                    virtualEvent = {
                        id = v46, 
                        userRsvpStatus = v53.rsvpStatus
                    }
                });
                return ;
            else
                v51(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for RSVP status matching VirtualEvent id: %s.", v46)));
                return ;
            end;
        else
            v51(l_GraphQLError_0.new(string.format("Failed to set RSVP status matching VirtualEvent id: %s.", v46)));
            return ;
        end;
    end);
end;
v10.neverShowNotificationModalAgain = function(v54)
    local v55 = v54 or l_fetch_0;
    return v4.new(function(v56, v57)
        if v55(v15(), {
            method = "POST"
        }):catch(function()
            return l_Response_0.error();
        end):expect().ok then
            v56(true);
            return ;
        else
            v57(l_GraphQLError_0.new("Failed to update modal history"));
            return ;
        end;
    end);
end;
v10.enablePushNotifications = function(v58)
    local v59 = v58 or l_fetch_0;
    return v4.new(function(v60, v61)
        if v59(v16(), {
            method = "POST", 
            body = l_HttpService_0:JSONEncode({
                isEnabled = true
            }), 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):catch(function()
            return l_Response_0.error();
        end):expect().ok then
            v60(true);
            return ;
        else
            v61(l_GraphQLError_0.new("Failed to update notification preferences"));
            return ;
        end;
    end);
end;
return v10;
