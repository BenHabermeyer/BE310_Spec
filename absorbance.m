%blank measurement
blank = 2.73 %V

%Voltages and concentrations 
volt = [2.66 1.75 1.43 1.36 0.9]; %V
conc = [1 3 10 30 90];

%Convert to absorbance
absorbancedata = -log10(volt/blank);

%Plot
figure()
semilogx(conc, absorbancedata)

%Model
model = fitlm(log10(conc), absorbancedata, 'Intercept', false)