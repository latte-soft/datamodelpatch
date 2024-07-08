return function(v0, v1)
    v0:sendEventDeferred("StreamNotification", "StreamNotificationClientEvent", v1);
end;
