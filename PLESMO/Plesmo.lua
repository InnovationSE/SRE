Plesmo = {}

function Plesmo.init()

Plesmo.ResourceA = Plesmo.query('Search Device usage:Energy and loc:SPM')
Plesmo.ResourceB = Plesmo.query('Search Device usage:Energy and loc:AC')
Plesmo.ResourceC = Plesmo.query('Search Device usage:Energy and loc:PO')

Plesmo.subscribe('(@dt0p34[' .. Plesmo.ResourceA .. ']WHr < 0.5 and @dt0p34[' .. Plesmo.ResourceB .. ']WHr < 0.5 and @dt0p34[' .. Plesmo.ResourceC .. ']WHr < 0.5)', 'StackLight', 'setOff', 'StackLight1' )
Plesmo.subscribe('(@dt0p34[' .. Plesmo.ResourceA .. ']WHr > 0.5 and @dt0p34[' .. Plesmo.ResourceB .. ']WHr > 0.5 and @dt0p34[' .. Plesmo.ResourceC .. ']WHr < 0.5) or (@dt0p34[' .. Plesmo.ResourceA .. ']WHr > 0.5 and @dt0p34[' .. Plesmo.ResourceB .. ']WHr > 0.5 and @dt0p34[' .. Plesmo.ResourceC .. ']WHr > 0.5)', 'StackLight', 'setActive', 'StackLight1' )
Plesmo.subscribe('(@dt0p34[' .. Plesmo.ResourceA .. ']WHr < 0.5 and @dt0p34[' .. Plesmo.ResourceB .. ']WHr > 0.5 and @dt0p34[' .. Plesmo.ResourceC .. ']WHr < 0.5) or (@dt0p34[' .. Plesmo.ResourceA .. ']WHr < 0.5 and @dt0p34[' .. Plesmo.ResourceB .. ']WHr > 0.5 and @dt0p34[' .. Plesmo.ResourceC .. ']WHr > 0.5) or (@dt0p34[' .. Plesmo.ResourceA .. ']WHr > 0.5 and @dt0p34[' .. Plesmo.ResourceB .. ']WHr < 0.5 and @dt0p34[' .. Plesmo.ResourceC .. ']WHr < 0.5) or (@dt0p34[' .. Plesmo.ResourceA .. ']WHr > 0.5 and @dt0p34[' .. Plesmo.ResourceB .. ']WHr < 0.5 and @dt0p34[' .. Plesmo.ResourceC .. ']WHr > 0.5)', 'StackLight', 'setWarning', 'StackLight1' )
Plesmo.subscribe('(@dt0p34[' .. Plesmo.ResourceA .. ']WHr < 0.5 and @dt0p34[' .. Plesmo.ResourceB .. ']WHr < 0.5 and @dt0p34[' .. Plesmo.ResourceC .. ']WHr > 0.5)', 'StackLight', 'setEconomic', 'StackLight1' )
end

function Plesmo.info()
	return 'Rules for illuminating stacklight'
end

function Plesmo.subscribe(...) 
	 return Rule.subscribe('Plesmo',...) 
end


function Plesmo.query(...) 
	return Rule.query('Plesmo',...) 
end

function Plesmo.finalize() 
end
