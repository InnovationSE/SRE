Plesmo = {}

function Plesmo.init()

Plesmo.ResourceA = Plesmo.query('Search Device usage:Energy and loc:SPM')
Plesmo.ResourceB = Plesmo.query('Search Device usage:Energy and loc:AC')
Plesmo.ResourceC = Plesmo.query('Search Device usage:Energy and loc:PO')

Plesmo.subscribe('(@dt0p34[' .. Plesmo.ResourceA .. ']WHr < 0.416666667 and @dt0p38[' .. Plesmo.ResourceB .. ']WHr < 0.555555556 and @dt0p4[' .. Plesmo.ResourceC .. ']WHr < 0.138888889)', 'StackLight', 'setOff', 'StackLight1' )
Plesmo.subscribe('(@dt0p34[' .. Plesmo.ResourceA .. ']WHr > 0.416666667 and @dt0p38[' .. Plesmo.ResourceB .. ']WHr > 0.555555556 and @dt0p4[' .. Plesmo.ResourceC .. ']WHr < 0.138888889) or (@dt0p34[' .. Plesmo.ResourceA .. ']WHr > 0.416666667 and @dt0p38[' .. Plesmo.ResourceB .. ']WHr > 0.555555556 and @dt0p4[' .. Plesmo.ResourceC .. ']WHr > 0.138888889)', 'StackLight', 'setActive', 'StackLight1' )
Plesmo.subscribe('(@dt0p34[' .. Plesmo.ResourceA .. ']WHr < 0.416666667 and @dt0p38[' .. Plesmo.ResourceB .. ']WHr > 0.555555556 and @dt0p4[' .. Plesmo.ResourceC .. ']WHr < 0.138888889) or (@dt0p34[' .. Plesmo.ResourceA .. ']WHr < 0.416666667 and @dt0p38[' .. Plesmo.ResourceB .. ']WHr > 0.555555556 and @dt0p4[' .. Plesmo.ResourceC .. ']WHr > 0.138888889) or (@dt0p34[' .. Plesmo.ResourceA .. ']WHr > 0.416666667 and @dt0p38[' .. Plesmo.ResourceB .. ']WHr < 0.555555556 and @dt0p4[' .. Plesmo.ResourceC .. ']WHr < 0.138888889) or (@dt0p34[' .. Plesmo.ResourceA .. ']WHr > 0.416666667 and @dt0p38[' .. Plesmo.ResourceB .. ']WHr < 0.555555556 and @dt0p4[' .. Plesmo.ResourceC .. ']WHr > 0.138888889)', 'StackLight', 'setWarning', 'StackLight1' )
Plesmo.subscribe('(@dt0p34[' .. Plesmo.ResourceA .. ']WHr < 0.416666667 and @dt0p38[' .. Plesmo.ResourceB .. ']WHr < 0.555555556 and @dt0p4[' .. Plesmo.ResourceC .. ']WHr > 0.138888889)', 'StackLight', 'setEconomic', 'StackLight1' )
end

function Plesmo.info()
	return 'engines for illuminating stacklight'
end

function Plesmo.subscribe(...) 
	 return engine.subscribe('Plesmo',...) 
end


function Plesmo.query(...) 
	return engine.query('Plesmo',...) 
end

function Plesmo.finalize() 
end
