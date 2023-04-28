-- Data
shared.Data = {}

for _, Data in ipairs(game.ReplicatedStorage.Data:GetChildren()) do
	shared.Data[Data.Name] = require(Data)
end

--Libraries
function shared.Import(ModuleName)
	return require(game.ReplicatedStorage.Libraries:FindFirstChild(ModuleName))
end

-- Handlers
shared.Handlers = {}

for _, Handler in ipairs(script.Parent.Handlers:GetChildren()) do
	shared.Handlers[Handler.Name] = require(Handler)
end

for _, Handler in pairs(shared.Handlers) do
	Handler.Init()
end