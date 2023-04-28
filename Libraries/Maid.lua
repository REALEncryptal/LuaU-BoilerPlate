local Maid = {}
Maid.__index = Maid

function Maid.new()
	local self = setmetatable({}, Maid)
	
	self.Objects = {}
	
	return self
end

function Maid:Discover(Object)
	table.insert(self.Objects, Object)
end

function Maid:Cleanup()
	for i, Object in ipairs(self.Objects) do
		if typeof(Object) == "Instance" then
			Object:Destroy()
		elseif typeof(Object) == "RBXScriptConnection" then
			Object:Disconnect()
		end
		self.Objects[i] = nil
	end
end

return Maid