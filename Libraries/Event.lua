local Event = {}

if game:GetService("RunService"):IsClient() then
	Event.Listeners = {}

	Event.Remote = game.ReplicatedStorage:FindFirstChild("_EventRemote")

	function Event.Listen(EventName, Callback)
		Event.Listeners[EventName] = Callback
	end

	function Event.FireServer(EventName, ...)
		Event.Remote:FireServer(EventName, ...)
	end

	Event.Remote.OnClientEvent:Connect(function(EventName, ...)
		if not Event.Listeners[EventName] then return end
		Event.Listeners[EventName](...)
	end)
else
	Event.Listeners = {}
	
	Event.Remote = Instance.new("RemoteEvent")
	Event.Remote.Name = "_EventRemote"
	Event.Remote.Parent = game.ReplicatedStorage
	
	function Event.Listen(EventName, Callback)
		Event.Listeners[EventName] = Callback
	end
	
	function Event.FireAllClients(EventName, ...)
		Event.Remote:FireAllClients(EventName, ...)
	end
	
	function Event.FireClient(Client, EventName, ...)
		Event.Remote:FireClient(Client, EventName, ...)
	end
	
	Event.Remote.OnServerEvent:Connect(function(EventName, ...)
		if not Event.Listeners[EventName] then return end
		Event.Listeners[EventName](...)
	end)
end

return Event